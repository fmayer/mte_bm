# Compiler and flags
CC := ~/Downloads/android-ndk-r27-linux/android-ndk-r27/toolchains/llvm/prebuilt/linux-x86_64/bin/clang
CFLAGS := -v -target aarch64-linux-android34 -march=armv8.5-a+memtag -static -O0

# Source files
SRC := main.c loop.S

# Object files
OBJS := main.o loop.o

# Target executable
TARGET := mte_bm

# Default target
all: $(TARGET)

# Linking step
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Compilation step for each .c file
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compilation step for each .S file
%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)
