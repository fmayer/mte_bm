#define _GNU_SOURCE

#include <sched.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/prctl.h>
#include <sys/auxv.h>
#include <sys/mman.h>
#include <unistd.h>
#include <inttypes.h>
#include <sys/time.h>
/** compile with -std=gnu99 */
#include <stdint.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <time.h>


uint64_t mte_setup = 0;
uint64_t buffer_size = 0;
uint64_t inner_loops = 0;
uint64_t outer_iteration = 0;
uint64_t cpu_pin = 0;
uint64_t gpr = 0;

volatile uint64_t rand_val = 0, rand_val2 = 0;
volatile uint64_t total = 0;

#define MEASURE_TIME(code, header_str)				\
do {								\
	struct timespec start, end;				\
	double elapsed_time;					\
	clock_gettime(CLOCK_MONOTONIC, &start);			\
	{							\
		code;						\
	}							\
	clock_gettime(CLOCK_MONOTONIC, &end);			\
	elapsed_time = (end.tv_sec - start.tv_sec) * 1e9	\
			+ (end.tv_nsec - start.tv_nsec);	\
	printf("%s time is %f ns\n", header_str, elapsed_time);	\
} while (0)

// set tag on the memory region
#define set_tag(tagged_addr) do {					\
	asm volatile("stg %0, [%0]" : : "r" (tagged_addr) : "memory");	\
} while (0)

// Insert with a user-defined tag
#define insert_my_tag(ptr, input_tag)	\
	((unsigned char*)(((uint64_t)(ptr) & ((1ULL << 48)-1)) | ((input_tag) << 56)))

// Insert a random tag
#define insert_random_tag(ptr) ({			\
	uint64_t __val;					\
	asm("irg %0, %1" : "=r" (__val) : "r" (ptr));	\
	__val;						\
})

#define ALIGN_16BYTE(ptr) (ptr & ~(0xf))
#define TAG_VAL 2ULL

typedef struct mte_granule {
	uint64_t obj[2];
} mte_granule_t; /* 16 byte size */

/* create a cyclic pointer chain that covers all words
   in a memory section of the given size in a randomized order */
// Inspired by: https://github.com/afborchert/pointer-chasing/blob/master/random-chase.cpp
void create_random_chain(uint64_t* indices, uint64_t len) {
	// shuffle indices
	for (uint64_t i = 0; i < len; ++i) {
		indices[i] = i;
	}
	for (uint64_t i = 0; i < len-1; ++i) {
		uint64_t j = i + rand()%(len - i);
		if (i != j) {
			uint64_t temp = indices[i];
			indices[i] = indices[j];
			indices[j] = temp;
		}
	}

	total = 0;
}

void pin_cpu(size_t core_ID)
{
	cpu_set_t set;
	CPU_ZERO(&set);
	CPU_SET(core_ID, &set);
	if (sched_setaffinity(0, sizeof(cpu_set_t), &set) < 0) {
		printf("Unable to Set Affinity\n");
		exit(EXIT_FAILURE);
	}
}

int init_mte(uint64_t setup_mte){
	int mte_en = PR_MTE_TCF_SYNC;
	/*
	 * Use the architecture dependent information about the processor
	 * from getauxval() to check if MTE is available.
	 */
	if (!((getauxval(AT_HWCAP2)) & HWCAP2_MTE)){
		printf("MTE is not supported on this hardware\n");
		return EXIT_FAILURE;
	}else{
		printf("MTE is supported\n");
	}
	/*
	 * Enable MTE with synchronous checking
	 */
	if (setup_mte == 2)
		mte_en = PR_MTE_TCF_ASYNC;
	if (setup_mte == 3)
		return 0;
	if (prctl(PR_SET_TAGGED_ADDR_CTRL,
			PR_TAGGED_ADDR_ENABLE | mte_en | (0xfffe << PR_MTE_TAG_SHIFT),
			0, 0, 0)){
		perror("prctl() failed");
		return EXIT_FAILURE;
	}
	return 0;
}

int print_usage()
{
	printf("mte_bm -m <mte setup option> -s <buffer size> -l <inner loop count> -i <outer loop count> -c <pin to cpu #>\n");
	printf("mte setup option: 0 -- buffer is not tagged, 1 -- buffer tagged and async, 2 -- buffer tagged and sync\n");
	printf("inner loop count: # of inside loop\n");
	printf("outer loop count: # of outer loop\n");
	printf("pin to cpu #: cpu number to pin the task to\n");
	return -1;
}

int parse_options(int argc, char *argv[])
{
	int opt, opt_arg;

	if (argc <= 1)
		return print_usage();	

	while ((opt = getopt(argc, argv, "m:l:i:c:g:")) != -1) {
		opt_arg = strtoul(optarg, NULL, 10);
		switch (opt) {
			case 'm':
				mte_setup = opt_arg;
				break;

			case 'l':
				inner_loops = opt_arg;
				break;

			case 'i':
				outer_iteration = opt_arg;
				break;

			case 'c':
				cpu_pin = opt_arg;
				break;
			case 'g':
				gpr = opt_arg;
				break;

			default:
				return print_usage();
		}
	}

	// Optional: remaining non-option arguments
	if (optind < argc) {
		printf("Non-option arguments:\n");
		while (optind < argc)
			printf("  %s\n", argv[optind++]);

		return print_usage();
	}

	return 0;
}

void loop(int workload_iter, uint64_t mte_setup);

void loop_gpr(int workload_iter, uint64_t mte_setup);


void mte_test_bm(uint64_t outer_loop, uint64_t inner_loop,
				uint64_t mte_setup)
{
	for (int i = 0; i < outer_loop; i++) {
		//create_random_chain((uint64_t*)indices, granule_count);

		//__clear_cache(buffer, buffer + buffer_size);
		MEASURE_TIME(
			loop(inner_loop, mte_setup);
			, 
			"MTE_tagstore: Emulation str with sp"
		);

		/* Ensure that mapping goes away from TLBs before next iteration */
		/*
		int ret = madvise(buffer, buffer_size, MADV_DONTNEED);
		ret |= madvise(indices, indices_size, MADV_DONTNEED);

		if (ret != 0) {
			perror("madvise failed");
			exit(EXIT_FAILURE);
		}
		*/
	}
}

void mte_test_bm_gpr(uint64_t outer_loop, uint64_t inner_loop,
				uint64_t mte_setup)
{
	for (int i = 0; i < outer_loop; i++) {
		//create_random_chain((uint64_t*)indices, granule_count);

		//__clear_cache(buffer, buffer + buffer_size);
		MEASURE_TIME(
			loop_gpr(inner_loop, mte_setup);
			, 
			"MTE_tagstore: Emulation of str with GPR"
		);

		/* Ensure that mapping goes away from TLBs before next iteration */
		/*
		int ret = madvise(buffer, buffer_size, MADV_DONTNEED);
		ret |= madvise(indices, indices_size, MADV_DONTNEED);

		if (ret != 0) {
			perror("madvise failed");
			exit(EXIT_FAILURE);
		}
		*/
	}

}

int main(int argc, char *argv[])
{
	int ret_code = 0;

	if ((ret_code = parse_options(argc, argv)))
		return print_usage();

	pin_cpu(cpu_pin);

	if (init_mte(mte_setup)) {
		printf("setting up mte failed\n");
		return -1;
	}
	if (gpr)
		mte_test_bm_gpr(outer_iteration, inner_loops, mte_setup);
	else
		mte_test_bm(outer_iteration, inner_loops, mte_setup);
	return 0;
}