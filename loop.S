	.text
		.globl	loop                            // -- Begin function loop
//	.p2align	2
.p2align 12
	.type	loop,@function
loop:                                   // @loop
	.cfi_startproc
// %bb.0:
                stp     x29, x30, [sp, #-0x20]!
                stp     x28, x19, [sp, #0x10]
                mov     x29, sp
                sub     sp, sp, #0x1, lsl #12   // =0x1000
                mov     x8, sp
                cmp     x1, #0x0
                mov     w9, #0x23               // =35
                mov     w10, #0x3               // =3
                and     x11, x8, #0xff8
                mov     w19, w0
                csel    w2, w10, w9, eq
                and     x0, x8, #0xfffffffffffff000
                orr     x1, x11, #0x1000
                bl      mprotect
                cmp x0, #0x0
                bne 3f
				mov     x0, sp
1:
                cmp     w19, #0x1
                b.lt    2f
                mov     w8, #0xff               // =255
                subs    w19, w19, #0x1
// irg sp, sp
str x8, [sp, #0x0]
str x8, [sp, #0x8]
str x8, [sp, #0x10]
str x8, [sp, #0x18]
str x8, [sp, #0x20]
str x8, [sp, #0x28]
str x8, [sp, #0x30]
str x8, [sp, #0x38]
str x8, [sp, #0x40]
str x8, [sp, #0x48]
str x8, [sp, #0x50]
str x8, [sp, #0x58]
str x8, [sp, #0x60]
str x8, [sp, #0x68]
str x8, [sp, #0x70]
str x8, [sp, #0x78]
str x8, [sp, #0x80]
str x8, [sp, #0x88]
str x8, [sp, #0x90]
str x8, [sp, #0x98]
str x8, [sp, #0xa0]
str x8, [sp, #0xa8]
str x8, [sp, #0xb0]
str x8, [sp, #0xb8]
str x8, [sp, #0xc0]
str x8, [sp, #0xc8]
str x8, [sp, #0xd0]
str x8, [sp, #0xd8]
str x8, [sp, #0xe0]
str x8, [sp, #0xe8]
str x8, [sp, #0xf0]
str x8, [sp, #0xf8]
str x8, [sp, #0x100]
str x8, [sp, #0x108]
str x8, [sp, #0x110]
str x8, [sp, #0x118]
str x8, [sp, #0x120]
str x8, [sp, #0x128]
str x8, [sp, #0x130]
str x8, [sp, #0x138]
str x8, [sp, #0x140]
str x8, [sp, #0x148]
str x8, [sp, #0x150]
str x8, [sp, #0x158]
str x8, [sp, #0x160]
str x8, [sp, #0x168]
str x8, [sp, #0x170]
str x8, [sp, #0x178]
str x8, [sp, #0x180]
str x8, [sp, #0x188]
str x8, [sp, #0x190]
str x8, [sp, #0x198]
str x8, [sp, #0x1a0]
str x8, [sp, #0x1a8]
str x8, [sp, #0x1b0]
str x8, [sp, #0x1b8]
str x8, [sp, #0x1c0]
str x8, [sp, #0x1c8]
str x8, [sp, #0x1d0]
str x8, [sp, #0x1d8]
str x8, [sp, #0x1e0]
str x8, [sp, #0x1e8]
str x8, [sp, #0x1f0]
str x8, [sp, #0x1f8]
str x8, [sp, #0x200]
str x8, [sp, #0x208]
str x8, [sp, #0x210]
str x8, [sp, #0x218]
str x8, [sp, #0x220]
str x8, [sp, #0x228]
str x8, [sp, #0x230]
str x8, [sp, #0x238]
str x8, [sp, #0x240]
str x8, [sp, #0x248]
str x8, [sp, #0x250]
str x8, [sp, #0x258]
str x8, [sp, #0x260]
str x8, [sp, #0x268]
str x8, [sp, #0x270]
str x8, [sp, #0x278]
str x8, [sp, #0x280]
str x8, [sp, #0x288]
str x8, [sp, #0x290]
str x8, [sp, #0x298]
str x8, [sp, #0x2a0]
str x8, [sp, #0x2a8]
str x8, [sp, #0x2b0]
str x8, [sp, #0x2b8]
str x8, [sp, #0x2c0]
str x8, [sp, #0x2c8]
str x8, [sp, #0x2d0]
str x8, [sp, #0x2d8]
str x8, [sp, #0x2e0]
str x8, [sp, #0x2e8]
str x8, [sp, #0x2f0]
str x8, [sp, #0x2f8]
str x8, [sp, #0x300]
str x8, [sp, #0x308]
str x8, [sp, #0x310]
str x8, [sp, #0x318]
str x8, [sp, #0x320]
str x8, [sp, #0x328]
str x8, [sp, #0x330]
str x8, [sp, #0x338]
str x8, [sp, #0x340]
str x8, [sp, #0x348]
str x8, [sp, #0x350]
str x8, [sp, #0x358]
str x8, [sp, #0x360]
str x8, [sp, #0x368]
str x8, [sp, #0x370]
str x8, [sp, #0x378]
str x8, [sp, #0x380]
str x8, [sp, #0x388]
str x8, [sp, #0x390]
str x8, [sp, #0x398]
str x8, [sp, #0x3a0]
str x8, [sp, #0x3a8]
str x8, [sp, #0x3b0]
str x8, [sp, #0x3b8]
str x8, [sp, #0x3c0]
str x8, [sp, #0x3c8]
str x8, [sp, #0x3d0]
str x8, [sp, #0x3d8]
str x8, [sp, #0x3e0]
str x8, [sp, #0x3e8]
str x8, [sp, #0x3f0]
str x8, [sp, #0x3f8]
str x8, [sp, #0x400]
str x8, [sp, #0x408]
str x8, [sp, #0x410]
str x8, [sp, #0x418]
str x8, [sp, #0x420]
str x8, [sp, #0x428]
str x8, [sp, #0x430]
str x8, [sp, #0x438]
str x8, [sp, #0x440]
str x8, [sp, #0x448]
str x8, [sp, #0x450]
str x8, [sp, #0x458]
str x8, [sp, #0x460]
str x8, [sp, #0x468]
str x8, [sp, #0x470]
str x8, [sp, #0x478]
str x8, [sp, #0x480]
str x8, [sp, #0x488]
str x8, [sp, #0x490]
str x8, [sp, #0x498]
str x8, [sp, #0x4a0]
str x8, [sp, #0x4a8]
str x8, [sp, #0x4b0]
str x8, [sp, #0x4b8]
str x8, [sp, #0x4c0]
str x8, [sp, #0x4c8]
str x8, [sp, #0x4d0]
str x8, [sp, #0x4d8]
str x8, [sp, #0x4e0]
str x8, [sp, #0x4e8]
str x8, [sp, #0x4f0]
str x8, [sp, #0x4f8]
str x8, [sp, #0x500]
str x8, [sp, #0x508]
str x8, [sp, #0x510]
str x8, [sp, #0x518]
str x8, [sp, #0x520]
str x8, [sp, #0x528]
str x8, [sp, #0x530]
str x8, [sp, #0x538]
str x8, [sp, #0x540]
str x8, [sp, #0x548]
str x8, [sp, #0x550]
str x8, [sp, #0x558]
str x8, [sp, #0x560]
str x8, [sp, #0x568]
str x8, [sp, #0x570]
str x8, [sp, #0x578]
str x8, [sp, #0x580]
str x8, [sp, #0x588]
str x8, [sp, #0x590]
str x8, [sp, #0x598]
str x8, [sp, #0x5a0]
str x8, [sp, #0x5a8]
str x8, [sp, #0x5b0]
str x8, [sp, #0x5b8]
str x8, [sp, #0x5c0]
str x8, [sp, #0x5c8]
str x8, [sp, #0x5d0]
str x8, [sp, #0x5d8]
str x8, [sp, #0x5e0]
str x8, [sp, #0x5e8]
str x8, [sp, #0x5f0]
str x8, [sp, #0x5f8]
str x8, [sp, #0x600]
str x8, [sp, #0x608]
str x8, [sp, #0x610]
str x8, [sp, #0x618]
str x8, [sp, #0x620]
str x8, [sp, #0x628]
str x8, [sp, #0x630]
str x8, [sp, #0x638]
str x8, [sp, #0x640]
str x8, [sp, #0x648]
str x8, [sp, #0x650]
str x8, [sp, #0x658]
str x8, [sp, #0x660]
str x8, [sp, #0x668]
str x8, [sp, #0x670]
str x8, [sp, #0x678]
str x8, [sp, #0x680]
str x8, [sp, #0x688]
str x8, [sp, #0x690]
str x8, [sp, #0x698]
str x8, [sp, #0x6a0]
str x8, [sp, #0x6a8]
str x8, [sp, #0x6b0]
str x8, [sp, #0x6b8]
str x8, [sp, #0x6c0]
str x8, [sp, #0x6c8]
str x8, [sp, #0x6d0]
str x8, [sp, #0x6d8]
str x8, [sp, #0x6e0]
str x8, [sp, #0x6e8]
str x8, [sp, #0x6f0]
str x8, [sp, #0x6f8]
str x8, [sp, #0x700]
str x8, [sp, #0x708]
str x8, [sp, #0x710]
str x8, [sp, #0x718]
str x8, [sp, #0x720]
str x8, [sp, #0x728]
str x8, [sp, #0x730]
str x8, [sp, #0x738]
str x8, [sp, #0x740]
str x8, [sp, #0x748]
str x8, [sp, #0x750]
str x8, [sp, #0x758]
str x8, [sp, #0x760]
str x8, [sp, #0x768]
str x8, [sp, #0x770]
str x8, [sp, #0x778]
str x8, [sp, #0x780]
str x8, [sp, #0x788]
str x8, [sp, #0x790]
str x8, [sp, #0x798]
str x8, [sp, #0x7a0]
str x8, [sp, #0x7a8]
str x8, [sp, #0x7b0]
str x8, [sp, #0x7b8]
str x8, [sp, #0x7c0]
str x8, [sp, #0x7c8]
str x8, [sp, #0x7d0]
str x8, [sp, #0x7d8]
str x8, [sp, #0x7e0]
str x8, [sp, #0x7e8]
str x8, [sp, #0x7f0]


                b.ne    1b
2:
                add     sp, sp, #0x1, lsl #12   // =0x1000
                ldp     x28, x19, [sp, #0x10]
                ldp     x29, x30, [sp], #0x20
                ret
3:
                brk #0
.Lfunc_end5:
	.size	loop, .Lfunc_end5-loop
	.cfi_endproc
                                        // -- End function
	.globl	loop_gpr                        // -- Begin function loop_gpr
	//.p2align	2
.p2align 12
	.type	loop_gpr,@function
loop_gpr:                               // @loop_gpr
	.cfi_startproc
// %bb.0:
                stp     x29, x30, [sp, #-0x20]!
                stp     x28, x19, [sp, #0x10]
                mov     x29, sp
                sub     sp, sp, #0x1, lsl #12   // =0x1000
                mov     x8, sp
                cmp     x1, #0x0
                mov     w9, #0x23               // =35
                mov     w10, #0x3               // =3
                and     x11, x8, #0xff8
                mov     w19, w0
                csel    w2, w10, w9, eq
                and     x0, x8, #0xfffffffffffff000
                orr     x1, x11, #0x1000
                bl      mprotect
                cmp x0, #0x0
                bne 3f
				mov     x0, sp
1:
                cmp     w19, #0x1
                b.lt    2f
                mov     w8, #0xff               // =255
                subs    w19, w19, #0x1
// str     x8, [x0, #0x7f8]
// irg x0, x0
str x8, [x0, #0x0]
str x8, [x0, #0x8]
str x8, [x0, #0x10]
str x8, [x0, #0x18]
str x8, [x0, #0x20]
str x8, [x0, #0x28]
str x8, [x0, #0x30]
str x8, [x0, #0x38]
str x8, [x0, #0x40]
str x8, [x0, #0x48]
str x8, [x0, #0x50]
str x8, [x0, #0x58]
str x8, [x0, #0x60]
str x8, [x0, #0x68]
str x8, [x0, #0x70]
str x8, [x0, #0x78]
str x8, [x0, #0x80]
str x8, [x0, #0x88]
str x8, [x0, #0x90]
str x8, [x0, #0x98]
str x8, [x0, #0xa0]
str x8, [x0, #0xa8]
str x8, [x0, #0xb0]
str x8, [x0, #0xb8]
str x8, [x0, #0xc0]
str x8, [x0, #0xc8]
str x8, [x0, #0xd0]
str x8, [x0, #0xd8]
str x8, [x0, #0xe0]
str x8, [x0, #0xe8]
str x8, [x0, #0xf0]
str x8, [x0, #0xf8]
str x8, [x0, #0x100]
str x8, [x0, #0x108]
str x8, [x0, #0x110]
str x8, [x0, #0x118]
str x8, [x0, #0x120]
str x8, [x0, #0x128]
str x8, [x0, #0x130]
str x8, [x0, #0x138]
str x8, [x0, #0x140]
str x8, [x0, #0x148]
str x8, [x0, #0x150]
str x8, [x0, #0x158]
str x8, [x0, #0x160]
str x8, [x0, #0x168]
str x8, [x0, #0x170]
str x8, [x0, #0x178]
str x8, [x0, #0x180]
str x8, [x0, #0x188]
str x8, [x0, #0x190]
str x8, [x0, #0x198]
str x8, [x0, #0x1a0]
str x8, [x0, #0x1a8]
str x8, [x0, #0x1b0]
str x8, [x0, #0x1b8]
str x8, [x0, #0x1c0]
str x8, [x0, #0x1c8]
str x8, [x0, #0x1d0]
str x8, [x0, #0x1d8]
str x8, [x0, #0x1e0]
str x8, [x0, #0x1e8]
str x8, [x0, #0x1f0]
str x8, [x0, #0x1f8]
str x8, [x0, #0x200]
str x8, [x0, #0x208]
str x8, [x0, #0x210]
str x8, [x0, #0x218]
str x8, [x0, #0x220]
str x8, [x0, #0x228]
str x8, [x0, #0x230]
str x8, [x0, #0x238]
str x8, [x0, #0x240]
str x8, [x0, #0x248]
str x8, [x0, #0x250]
str x8, [x0, #0x258]
str x8, [x0, #0x260]
str x8, [x0, #0x268]
str x8, [x0, #0x270]
str x8, [x0, #0x278]
str x8, [x0, #0x280]
str x8, [x0, #0x288]
str x8, [x0, #0x290]
str x8, [x0, #0x298]
str x8, [x0, #0x2a0]
str x8, [x0, #0x2a8]
str x8, [x0, #0x2b0]
str x8, [x0, #0x2b8]
str x8, [x0, #0x2c0]
str x8, [x0, #0x2c8]
str x8, [x0, #0x2d0]
str x8, [x0, #0x2d8]
str x8, [x0, #0x2e0]
str x8, [x0, #0x2e8]
str x8, [x0, #0x2f0]
str x8, [x0, #0x2f8]
str x8, [x0, #0x300]
str x8, [x0, #0x308]
str x8, [x0, #0x310]
str x8, [x0, #0x318]
str x8, [x0, #0x320]
str x8, [x0, #0x328]
str x8, [x0, #0x330]
str x8, [x0, #0x338]
str x8, [x0, #0x340]
str x8, [x0, #0x348]
str x8, [x0, #0x350]
str x8, [x0, #0x358]
str x8, [x0, #0x360]
str x8, [x0, #0x368]
str x8, [x0, #0x370]
str x8, [x0, #0x378]
str x8, [x0, #0x380]
str x8, [x0, #0x388]
str x8, [x0, #0x390]
str x8, [x0, #0x398]
str x8, [x0, #0x3a0]
str x8, [x0, #0x3a8]
str x8, [x0, #0x3b0]
str x8, [x0, #0x3b8]
str x8, [x0, #0x3c0]
str x8, [x0, #0x3c8]
str x8, [x0, #0x3d0]
str x8, [x0, #0x3d8]
str x8, [x0, #0x3e0]
str x8, [x0, #0x3e8]
str x8, [x0, #0x3f0]
str x8, [x0, #0x3f8]
str x8, [x0, #0x400]
str x8, [x0, #0x408]
str x8, [x0, #0x410]
str x8, [x0, #0x418]
str x8, [x0, #0x420]
str x8, [x0, #0x428]
str x8, [x0, #0x430]
str x8, [x0, #0x438]
str x8, [x0, #0x440]
str x8, [x0, #0x448]
str x8, [x0, #0x450]
str x8, [x0, #0x458]
str x8, [x0, #0x460]
str x8, [x0, #0x468]
str x8, [x0, #0x470]
str x8, [x0, #0x478]
str x8, [x0, #0x480]
str x8, [x0, #0x488]
str x8, [x0, #0x490]
str x8, [x0, #0x498]
str x8, [x0, #0x4a0]
str x8, [x0, #0x4a8]
str x8, [x0, #0x4b0]
str x8, [x0, #0x4b8]
str x8, [x0, #0x4c0]
str x8, [x0, #0x4c8]
str x8, [x0, #0x4d0]
str x8, [x0, #0x4d8]
str x8, [x0, #0x4e0]
str x8, [x0, #0x4e8]
str x8, [x0, #0x4f0]
str x8, [x0, #0x4f8]
str x8, [x0, #0x500]
str x8, [x0, #0x508]
str x8, [x0, #0x510]
str x8, [x0, #0x518]
str x8, [x0, #0x520]
str x8, [x0, #0x528]
str x8, [x0, #0x530]
str x8, [x0, #0x538]
str x8, [x0, #0x540]
str x8, [x0, #0x548]
str x8, [x0, #0x550]
str x8, [x0, #0x558]
str x8, [x0, #0x560]
str x8, [x0, #0x568]
str x8, [x0, #0x570]
str x8, [x0, #0x578]
str x8, [x0, #0x580]
str x8, [x0, #0x588]
str x8, [x0, #0x590]
str x8, [x0, #0x598]
str x8, [x0, #0x5a0]
str x8, [x0, #0x5a8]
str x8, [x0, #0x5b0]
str x8, [x0, #0x5b8]
str x8, [x0, #0x5c0]
str x8, [x0, #0x5c8]
str x8, [x0, #0x5d0]
str x8, [x0, #0x5d8]
str x8, [x0, #0x5e0]
str x8, [x0, #0x5e8]
str x8, [x0, #0x5f0]
str x8, [x0, #0x5f8]
str x8, [x0, #0x600]
str x8, [x0, #0x608]
str x8, [x0, #0x610]
str x8, [x0, #0x618]
str x8, [x0, #0x620]
str x8, [x0, #0x628]
str x8, [x0, #0x630]
str x8, [x0, #0x638]
str x8, [x0, #0x640]
str x8, [x0, #0x648]
str x8, [x0, #0x650]
str x8, [x0, #0x658]
str x8, [x0, #0x660]
str x8, [x0, #0x668]
str x8, [x0, #0x670]
str x8, [x0, #0x678]
str x8, [x0, #0x680]
str x8, [x0, #0x688]
str x8, [x0, #0x690]
str x8, [x0, #0x698]
str x8, [x0, #0x6a0]
str x8, [x0, #0x6a8]
str x8, [x0, #0x6b0]
str x8, [x0, #0x6b8]
str x8, [x0, #0x6c0]
str x8, [x0, #0x6c8]
str x8, [x0, #0x6d0]
str x8, [x0, #0x6d8]
str x8, [x0, #0x6e0]
str x8, [x0, #0x6e8]
str x8, [x0, #0x6f0]
str x8, [x0, #0x6f8]
str x8, [x0, #0x700]
str x8, [x0, #0x708]
str x8, [x0, #0x710]
str x8, [x0, #0x718]
str x8, [x0, #0x720]
str x8, [x0, #0x728]
str x8, [x0, #0x730]
str x8, [x0, #0x738]
str x8, [x0, #0x740]
str x8, [x0, #0x748]
str x8, [x0, #0x750]
str x8, [x0, #0x758]
str x8, [x0, #0x760]
str x8, [x0, #0x768]
str x8, [x0, #0x770]
str x8, [x0, #0x778]
str x8, [x0, #0x780]
str x8, [x0, #0x788]
str x8, [x0, #0x790]
str x8, [x0, #0x798]
str x8, [x0, #0x7a0]
str x8, [x0, #0x7a8]
str x8, [x0, #0x7b0]
str x8, [x0, #0x7b8]
str x8, [x0, #0x7c0]
str x8, [x0, #0x7c8]
str x8, [x0, #0x7d0]
str x8, [x0, #0x7d8]
str x8, [x0, #0x7e0]
str x8, [x0, #0x7e8]
str x8, [x0, #0x7f0]

                b.ne    1b
2:
                add     sp, sp, #0x1, lsl #12   // =0x1000
                ldp     x28, x19, [sp, #0x10]
                ldp     x29, x30, [sp], #0x20
                ret
3:
                brk #0
.Lfunc_end6:
	.size	loop_gpr, .Lfunc_end6-loop_gpr
	.cfi_endproc
                                        // -- End function
