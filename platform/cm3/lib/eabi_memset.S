	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	__aeabi_memset
	.globl	__aeabi_memclr
	@ order of args differs from traditional memset
	@ r0 - dest, r1 - n, r2 - c
__aeabi_memclr:
	mov	r2,#0
__aeabi_memset:
	cbz	r1,9f
0:	strb	r2,[r0],1
	subs	r1,#1
	bgt	0b
9:	bx	lr

