	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.cpp"
	.global	myRank
	.data
	.align	2
	.type	myRank, %object
	.size	myRank, 4
myRank:
	.word	9999
	.global	mpi_buff
	.bss
	.align	2
	.type	mpi_buff, %object
	.size	mpi_buff, 64
mpi_buff:
	.space	64
	.text
	.align	2
	.global	_Z8MPI_InitPiPPPc
	.type	_Z8MPI_InitPiPPPc, %function
_Z8MPI_InitPiPPPc:
	.fnstart
.LFB2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	mov	r0, #1000
	bl	malloc
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L5
	ldr	r2, [fp, #-8]
	str	r1, [r3, r2, asl #2]
	ldr	r3, .L5
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, asl #2]
	ldr	r0, [fp, #-8]
	mov	r1, r3
	bl	m5_mpi_init
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	mpi_buff
	.fnend
	.size	_Z8MPI_InitPiPPPc, .-_Z8MPI_InitPiPPPc
	.align	2
	.global	_Z8MPI_InitPvPPS_
	.type	_Z8MPI_InitPvPPS_, %function
_Z8MPI_InitPvPPS_:
	.fnstart
.LFB3:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	_Z8MPI_InitPiPPPc
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z8MPI_InitPvPPS_, .-_Z8MPI_InitPvPPS_
	.align	2
	.global	_Z13MPI_Comm_sizeiPi
	.type	_Z13MPI_Comm_sizeiPi, %function
_Z13MPI_Comm_sizeiPi:
	.fnstart
.LFB4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, #16
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z13MPI_Comm_sizeiPi, .-_Z13MPI_Comm_sizeiPi
	.align	2
	.global	_Z13MPI_Comm_rankiPi
	.type	_Z13MPI_Comm_rankiPi, %function
_Z13MPI_Comm_rankiPi:
	.fnstart
.LFB5:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, .L15
	ldr	r2, [r3, #0]
	ldr	r3, .L15+4
	cmp	r2, r3
	bne	.L12
	bl	m5_asgn
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #0]
	ldr	r3, .L15
	str	r2, [r3, #0]
	b	.L13
.L12:
	ldr	r3, .L15
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #0]
.L13:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L16:
	.align	2
.L15:
	.word	myRank
	.word	9999
	.fnend
	.size	_Z13MPI_Comm_rankiPi, .-_Z13MPI_Comm_rankiPi
	.align	2
	.global	_Z8MPI_SendPfiiiii
	.type	_Z8MPI_SendPfiiiii, %function
_Z8MPI_SendPfiiiii:
	.fnstart
.LFB7:
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r2]
	str	r8, [r1, #0]
	add	r2, r2, #4
	subs	r3, r3, #1
	bne	1b
@ 0 "" 2
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z8MPI_SendPfiiiii, .-_Z8MPI_SendPfiiiii
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\012MPI_Send for double\000"
	.text
	.align	2
	.global	_Z8MPI_SendPdiiiii
	.type	_Z8MPI_SendPdiiiii, %function
_Z8MPI_SendPdiiiii:
	.fnstart
.LFB8:
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r0, .L20
	bl	puts
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L21:
	.align	2
.L20:
	.word	.LC2
	.fnend
	.size	_Z8MPI_SendPdiiiii, .-_Z8MPI_SendPdiiiii
	.align	2
	.global	_Z8MPI_RecvPfiiiiiPi
	.type	_Z8MPI_RecvPfiiiiiPi, %function
_Z8MPI_RecvPfiiiiiPi:
	.fnstart
.LFB10:
	@ args = 12, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	b	.L23
.L24:
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r1, #0]
	str	r8, [r2]
	add	r2, r2, #4
	sub	r3, r3, #1

@ 0 "" 2
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
.L23:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L24
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z8MPI_RecvPfiiiiiPi, .-_Z8MPI_RecvPfiiiiiPi
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\012MPI_Recv for double\000"
	.text
	.align	2
	.global	_Z8MPI_RecvPdiiiiiPi
	.type	_Z8MPI_RecvPdiiiiiPi, %function
_Z8MPI_RecvPdiiiiiPi:
	.fnstart
.LFB11:
	@ args = 12, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r0, .L27
	bl	puts
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L28:
	.align	2
.L27:
	.word	.LC3
	.fnend
	.size	_Z8MPI_RecvPdiiiiiPi, .-_Z8MPI_RecvPdiiiiiPi
	.align	2
	.global	_Z9MPI_BcastPiiiii
	.type	_Z9MPI_BcastPiiiii, %function
_Z9MPI_BcastPiiiii:
	.fnstart
.LFB12:
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, .L37
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L30
	ldr	r3, [fp, #-36]
	orr	r3, r3, #-268435456
	orr	r3, r3, #3072
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L31
.L32:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
#APP
@ 233 "../../lib/mpi.h" 1
		ldr	r8, [r2]
	str	r8, [r3, #0]

@ 0 "" 2
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L31:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L32
	b	.L33
.L30:
	ldr	r3, .L37+4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L34
.L35:
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
#APP
@ 254 "../../lib/mpi.h" 1
		ldr	r8, [r1, #0]
	str	r8, [r2]
	add	r2, r2, #4
	sub	r3, r3, #1

@ 0 "" 2
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
.L34:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L35
.L33:
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L38:
	.align	2
.L37:
	.word	myRank
	.word	-268432384
	.cantunwind
	.fnend
	.size	_Z9MPI_BcastPiiiii, .-_Z9MPI_BcastPiiiii
	.align	2
	.global	_Z9MPI_BcastPfiiii
	.type	_Z9MPI_BcastPfiiii, %function
_Z9MPI_BcastPfiiii:
	.fnstart
.LFB13:
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, .L47
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L40
	ldr	r3, [fp, #-36]
	orr	r3, r3, #-268435456
	orr	r3, r3, #3072
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L41
.L42:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
#APP
@ 278 "../../lib/mpi.h" 1
		ldr	r8, [r2]
	str	r8, [r3, #0]

@ 0 "" 2
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L41:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L42
	b	.L43
.L40:
	ldr	r3, .L47+4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L44
.L45:
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
#APP
@ 301 "../../lib/mpi.h" 1
		ldr	r8, [r1, #0]
	str	r8, [r2]
	add	r2, r2, #4
	sub	r3, r3, #1

@ 0 "" 2
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
.L44:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L45
.L43:
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L48:
	.align	2
.L47:
	.word	myRank
	.word	-268432384
	.cantunwind
	.fnend
	.size	_Z9MPI_BcastPfiiii, .-_Z9MPI_BcastPfiiii
	.align	2
	.global	_Z11MPI_ScatterPiiiS_iiii
	.type	_Z11MPI_ScatterPiiiS_iiii, %function
_Z11MPI_ScatterPiiiS_iiii:
	.fnstart
.LFB14:
	@ args = 16, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #16]
	mov	r1, r3
.LEHB0:
	bl	_Z13MPI_Comm_rankiPi
.LEHE0:
	sub	r3, fp, #84
	ldr	r0, [fp, #16]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	bne	.L50
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L51
.L53:
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	beq	.L52
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L52:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L51:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L53
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L54
.L55:
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r1, [fp, #12]
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	str	r3, [fp, #4]
.L54:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L55
	b	.L56
.L50:
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #12]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L57
.L58:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L57:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L58
.L56:
	mov	r3, #0
	b	.L62
.L61:
.LEHB1:
	bl	__cxa_end_cleanup
.LEHE1:
.L62:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA14:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE14-.LLSDACSB14
.LLSDACSB14:
	.uleb128 .LEHB0-.LFB14
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L61-.LFB14
	.uleb128 0
	.uleb128 .LEHB1-.LFB14
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE14:
	.text
	.fnend
	.size	_Z11MPI_ScatterPiiiS_iiii, .-_Z11MPI_ScatterPiiiS_iiii
	.align	2
	.global	_Z11MPI_ScatterPfiiS_iiii
	.type	_Z11MPI_ScatterPfiiS_iiii, %function
_Z11MPI_ScatterPfiiS_iiii:
	.fnstart
.LFB15:
	@ args = 16, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #16]
	mov	r1, r3
.LEHB2:
	bl	_Z13MPI_Comm_rankiPi
.LEHE2:
	sub	r3, fp, #84
	ldr	r0, [fp, #16]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	bne	.L64
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L65
.L68:
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	beq	.L66
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L66:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L65:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L68
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L69
.L70:
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r1, [fp, #12]
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	str	r3, [fp, #4]
.L69:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L70
	b	.L71
.L64:
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #12]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L72
.L73:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L72:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L73
.L71:
	mov	r3, #0
	b	.L78
.L77:
.LEHB3:
	bl	__cxa_end_cleanup
.LEHE3:
.L78:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA15:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE15-.LLSDACSB15
.LLSDACSB15:
	.uleb128 .LEHB2-.LFB15
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L77-.LFB15
	.uleb128 0
	.uleb128 .LEHB3-.LFB15
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE15:
	.text
	.fnend
	.size	_Z11MPI_ScatterPfiiS_iiii, .-_Z11MPI_ScatterPfiiS_iiii
	.align	2
	.global	_Z10MPI_GatherPiiiS_iiii
	.type	_Z10MPI_GatherPiiiS_iiii, %function
_Z10MPI_GatherPiiiS_iiii:
	.fnstart
.LFB16:
	@ args = 16, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #16]
	mov	r1, r3
.LEHB4:
	bl	_Z13MPI_Comm_rankiPi
.LEHE4:
	sub	r3, fp, #84
	ldr	r0, [fp, #16]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	bne	.L80
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L81
.L85:
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	beq	.L82
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	b	.L83
.L84:
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L83:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L84
.L82:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L81:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L85
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L86
.L87:
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r1, [fp, #12]
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	str	r3, [fp, #4]
.L86:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L87
	b	.L88
.L80:
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #12]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L88:
	mov	r3, #0
	b	.L92
.L91:
.LEHB5:
	bl	__cxa_end_cleanup
.LEHE5:
.L92:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA16:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE16-.LLSDACSB16
.LLSDACSB16:
	.uleb128 .LEHB4-.LFB16
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L91-.LFB16
	.uleb128 0
	.uleb128 .LEHB5-.LFB16
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE16:
	.text
	.fnend
	.size	_Z10MPI_GatherPiiiS_iiii, .-_Z10MPI_GatherPiiiS_iiii
	.align	2
	.global	_Z10MPI_GatherPfiiS_iiii
	.type	_Z10MPI_GatherPfiiS_iiii, %function
_Z10MPI_GatherPfiiS_iiii:
	.fnstart
.LFB17:
	@ args = 16, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #16]
	mov	r1, r3
.LEHB6:
	bl	_Z13MPI_Comm_rankiPi
.LEHE6:
	sub	r3, fp, #84
	ldr	r0, [fp, #16]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	bne	.L94
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L95
.L100:
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	beq	.L96
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	b	.L97
.L98:
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L97:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L98
.L96:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L95:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L100
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L101
.L102:
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r1, [fp, #12]
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	str	r3, [fp, #4]
.L101:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L102
	b	.L103
.L94:
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #12]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L103:
	mov	r3, #0
	b	.L108
.L107:
.LEHB7:
	bl	__cxa_end_cleanup
.LEHE7:
.L108:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA17:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE17-.LLSDACSB17
.LLSDACSB17:
	.uleb128 .LEHB6-.LFB17
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L107-.LFB17
	.uleb128 0
	.uleb128 .LEHB7-.LFB17
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE17:
	.text
	.fnend
	.size	_Z10MPI_GatherPfiiS_iiii, .-_Z10MPI_GatherPfiiS_iiii
	.align	2
	.global	_Z8MPI_WaitPiS_
	.type	_Z8MPI_WaitPiS_, %function
_Z8MPI_WaitPiS_:
	.fnstart
.LFB18:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z8MPI_WaitPiS_, .-_Z8MPI_WaitPiS_
	.align	2
	.global	_Z10MPI_ReducePiS_iiiii
	.type	_Z10MPI_ReducePiS_iiiii, %function
_Z10MPI_ReducePiS_iiiii:
	.fnstart
.LFB19:
	@ args = 12, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #156
	str	r0, [fp, #-152]
	str	r1, [fp, #-156]
	str	r2, [fp, #-160]
	str	r3, [fp, #-164]
	ldr	r3, [fp, #-160]
	str	r3, [fp, #-144]
	ldr	r3, .L129
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	bne	.L112
	b	.L113
.L124:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #8]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-140]
	b	.L114
.L118:
	ldr	r2, [fp, #-140]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	beq	.L115
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #2
	sub	r2, fp, #76
	add	r3, r2, r3
	str	r3, [fp, #-136]
	mov	r3, #1
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-140]
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-128]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	str	r3, [fp, #-124]
	b	.L116
.L117:
	ldr	r3, [fp, #-124]
	ldr	r1, [fp, #-136]
	ldr	r2, [fp, #-132]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-136]
	str	r4, [fp, #-132]
.L116:
	ldr	r3, [fp, #-132]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L117
.L115:
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L114:
	ldr	r3, [fp, #-140]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L118
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r2, [fp, #-76]
	str	r2, [r3, #0]
	mov	r3, #1
	str	r3, [fp, #-140]
	b	.L119
.L123:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L120
	ldr	r2, [fp, #-140]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-156]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	.L121
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r1, [fp, #-140]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	ip, fp, #12
	add	r1, ip, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	b	.L121
.L120:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L122
	ldr	r2, [fp, #-140]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-156]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	.L121
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r1, [fp, #-140]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	ip, fp, #12
	add	r1, ip, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	b	.L121
.L122:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L121
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r1, [fp, #-160]
	ldr	r2, [fp, #-144]
	rsb	r2, r2, r1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-156]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r0, [fp, #-140]
	mvn	r2, #63
	mov	r0, r0, asl #2
	sub	ip, fp, #12
	add	r0, ip, r0
	add	r2, r0, r2
	ldr	r2, [r2, #0]
	add	r2, r1, r2
	str	r2, [r3, #0]
.L121:
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L119:
	ldr	r3, [fp, #-140]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L123
	ldr	r3, [fp, #-144]
	sub	r3, r3, #1
	str	r3, [fp, #-144]
.L113:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L124
	b	.L125
.L112:
	ldr	r3, [fp, #-160]
	str	r3, [fp, #-144]
	b	.L126
.L127:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r2, r3
	str	r3, [fp, #-120]
	mov	r3, #1
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-88]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-112]
	mov	r3, #0
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-112]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	ldr	r1, [fp, #-120]
	ldr	r2, [fp, #-116]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-120]
	str	r4, [fp, #-116]
	ldr	r3, [fp, #-144]
	sub	r3, r3, #1
	str	r3, [fp, #-144]
.L126:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L127
.L125:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
.L130:
	.align	2
.L129:
	.word	myRank
	.cantunwind
	.fnend
	.size	_Z10MPI_ReducePiS_iiiii, .-_Z10MPI_ReducePiS_iiiii
	.global	__aeabi_fcmpgt
	.global	__aeabi_fcmplt
	.global	__aeabi_fadd
	.align	2
	.global	_Z10MPI_ReducePfS_iiiii
	.type	_Z10MPI_ReducePfS_iiiii, %function
_Z10MPI_ReducePfS_iiiii:
	.fnstart
.LFB20:
	@ args = 12, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #152
	str	r0, [fp, #-152]
	str	r1, [fp, #-156]
	str	r2, [fp, #-160]
	str	r3, [fp, #-164]
	ldr	r3, [fp, #-160]
	str	r3, [fp, #-144]
	ldr	r3, .L155
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	bne	.L132
	b	.L133
.L147:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r2, r3
	ldr	r2, [r3, #0]	@ float
	ldr	r1, [fp, #8]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]	@ float
	mov	r3, #0
	str	r3, [fp, #-140]
	b	.L134
.L139:
	ldr	r2, [fp, #-140]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	beq	.L135
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #2
	sub	r2, fp, #76
	add	r3, r2, r3
	str	r3, [fp, #-136]
	mov	r3, #1
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-140]
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-128]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	str	r3, [fp, #-124]
	b	.L136
.L137:
	ldr	r3, [fp, #-124]
	ldr	r1, [fp, #-136]
	ldr	r2, [fp, #-132]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-136]
	str	r4, [fp, #-132]
.L136:
	ldr	r3, [fp, #-132]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L137
.L135:
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L134:
	ldr	r3, [fp, #-140]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L139
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r2, [fp, #-76]	@ float
	str	r2, [r3, #0]	@ float
	mov	r3, #1
	str	r3, [fp, #-140]
	b	.L140
.L146:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L141
	ldr	r2, [fp, #-140]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]	@ float
	ldr	r1, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-156]
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L142
.L153:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r1, [fp, #-140]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	b	.L142
.L141:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L144
	ldr	r2, [fp, #-140]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]	@ float
	ldr	r1, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-156]
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L142
.L154:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r1, [fp, #-140]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	b	.L142
.L144:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L142
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r4, r2, r3
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	ldr	r2, [r3, #0]	@ float
	ldr	r1, [fp, #-140]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [r4, #0]	@ float
.L142:
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L140:
	ldr	r3, [fp, #-140]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L146
	ldr	r3, [fp, #-144]
	sub	r3, r3, #1
	str	r3, [fp, #-144]
.L133:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L147
	b	.L148
.L132:
	ldr	r3, [fp, #-160]
	str	r3, [fp, #-144]
	b	.L149
.L151:
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r2, r3
	str	r3, [fp, #-120]
	mov	r3, #1
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-88]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-112]
	mov	r3, #0
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-112]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	ldr	r1, [fp, #-120]
	ldr	r2, [fp, #-116]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-120]
	str	r4, [fp, #-116]
	ldr	r3, [fp, #-144]
	sub	r3, r3, #1
	str	r3, [fp, #-144]
.L149:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L151
.L148:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L156:
	.align	2
.L155:
	.word	myRank
	.cantunwind
	.fnend
	.size	_Z10MPI_ReducePfS_iiiii, .-_Z10MPI_ReducePfS_iiiii
	.global	__aeabi_d2iz
	.global	__aeabi_i2d
	.global	__aeabi_dcmpgt
	.global	__aeabi_dcmplt
	.global	__aeabi_dadd
	.align	2
	.global	_Z10MPI_ReducePdS_iiiii
	.type	_Z10MPI_ReducePdS_iiiii, %function
_Z10MPI_ReducePdS_iiiii:
	.fnstart
.LFB21:
	@ args = 12, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	.save {r4, r5, r6, r7, fp, lr}
	.setfp fp, sp, #20
	add	fp, sp, #20
	.pad #136
	sub	sp, sp, #136
	str	r0, [fp, #-136]
	str	r1, [fp, #-140]
	str	r2, [fp, #-144]
	str	r3, [fp, #-148]
	sub	r3, fp, #132
	ldr	r0, [fp, #12]
	mov	r1, r3
.LEHB8:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #128
	ldr	r0, [fp, #12]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r3, [fp, #-144]
	str	r3, [fp, #-124]
	ldr	r2, [fp, #-132]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	bne	.L158
	b	.L159
.L172:
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-136]
	add	r3, r2, r3
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r1, [fp, #8]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #20
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-120]
	b	.L160
.L164:
	ldr	r2, [fp, #-120]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	beq	.L161
	ldr	r3, [fp, #-120]
	mov	r3, r3, asl #2
	sub	r2, fp, #84
	add	r3, r2, r3
	str	r3, [fp, #-116]
	mov	r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-148]
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-120]
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-92]
	mov	r3, #0
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-108]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-104]
	b	.L162
.L163:
	ldr	r3, [fp, #-104]
	ldr	r1, [fp, #-116]
	ldr	r2, [fp, #-112]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-116]
	str	r4, [fp, #-112]
.L162:
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L163
.L161:
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	str	r3, [fp, #-120]
.L160:
	ldr	r3, [fp, #-128]
	ldr	r2, [fp, #-120]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L164
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-140]
	add	r5, r2, r3
	ldr	r3, [fp, #-84]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L165
.L171:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L166
	ldr	r2, [fp, #-120]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r0
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-140]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L167
.L179:
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-140]
	add	r5, r2, r3
	ldr	r2, [fp, #-120]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #20
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	b	.L167
.L166:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L169
	ldr	r2, [fp, #-120]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r0
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-140]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L167
.L180:
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-140]
	add	r5, r2, r3
	ldr	r2, [fp, #-120]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #20
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	b	.L167
.L169:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L167
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-140]
	add	r7, r2, r3
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-140]
	add	r3, r2, r3
	ldmia	r3, {r5-r6}
	ldr	r2, [fp, #-120]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r0, r5
	mov	r1, r6
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	stmia	r7, {r3-r4}
.L167:
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	str	r3, [fp, #-120]
.L165:
	ldr	r3, [fp, #-128]
	ldr	r2, [fp, #-120]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L171
	ldr	r3, [fp, #-124]
	sub	r3, r3, #1
	str	r3, [fp, #-124]
.L159:
	ldr	r3, [fp, #-124]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L172
	b	.L173
.L158:
	ldr	r3, [fp, #-144]
	str	r3, [fp, #-124]
	b	.L174
.L175:
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-124]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-136]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r0, r3
	mov	r1, #1
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #8]
	bl	_Z8MPI_SendPdiiiii
.LEHE8:
	ldr	r3, [fp, #-124]
	sub	r3, r3, #1
	str	r3, [fp, #-124]
.L174:
	ldr	r3, [fp, #-124]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L175
.L173:
	mov	r3, #0
	b	.L181
.L178:
.LEHB9:
	bl	__cxa_end_cleanup
.LEHE9:
.L181:
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA21:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE21-.LLSDACSB21
.LLSDACSB21:
	.uleb128 .LEHB8-.LFB21
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L178-.LFB21
	.uleb128 0
	.uleb128 .LEHB9-.LFB21
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSE21:
	.text
	.fnend
	.size	_Z10MPI_ReducePdS_iiiii, .-_Z10MPI_ReducePdS_iiiii
	.align	2
	.global	_Z13MPI_AllreducePiS_iiii
	.type	_Z13MPI_AllreducePiS_iiii, %function
_Z13MPI_AllreducePiS_iiii:
	.fnstart
.LFB22:
	@ args = 8, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #224
	sub	sp, sp, #224
	str	r0, [fp, #-224]
	str	r1, [fp, #-228]
	str	r2, [fp, #-232]
	str	r3, [fp, #-236]
	sub	r3, fp, #216
	ldr	r0, [fp, #8]
	mov	r1, r3
.LEHB10:
	bl	_Z13MPI_Comm_rankiPi
.LEHE10:
	sub	r3, fp, #212
	ldr	r0, [fp, #8]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r3, [fp, #-232]
	str	r3, [fp, #-208]
	mov	r3, #0
	str	r3, [fp, #-200]
	ldr	r2, [fp, #-216]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	bne	.L183
	b	.L184
.L198:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-224]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-200]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-204]
	b	.L185
.L189:
	ldr	r2, [fp, #-204]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	beq	.L186
	ldr	r3, [fp, #-204]
	mov	r3, r3, asl #2
	sub	r2, fp, #76
	add	r3, r2, r3
	str	r3, [fp, #-196]
	mov	r3, #1
	str	r3, [fp, #-192]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-204]
	str	r3, [fp, #-188]
	mov	r3, #0
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-124]
	mov	r3, #0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-188]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-188]
	ldr	r3, [fp, #-188]
	str	r3, [fp, #-184]
	b	.L187
.L188:
	ldr	r3, [fp, #-184]
	ldr	r1, [fp, #-196]
	ldr	r2, [fp, #-192]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-196]
	str	r4, [fp, #-192]
.L187:
	ldr	r3, [fp, #-192]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L188
.L186:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L185:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L189
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	ldr	r2, [fp, #-76]
	str	r2, [r3, #0]
	mov	r3, #1
	str	r3, [fp, #-204]
	b	.L190
.L194:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L191
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-228]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	.L192
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	ldr	r1, [fp, #-204]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	ip, fp, #12
	add	r1, ip, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	b	.L192
.L191:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L193
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-228]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	.L192
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	ldr	r1, [fp, #-204]
	mvn	r2, #63
	mov	r1, r1, asl #2
	sub	ip, fp, #12
	add	r1, ip, r1
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	b	.L192
.L193:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L192
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	ldr	r1, [fp, #-232]
	ldr	r2, [fp, #-208]
	rsb	r2, r2, r1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-228]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r0, [fp, #-204]
	mvn	r2, #63
	mov	r0, r0, asl #2
	sub	ip, fp, #12
	add	r0, ip, r0
	add	r2, r0, r2
	ldr	r2, [r2, #0]
	add	r2, r1, r2
	str	r2, [r3, #0]
.L192:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L190:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L194
	mov	r3, #0
	str	r3, [fp, #-204]
	b	.L195
.L197:
	ldr	r2, [fp, #-204]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	beq	.L196
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	str	r3, [fp, #-180]
	mov	r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-204]
	str	r3, [fp, #-172]
	mov	r3, #0
	str	r3, [fp, #-112]
	mov	r3, #0
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-172]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-172]
	ldr	r3, [fp, #-172]
	str	r3, [fp, #-168]
	ldr	r3, [fp, #-168]
	ldr	r1, [fp, #-180]
	ldr	r2, [fp, #-176]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-180]
	str	r4, [fp, #-176]
.L196:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L195:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L197
	ldr	r3, [fp, #-208]
	sub	r3, r3, #1
	str	r3, [fp, #-208]
.L184:
	ldr	r3, [fp, #-208]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L198
	b	.L199
.L183:
	ldr	r3, [fp, #-232]
	str	r3, [fp, #-208]
	b	.L200
.L203:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-224]
	add	r3, r2, r3
	str	r3, [fp, #-164]
	mov	r3, #1
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-200]
	str	r3, [fp, #-156]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-156]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-156]
	ldr	r3, [fp, #-156]
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-152]
	ldr	r1, [fp, #-164]
	ldr	r2, [fp, #-160]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-164]
	str	r4, [fp, #-160]
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	str	r3, [fp, #-148]
	mov	r3, #1
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-200]
	str	r3, [fp, #-140]
	mov	r3, #0
	str	r3, [fp, #-88]
	mov	r3, #0
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-140]
	str	r3, [fp, #-136]
	b	.L201
.L202:
	ldr	r3, [fp, #-136]
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-144]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-148]
	str	r4, [fp, #-144]
.L201:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L202
	ldr	r3, [fp, #-208]
	sub	r3, r3, #1
	str	r3, [fp, #-208]
.L200:
	ldr	r3, [fp, #-208]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L203
.L199:
	mov	r3, #0
	b	.L207
.L206:
.LEHB11:
	bl	__cxa_end_cleanup
.LEHE11:
.L207:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA22:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE22-.LLSDACSB22
.LLSDACSB22:
	.uleb128 .LEHB10-.LFB22
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L206-.LFB22
	.uleb128 0
	.uleb128 .LEHB11-.LFB22
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
.LLSDACSE22:
	.text
	.fnend
	.size	_Z13MPI_AllreducePiS_iiii, .-_Z13MPI_AllreducePiS_iiii
	.global	__aeabi_f2iz
	.global	__aeabi_i2f
	.align	2
	.global	_Z13MPI_AllreducePfS_iiii
	.type	_Z13MPI_AllreducePfS_iiii, %function
_Z13MPI_AllreducePfS_iiii:
	.fnstart
.LFB23:
	@ args = 8, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #224
	sub	sp, sp, #224
	str	r0, [fp, #-224]
	str	r1, [fp, #-228]
	str	r2, [fp, #-232]
	str	r3, [fp, #-236]
	sub	r3, fp, #216
	ldr	r0, [fp, #8]
	mov	r1, r3
.LEHB12:
	bl	_Z13MPI_Comm_rankiPi
.LEHE12:
	sub	r3, fp, #212
	ldr	r0, [fp, #8]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r3, [fp, #-232]
	str	r3, [fp, #-208]
	mov	r3, #0
	str	r3, [fp, #-200]
	ldr	r2, [fp, #-216]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	bne	.L209
	b	.L210
.L227:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-224]
	add	r3, r2, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r2, r0
	ldr	r1, [fp, #-200]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #12
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-204]
	b	.L211
.L215:
	ldr	r2, [fp, #-204]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	beq	.L212
	ldr	r3, [fp, #-204]
	mov	r3, r3, asl #2
	sub	r2, fp, #76
	add	r3, r2, r3
	str	r3, [fp, #-196]
	mov	r3, #1
	str	r3, [fp, #-192]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-204]
	str	r3, [fp, #-188]
	mov	r3, #0
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-124]
	mov	r3, #0
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-188]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-188]
	ldr	r3, [fp, #-188]
	str	r3, [fp, #-184]
	b	.L213
.L214:
	ldr	r3, [fp, #-184]
	ldr	r1, [fp, #-196]
	ldr	r2, [fp, #-192]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-196]
	str	r4, [fp, #-192]
.L213:
	ldr	r3, [fp, #-192]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L214
.L212:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L211:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L215
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r4, r2, r3
	ldr	r3, [fp, #-76]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [r4, #0]	@ float
	mov	r3, #1
	str	r3, [fp, #-204]
	b	.L216
.L222:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L217
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r1, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-228]
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L218
.L238:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r4, r2, r3
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [r4, #0]	@ float
	b	.L218
.L217:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L220
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r1, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r1
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-228]
	add	r3, r1, r3
	ldr	r3, [r3, #0]	@ float
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L218
.L239:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r4, r2, r3
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #12
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [r4, #0]	@ float
	b	.L218
.L220:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L218
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r4, r2, r3
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	ldr	r5, [r3, #0]	@ float
	ldr	r2, [fp, #-204]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #12
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r5
	mov	r1, r3
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [r4, #0]	@ float
.L218:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L216:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L222
	mov	r3, #0
	str	r3, [fp, #-204]
	b	.L223
.L226:
	ldr	r2, [fp, #-204]
	ldr	r3, [fp, #-200]
	cmp	r2, r3
	beq	.L224
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	str	r3, [fp, #-180]
	mov	r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-204]
	str	r3, [fp, #-172]
	mov	r3, #0
	str	r3, [fp, #-112]
	mov	r3, #0
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-172]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-172]
	ldr	r3, [fp, #-172]
	str	r3, [fp, #-168]
	ldr	r3, [fp, #-168]
	ldr	r1, [fp, #-180]
	ldr	r2, [fp, #-176]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-180]
	str	r4, [fp, #-176]
.L224:
	ldr	r3, [fp, #-204]
	add	r3, r3, #1
	str	r3, [fp, #-204]
.L223:
	ldr	r3, [fp, #-212]
	ldr	r2, [fp, #-204]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L226
	ldr	r3, [fp, #-208]
	sub	r3, r3, #1
	str	r3, [fp, #-208]
.L210:
	ldr	r3, [fp, #-208]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L227
	b	.L228
.L209:
	ldr	r3, [fp, #-232]
	str	r3, [fp, #-208]
	b	.L229
.L234:
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-224]
	add	r3, r2, r3
	str	r3, [fp, #-164]
	mov	r3, #1
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-200]
	str	r3, [fp, #-156]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-156]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-156]
	ldr	r3, [fp, #-156]
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-152]
	ldr	r1, [fp, #-164]
	ldr	r2, [fp, #-160]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-164]
	str	r4, [fp, #-160]
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-208]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-228]
	add	r3, r2, r3
	str	r3, [fp, #-148]
	mov	r3, #1
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-236]
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-200]
	str	r3, [fp, #-140]
	mov	r3, #0
	str	r3, [fp, #-88]
	mov	r3, #0
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-140]
	str	r3, [fp, #-136]
	b	.L231
.L232:
	ldr	r3, [fp, #-136]
	ldr	r1, [fp, #-148]
	ldr	r2, [fp, #-144]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-148]
	str	r4, [fp, #-144]
.L231:
	ldr	r3, [fp, #-144]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L232
	ldr	r3, [fp, #-208]
	sub	r3, r3, #1
	str	r3, [fp, #-208]
.L229:
	ldr	r3, [fp, #-208]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L234
.L228:
	mov	r3, #0
	b	.L240
.L237:
.LEHB13:
	bl	__cxa_end_cleanup
.LEHE13:
.L240:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA23:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE23-.LLSDACSB23
.LLSDACSB23:
	.uleb128 .LEHB12-.LFB23
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L237-.LFB23
	.uleb128 0
	.uleb128 .LEHB13-.LFB23
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE23:
	.text
	.fnend
	.size	_Z13MPI_AllreducePfS_iiii, .-_Z13MPI_AllreducePfS_iiii
	.align	2
	.global	_Z13MPI_AllreducePdS_iiii
	.type	_Z13MPI_AllreducePdS_iiii, %function
_Z13MPI_AllreducePdS_iiii:
	.fnstart
.LFB24:
	@ args = 8, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	.save {r4, r5, r6, r7, fp, lr}
	.setfp fp, sp, #20
	add	fp, sp, #20
	.pad #152
	sub	sp, sp, #152
	str	r0, [fp, #-144]
	str	r1, [fp, #-148]
	str	r2, [fp, #-152]
	str	r3, [fp, #-156]
	sub	r3, fp, #136
	ldr	r0, [fp, #8]
	mov	r1, r3
.LEHB14:
	bl	_Z13MPI_Comm_rankiPi
.LEHE14:
	sub	r3, fp, #132
	ldr	r0, [fp, #8]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	ldr	r3, [fp, #-152]
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-120]
	ldr	r2, [fp, #-136]
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	bne	.L242
	b	.L243
.L259:
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-144]
	add	r3, r2, r3
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r1, [fp, #-120]
	mvn	r3, #63
	mov	r1, r1, asl #2
	sub	r0, fp, #20
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-124]
	b	.L244
.L248:
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	beq	.L245
	ldr	r3, [fp, #-124]
	mov	r3, r3, asl #2
	sub	r2, fp, #84
	add	r3, r2, r3
	str	r3, [fp, #-116]
	mov	r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-156]
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-124]
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-92]
	mov	r3, #0
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-108]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-104]
	b	.L246
.L247:
	ldr	r3, [fp, #-104]
	ldr	r1, [fp, #-116]
	ldr	r2, [fp, #-112]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-116]
	str	r4, [fp, #-112]
.L246:
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L247
.L245:
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-124]
.L244:
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #-124]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L248
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r5, r2, r3
	ldr	r3, [fp, #-84]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	mov	r3, #1
	str	r3, [fp, #-124]
	b	.L249
.L255:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L250
	ldr	r2, [fp, #-124]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r0
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-148]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L251
.L268:
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r5, r2, r3
	ldr	r2, [fp, #-124]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #20
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	b	.L251
.L250:
	ldr	r3, [fp, #4]
	cmp	r3, #2
	bne	.L253
	ldr	r2, [fp, #-124]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r1
	mov	r1, r0
	ldr	r0, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r0
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-148]
	add	r3, r0, r3
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L251
.L269:
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r5, r2, r3
	ldr	r2, [fp, #-124]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r0, fp, #20
	add	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	b	.L251
.L253:
	ldr	r3, [fp, #4]
	cmp	r3, #3
	bne	.L251
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r7, r2, r3
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r3, r2, r3
	ldmia	r3, {r5-r6}
	ldr	r2, [fp, #-124]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r0, r5
	mov	r1, r6
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	stmia	r7, {r3-r4}
.L251:
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-124]
.L249:
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #-124]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L255
	mov	r3, #0
	str	r3, [fp, #-124]
	b	.L256
.L258:
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	beq	.L257
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r0, r3
	mov	r1, #1
	ldr	r2, [fp, #-156]
	ldr	r3, [fp, #-124]
.LEHB15:
	bl	_Z8MPI_SendPdiiiii
.LEHE15:
.L257:
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-124]
.L256:
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #-124]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L258
	ldr	r3, [fp, #-128]
	sub	r3, r3, #1
	str	r3, [fp, #-128]
.L243:
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L259
	b	.L260
.L242:
	ldr	r3, [fp, #-152]
	str	r3, [fp, #-128]
	b	.L261
.L262:
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-144]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r0, r3
	mov	r1, #1
	ldr	r2, [fp, #-156]
	ldr	r3, [fp, #-120]
.LEHB16:
	bl	_Z8MPI_SendPdiiiii
	ldr	r2, [fp, #-152]
	ldr	r3, [fp, #-128]
	rsb	r3, r3, r2
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-148]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #0
	str	r2, [sp, #8]
	mov	r0, r3
	mov	r1, #1
	ldr	r2, [fp, #-156]
	ldr	r3, [fp, #-120]
	bl	_Z8MPI_RecvPdiiiiiPi
.LEHE16:
	ldr	r3, [fp, #-128]
	sub	r3, r3, #1
	str	r3, [fp, #-128]
.L261:
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L262
.L260:
	mov	r3, #0
	b	.L270
.L267:
	b	.L265
.L266:
.L265:
.LEHB17:
	bl	__cxa_end_cleanup
.LEHE17:
.L270:
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA24:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE24-.LLSDACSB24
.LLSDACSB24:
	.uleb128 .LEHB14-.LFB24
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L266-.LFB24
	.uleb128 0
	.uleb128 .LEHB15-.LFB24
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L267-.LFB24
	.uleb128 0
	.uleb128 .LEHB16-.LFB24
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L266-.LFB24
	.uleb128 0
	.uleb128 .LEHB17-.LFB24
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSE24:
	.text
	.fnend
	.size	_Z13MPI_AllreducePdS_iiii, .-_Z13MPI_AllreducePdS_iiii
	.align	2
	.global	_Z12MPI_AlltoallPiiiS_iii
	.type	_Z12MPI_AlltoallPiiiS_iii, %function
_Z12MPI_AlltoallPiiiS_iii:
	.fnstart
.LFB25:
	@ args = 12, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #12]
	mov	r1, r3
.LEHB18:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #84
	ldr	r0, [fp, #12]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	bl	m5_barrier
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L272
.L274:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L273
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #5
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L273:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L272:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L274
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L275
.L276:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #4]
	mul	r2, r3, r2
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	ldr	r1, [fp, #-100]
	mul	r1, r2, r1
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L275:
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-76]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L276
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L277
.L281:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L278
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-48]
	mov	r3, #5
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L279
.L280:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L279:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L280
.L278:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L277:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L281
	bl	m5_barrier
.LEHE18:
	mov	r3, #0
	b	.L285
.L284:
.LEHB19:
	bl	__cxa_end_cleanup
.LEHE19:
.L285:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA25:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE25-.LLSDACSB25
.LLSDACSB25:
	.uleb128 .LEHB18-.LFB25
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L284-.LFB25
	.uleb128 0
	.uleb128 .LEHB19-.LFB25
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSE25:
	.text
	.fnend
	.size	_Z12MPI_AlltoallPiiiS_iii, .-_Z12MPI_AlltoallPiiiS_iii
	.align	2
	.global	_Z12MPI_AlltoallPfiiS_iii
	.type	_Z12MPI_AlltoallPfiiS_iii, %function
_Z12MPI_AlltoallPfiiS_iii:
	.fnstart
.LFB26:
	@ args = 12, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #12]
	mov	r1, r3
.LEHB20:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #84
	ldr	r0, [fp, #12]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	bl	m5_barrier
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L287
.L290:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L288
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L288:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L287:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L290
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L291
.L292:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	ldr	r1, [fp, #-100]
	mul	r2, r1, r2
	mov	r1, r2
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L291:
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-76]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L292
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L293
.L298:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L294
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-108]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L295
.L296:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L295:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L296
.L294:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L293:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L298
	bl	m5_barrier
.LEHE20:
	mov	r3, #0
	b	.L302
.L301:
.LEHB21:
	bl	__cxa_end_cleanup
.LEHE21:
.L302:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA26:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE26-.LLSDACSB26
.LLSDACSB26:
	.uleb128 .LEHB20-.LFB26
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L301-.LFB26
	.uleb128 0
	.uleb128 .LEHB21-.LFB26
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
.LLSDACSE26:
	.text
	.fnend
	.size	_Z12MPI_AlltoallPfiiS_iii, .-_Z12MPI_AlltoallPfiiS_iii
	.align	2
	.global	_Z12MPI_AlltoallPdiiS_iii
	.type	_Z12MPI_AlltoallPdiiS_iii, %function
_Z12MPI_AlltoallPdiiS_iii:
	.fnstart
.LFB27:
	@ args = 12, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #52
	sub	sp, sp, #52
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	sub	r3, fp, #28
	ldr	r0, [fp, #12]
	mov	r1, r3
.LEHB22:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #24
	ldr	r0, [fp, #12]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	bl	m5_barrier
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L304
.L306:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L305
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	mul	r3, r2, r3
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	bl	_Z8MPI_SendPdiiiii
.L305:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L304:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L306
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L307
.L308:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-36]
	mul	r3, r1, r3
	mov	r1, r3
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldmia	r3, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L307:
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L308
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L309
.L311:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L310
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #4]
	mul	r3, r2, r3
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [sp, #0]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #0
	str	r2, [sp, #8]
	mov	r0, r3
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #8]
	ldr	r3, [fp, #-20]
	bl	_Z8MPI_RecvPdiiiiiPi
.L310:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L309:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L311
	bl	m5_barrier
.LEHE22:
	mov	r3, #0
	b	.L315
.L314:
.LEHB23:
	bl	__cxa_end_cleanup
.LEHE23:
.L315:
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA27:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE27-.LLSDACSB27
.LLSDACSB27:
	.uleb128 .LEHB22-.LFB27
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L314-.LFB27
	.uleb128 0
	.uleb128 .LEHB23-.LFB27
	.uleb128 .LEHE23-.LEHB23
	.uleb128 0
	.uleb128 0
.LLSDACSE27:
	.text
	.fnend
	.size	_Z12MPI_AlltoallPdiiS_iii, .-_Z12MPI_AlltoallPdiiS_iii
	.align	2
	.global	_Z13MPI_AlltoallvPiS_S_iS_S_S_ii
	.type	_Z13MPI_AlltoallvPiS_S_iS_S_S_ii, %function
_Z13MPI_AlltoallvPiS_S_iS_S_S_ii:
	.fnstart
.LFB28:
	@ args = 20, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #20]
	mov	r1, r3
.LEHB24:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #84
	ldr	r0, [fp, #20]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	bl	m5_barrier
.LEHE24:
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L317
.L319:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L318
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-104]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-100]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	str	r2, [fp, #-72]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #2
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L318:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L317:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L319
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L320
.L321:
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-104]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	mov	r1, r2
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L320:
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L321
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L322
.L326:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L323
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #16]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-48]
	mov	r3, #2
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L324
.L325:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L324:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L325
.L323:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L322:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L326
	mov	r3, #0
	b	.L330
.L329:
.LEHB25:
	bl	__cxa_end_cleanup
.LEHE25:
.L330:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA28:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE28-.LLSDACSB28
.LLSDACSB28:
	.uleb128 .LEHB24-.LFB28
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L329-.LFB28
	.uleb128 0
	.uleb128 .LEHB25-.LFB28
	.uleb128 .LEHE25-.LEHB25
	.uleb128 0
	.uleb128 0
.LLSDACSE28:
	.text
	.fnend
	.size	_Z13MPI_AlltoallvPiS_S_iS_S_S_ii, .-_Z13MPI_AlltoallvPiS_S_iS_S_S_ii
	.align	2
	.global	_Z13MPI_AlltoallvPfPiS0_iS_S0_S0_ii
	.type	_Z13MPI_AlltoallvPfPiS0_iS_S0_S0_ii, %function
_Z13MPI_AlltoallvPfPiS0_iS_S0_S0_ii:
	.fnstart
.LFB29:
	@ args = 20, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #96
	sub	sp, sp, #96
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	sub	r3, fp, #88
	ldr	r0, [fp, #20]
	mov	r1, r3
.LEHB26:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #84
	ldr	r0, [fp, #20]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	bl	m5_barrier
.LEHE26:
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L332
.L335:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L333
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-104]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-96]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-100]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	str	r2, [fp, #-72]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 114 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L333:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L332:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L335
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L336
.L337:
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-104]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	mov	r1, r2
	ldr	r2, [fp, #-76]
	add	r2, r1, r2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-96]
	add	r2, r1, r2
	ldr	r2, [r2, #0]	@ float
	str	r2, [r3, #0]	@ float
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L336:
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L337
	mov	r3, #0
	str	r3, [fp, #-80]
	b	.L338
.L343:
	ldr	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	beq	.L339
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	str	r2, [fp, #-56]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #16]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L340
.L341:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 185 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L340:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L341
.L339:
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L338:
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-80]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L343
	mov	r3, #0
	b	.L347
.L346:
.LEHB27:
	bl	__cxa_end_cleanup
.LEHE27:
.L347:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA29:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE29-.LLSDACSB29
.LLSDACSB29:
	.uleb128 .LEHB26-.LFB29
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L346-.LFB29
	.uleb128 0
	.uleb128 .LEHB27-.LFB29
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
.LLSDACSE29:
	.text
	.fnend
	.size	_Z13MPI_AlltoallvPfPiS0_iS_S0_S0_ii, .-_Z13MPI_AlltoallvPfPiS0_iS_S0_S0_ii
	.align	2
	.global	_Z13MPI_AlltoallvPdPiS0_iS_S0_S0_ii
	.type	_Z13MPI_AlltoallvPdPiS0_iS_S0_S0_ii, %function
_Z13MPI_AlltoallvPdPiS0_iS_S0_S0_ii:
	.fnstart
.LFB30:
	@ args = 20, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #52
	sub	sp, sp, #52
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	sub	r3, fp, #28
	ldr	r0, [fp, #20]
	mov	r1, r3
.LEHB28:
	bl	_Z13MPI_Comm_rankiPi
	sub	r3, fp, #24
	ldr	r0, [fp, #20]
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L349
.L351:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L350
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-36]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	mov	r1, #0
	str	r1, [sp, #0]
	mov	r1, #0
	str	r1, [sp, #4]
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	bl	_Z8MPI_SendPdiiiii
.L350:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L349:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L351
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L352
.L353:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r3, r3, asl #3
	ldr	r2, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-40]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	mov	r1, r3
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	mov	r3, r3, asl #3
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldmia	r3, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L352:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L353
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L354
.L356:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L355
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #12]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	mov	r1, #0
	str	r1, [sp, #0]
	mov	r1, #0
	str	r1, [sp, #4]
	mov	r1, #0
	str	r1, [sp, #8]
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #16]
	ldr	r3, [fp, #-20]
	bl	_Z8MPI_RecvPdiiiiiPi
.LEHE28:
.L355:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L354:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L356
	mov	r3, #0
	b	.L360
.L359:
.LEHB29:
	bl	__cxa_end_cleanup
.LEHE29:
.L360:
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA30:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE30-.LLSDACSB30
.LLSDACSB30:
	.uleb128 .LEHB28-.LFB30
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L359-.LFB30
	.uleb128 0
	.uleb128 .LEHB29-.LFB30
	.uleb128 .LEHE29-.LEHB29
	.uleb128 0
	.uleb128 0
.LLSDACSE30:
	.text
	.fnend
	.size	_Z13MPI_AlltoallvPdPiS0_iS_S0_S0_ii, .-_Z13MPI_AlltoallvPdPiS0_iS_S0_S0_ii
	.align	2
	.global	_Z12MPI_Finalizev
	.type	_Z12MPI_Finalizev, %function
_Z12MPI_Finalizev:
	.fnstart
.LFB31:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z12MPI_Finalizev, .-_Z12MPI_Finalizev
	.global	encpt_rk
	.bss
	.align	2
	.type	encpt_rk, %object
	.size	encpt_rk, 176
encpt_rk:
	.space	176
	.global	decpt_rk
	.align	2
	.type	decpt_rk, %object
	.size	decpt_rk, 176
decpt_rk:
	.space	176
	.text
	.align	2
	.type	_ZL4rotrji, %function
_ZL4rotrji:
	.fnstart
.LFB32:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r3, r2, ror r3
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_ZL4rotrji, .-_ZL4rotrji
	.align	2
	.global	_Z19rijndaelKeySetupEncPjPKh
	.type	_Z19rijndaelKeySetupEncPjPKh, %function
_Z19rijndaelKeySetupEncPjPKh:
	.fnstart
.LFB33:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r2, [fp, #-20]
	add	r2, r2, #4
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-20]
	add	r2, r2, #5
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #6
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #7
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	ldr	r2, [fp, #-20]
	add	r2, r2, #8
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-20]
	add	r2, r2, #9
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #10
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #11
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #12
	ldr	r2, [fp, #-20]
	add	r2, r2, #12
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-20]
	add	r2, r2, #13
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #14
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-20]
	add	r2, r2, #15
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L366
.L367:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	ldr	r2, [fp, #-16]
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-8]
	mov	r2, r2, lsr #16
	and	r0, r2, #255
	ldr	r2, .L368
	ldr	r2, [r2, r0, asl #2]
	mov	r2, r2, asl #8
	and	r2, r2, #-16777216
	eor	r1, r1, r2
	ldr	r2, [fp, #-8]
	mov	r2, r2, lsr #8
	and	r0, r2, #255
	ldr	r2, .L368
	ldr	r2, [r2, r0, asl #2]
	and	r2, r2, #16711680
	eor	r1, r1, r2
	ldr	r2, [fp, #-8]
	and	r0, r2, #255
	ldr	r2, .L368
	ldr	r2, [r2, r0, asl #2]
	and	r2, r2, #65280
	eor	r1, r1, r2
	ldr	r2, [fp, #-8]
	mov	r0, r2, lsr #24
	ldr	r2, .L368
	ldr	r2, [r2, r0, asl #2]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	eor	r1, r1, r2
	ldr	r0, .L368+4
	ldr	r2, [fp, #-12]
	add	r2, r0, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #24
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	ldr	r2, [fp, #-16]
	add	r2, r2, #4
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #24
	ldr	r2, [fp, #-16]
	add	r2, r2, #8
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #28
	ldr	r2, [fp, #-16]
	add	r2, r2, #12
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L366:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L367
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L369:
	.align	2
.L368:
	.word	_ZL3Te0
	.word	_ZL5rcons
	.cantunwind
	.fnend
	.size	_Z19rijndaelKeySetupEncPjPKh, .-_Z19rijndaelKeySetupEncPjPKh
	.align	2
	.global	_Z26rijndaelKeySetupEnc_MasterPjPKhi
	.type	_Z26rijndaelKeySetupEnc_MasterPjPKhi, %function
_Z26rijndaelKeySetupEnc_MasterPjPKhi:
	.fnstart
.LFB34:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-48]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	ldr	r2, [fp, #-52]
	add	r2, r2, #4
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-52]
	add	r2, r2, #5
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #6
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #7
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #8
	ldr	r2, [fp, #-52]
	add	r2, r2, #8
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-52]
	add	r2, r2, #9
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #10
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #11
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #12
	ldr	r2, [fp, #-52]
	add	r2, r2, #12
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r1, r2, asl #24
	ldr	r2, [fp, #-52]
	add	r2, r2, #13
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #14
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	eor	r1, r1, r2
	ldr	r2, [fp, #-52]
	add	r2, r2, #15
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	ldr	r2, [fp, #-44]
	str	r2, [fp, #-40]
	mov	r2, #4
	str	r2, [fp, #-36]
	mov	r2, #4
	str	r2, [fp, #-24]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-36]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-40]
	str	r4, [fp, #-36]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z26rijndaelKeySetupEnc_MasterPjPKhi, .-_Z26rijndaelKeySetupEnc_MasterPjPKhi
	.align	2
	.global	_Z26rijndaelKeySetupEnc_MiddlePji
	.type	_Z26rijndaelKeySetupEnc_MiddlePji, %function
_Z26rijndaelKeySetupEnc_MiddlePji:
	.fnstart
.LFB35:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #92
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-100]
	sub	r3, r3, #1
	ldr	r2, [fp, #-84]
	str	r2, [fp, #-72]
	mov	r2, #4
	str	r2, [fp, #-68]
	mov	r2, #4
	str	r2, [fp, #-40]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	b	.L372
.L373:
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L372:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L373
	mov	r3, #0
	str	r3, [fp, #-88]
	b	.L374
.L375:
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-96]
	add	r3, r3, #16
	ldr	r2, [fp, #-96]
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-80]
	mov	r2, r2, lsr #16
	and	r0, r2, #255
	ldr	r2, .L377
	ldr	r2, [r2, r0, asl #2]
	mov	r2, r2, asl #8
	and	r2, r2, #-16777216
	eor	r1, r1, r2
	ldr	r2, [fp, #-80]
	mov	r2, r2, lsr #8
	and	r0, r2, #255
	ldr	r2, .L377
	ldr	r2, [r2, r0, asl #2]
	and	r2, r2, #16711680
	eor	r1, r1, r2
	ldr	r2, [fp, #-80]
	and	r0, r2, #255
	ldr	r2, .L377
	ldr	r2, [r2, r0, asl #2]
	and	r2, r2, #65280
	eor	r1, r1, r2
	ldr	r2, [fp, #-80]
	mov	r0, r2, lsr #24
	ldr	r2, .L377
	ldr	r2, [r2, r0, asl #2]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	eor	r1, r1, r2
	ldr	r2, [fp, #-100]
	sub	r2, r2, #1
	mov	r0, r2, asl #1
	ldr	r2, [fp, #-88]
	add	r2, r0, r2
	ldr	r0, .L377+4
	ldrb	r2, [r0, r2]	@ zero_extendqisi2
	mov	r2, r2, asl #24
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #20
	ldr	r2, [fp, #-96]
	add	r2, r2, #4
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-96]
	add	r2, r2, #16
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #24
	ldr	r2, [fp, #-96]
	add	r2, r2, #8
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-96]
	add	r2, r2, #20
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #28
	ldr	r2, [fp, #-96]
	add	r2, r2, #12
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-96]
	add	r2, r2, #24
	ldr	r2, [r2, #0]
	eor	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #16
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-88]
	add	r3, r3, #1
	str	r3, [fp, #-88]
.L374:
	ldr	r3, [fp, #-88]
	cmp	r3, #1
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L375
	ldr	r3, [fp, #-100]
	cmp	r3, #5
	beq	.L371
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	ldr	r2, [fp, #-76]
	str	r2, [fp, #-56]
	mov	r2, #4
	str	r2, [fp, #-52]
	mov	r2, #4
	str	r2, [fp, #-24]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
.L371:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
.L378:
	.align	2
.L377:
	.word	_ZL3Te0
	.word	_ZL5rcons
	.cantunwind
	.fnend
	.size	_Z26rijndaelKeySetupEnc_MiddlePji, .-_Z26rijndaelKeySetupEnc_MiddlePji
	.align	2
	.global	_Z5ROUNDiPjS_S_S_jjjjPKj
	.type	_Z5ROUNDiPjS_S_S_jjjjPKj, %function
_Z5ROUNDiPjS_S_S_jjjjPKj:
	.fnstart
.LFB36:
	@ args = 24, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #8]
	mov	r2, r3, lsr #24
	ldr	r3, .L380
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #12]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #16]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #20]
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #4
	ldr	r1, [fp, #24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #12]
	mov	r2, r3, lsr #24
	ldr	r3, .L380
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #16]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #20]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #8]
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #4
	add	r3, r3, #4
	ldr	r1, [fp, #24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #16]
	mov	r2, r3, lsr #24
	ldr	r3, .L380
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #20]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #8]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #12]
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #4
	add	r3, r3, #8
	ldr	r1, [fp, #24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #20]
	mov	r2, r3, lsr #24
	ldr	r3, .L380
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #8]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #12]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #16]
	and	r2, r3, #255
	ldr	r3, .L380
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #4
	add	r3, r3, #12
	ldr	r1, [fp, #24]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	eor	r2, r2, r3
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L381:
	.align	2
.L380:
	.word	_ZL3Te0
	.cantunwind
	.fnend
	.size	_Z5ROUNDiPjS_S_S_jjjjPKj, .-_Z5ROUNDiPjS_S_S_jjjjPKj
	.align	2
	.global	_Z15rijndaelEncryptPKjPKhPh
	.type	_Z15rijndaelEncryptPKjPKhPh, %function
_Z15rijndaelEncryptPKjPKhPh:
	.fnstart
.LFB37:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #84
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	mov	r3, #1
	str	r3, [fp, #-28]
	mov	r3, #10
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-68]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-68]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-68]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #14
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #15
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-48]
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L383
.L384:
	ldr	r4, [fp, #-60]
	ldr	lr, [fp, #-56]
	ldr	ip, [fp, #-52]
	ldr	r0, [fp, #-48]
	sub	r1, fp, #44
	sub	r2, fp, #40
	sub	r3, fp, #36
	sub	r5, fp, #32
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [fp, #-64]
	str	r0, [sp, #20]
	ldr	r0, [fp, #-28]
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r3, [fp, #-28]
	add	r0, r3, #1
	ldr	r5, [fp, #-44]
	ldr	r4, [fp, #-40]
	ldr	lr, [fp, #-36]
	ldr	ip, [fp, #-32]
	sub	r1, fp, #60
	sub	r2, fp, #56
	sub	r3, fp, #52
	sub	r6, fp, #48
	str	r6, [sp, #0]
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	str	lr, [sp, #12]
	str	ip, [sp, #16]
	ldr	ip, [fp, #-64]
	str	ip, [sp, #20]
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
.L383:
	ldr	r3, [fp, #-28]
	cmp	r3, #8
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L384
	ldr	r4, [fp, #-60]
	ldr	lr, [fp, #-56]
	ldr	ip, [fp, #-52]
	ldr	r0, [fp, #-48]
	sub	r1, fp, #44
	sub	r2, fp, #40
	sub	r3, fp, #36
	sub	r5, fp, #32
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [fp, #-64]
	str	r0, [sp, #20]
	mov	r0, #9
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r3, [fp, #-64]
	add	r3, r3, #160
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-44]
	mov	r2, r3, lsr #24
	ldr	r3, .L385
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-40]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	mov	r3, r3, lsr #24
	and	r2, r3, #255
	ldr	r3, [fp, #-72]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	ldr	r2, [fp, #-60]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #2
	ldr	r2, [fp, #-60]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #3
	ldr	r2, [fp, #-60]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, r3, lsr #24
	ldr	r3, .L385
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-36]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-72]
	add	r3, r3, #4
	ldr	r2, [fp, #-56]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #5
	ldr	r2, [fp, #-56]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #6
	ldr	r2, [fp, #-56]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #7
	ldr	r2, [fp, #-56]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, r3, lsr #24
	ldr	r3, .L385
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-32]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-72]
	add	r3, r3, #8
	ldr	r2, [fp, #-52]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #9
	ldr	r2, [fp, #-52]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #10
	ldr	r2, [fp, #-52]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #11
	ldr	r2, [fp, #-52]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	mov	r2, r3, lsr #24
	ldr	r3, .L385
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-44]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	and	r1, r3, #255
	ldr	r3, .L385
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-72]
	add	r3, r3, #12
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #13
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #14
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-72]
	add	r3, r3, #15
	ldr	r2, [fp, #-48]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, pc}
.L386:
	.align	2
.L385:
	.word	_ZL3Te0
	.cantunwind
	.fnend
	.size	_Z15rijndaelEncryptPKjPKhPh, .-_Z15rijndaelEncryptPKjPKhPh
	.align	2
	.global	_Z22rijndaelEncrypt_MasterPKjPKhi
	.type	_Z22rijndaelEncrypt_MasterPKjPKhi, %function
_Z22rijndaelEncrypt_MasterPKjPKhi:
	.fnstart
.LFB38:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #68
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-68]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-68]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-68]
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #14
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #15
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-16]
	sub	r3, fp, #28
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	ldr	r2, [fp, #-60]
	str	r2, [fp, #-56]
	mov	r2, #4
	str	r2, [fp, #-52]
	mov	r2, #4
	str	r2, [fp, #-40]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-52]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-56]
	str	r4, [fp, #-52]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z22rijndaelEncrypt_MasterPKjPKhi, .-_Z22rijndaelEncrypt_MasterPKjPKhi
	.align	2
	.global	_Z22rijndaelEncrypt_MiddlePKji
	.type	_Z22rijndaelEncrypt_MiddlePKji, %function
_Z22rijndaelEncrypt_MiddlePKji:
	.fnstart
.LFB39:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #128
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	mov	r3, #0
	str	r3, [fp, #-108]
	str	r3, [fp, #-104]
	str	r3, [fp, #-100]
	str	r3, [fp, #-96]
    .word 0xeff00000
    .word 0xf0000000
//	mov	r3, #0
//	sub	r3, fp, #28
//	mov	r2, #4
//	mov	r2, #4
//
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-116]
	sub	r3, r3, #1
	ldr	r6, [fp, #-92]
	str	r6, [fp, #-88]
	str	r2, [fp, #-84]
	str	r2, [fp, #-56]
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-80]
    .word 0xeff00002
    .word 0xf0000000
//	mov	r3, r3, asl #6
//	orr	r3, r3, #-268435456
//
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-76]
	b	.L389
.L390:
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-84]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-88]
	str	r4, [fp, #-84]
.L389:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L390
	ldr	r4, [fp, #-28]
	ldr	lr, [fp, #-24]
	ldr	ip, [fp, #-20]
	ldr	r0, [fp, #-16]
	sub	r1, fp, #108
	sub	r2, fp, #104
	sub	r3, fp, #100
	sub	r5, fp, #96
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [fp, #-112]
	str	r0, [sp, #20]
	mov	r0, #1
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r4, [fp, #-108]
	ldr	lr, [fp, #-104]
	ldr	ip, [fp, #-100]
	ldr	r0, [fp, #-96]
	sub	r1, fp, #28
    .word 0xeff00003
    .word 0xf0000000
//	sub	r8, fp, #28
//	sub	r3, fp, #28
//	add	r3, r3, #8
//	sub	r5, fp, #28
//	add	r5, r5, #12
//
	add	r2, r8, #4
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [fp, #-112]
	str	r0, [sp, #20]
	mov	r0, #2
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r3, [fp, #-116]
	ldr	r2, [fp, #-92]
	str	r2, [fp, #-72]
    .word 0xeff00004
    .word 0xf0000000
//	add	r8, r3, #1
//	mov	r2, #4
//	mov	r3, #0
//
	str	r2, [fp, #-68]
	str	r2, [fp, #-40]
	str	r8, [fp, #-64]
	str	r3, [fp, #-36]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.cantunwind
	.fnend
	.size	_Z22rijndaelEncrypt_MiddlePKji, .-_Z22rijndaelEncrypt_MiddlePKji
	.align	2
	.global	_Z21rijndaelEncrypt_FinalPKjPhi
	.type	_Z21rijndaelEncrypt_FinalPKjPhi, %function
_Z21rijndaelEncrypt_FinalPKjPhi:
	.fnstart
.LFB40:
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #136
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	str	r2, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-104]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-96]
	sub	r3, fp, #28
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-120]
	sub	r3, r3, #1
	ldr	r2, [fp, #-92]
	str	r2, [fp, #-88]
	mov	r2, #4
	str	r2, [fp, #-84]
	mov	r2, #4
	str	r2, [fp, #-56]
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-76]
	b	.L392
.L393:
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-84]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
		ldr	r8, [r3, #0]
	str	r8, [r5]
	add	r5, r5, #4
	sub	r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-88]
	str	r4, [fp, #-84]
.L392:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L393
	ldr	r4, [fp, #-28]
	ldr	lr, [fp, #-24]
	ldr	ip, [fp, #-20]
	ldr	r0, [fp, #-16]
	sub	r1, fp, #108
	sub	r2, fp, #104
	sub	r3, fp, #100
	sub	r5, fp, #96
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	lr, [sp, #8]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [fp, #-112]
	str	r0, [sp, #20]
	mov	r0, #1
	bl	_Z5ROUNDiPjS_S_S_jjjjPKj
	ldr	r3, [fp, #-108]
	mov	r2, r3, lsr #24
	ldr	r3, .L394
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-104]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-100]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-96]
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-112]
	add	r3, r3, #32
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #24
	and	r2, r3, #255
	ldr	r3, [fp, #-116]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	ldr	r2, [fp, #-28]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #2
	ldr	r2, [fp, #-28]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #3
	ldr	r2, [fp, #-28]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-104]
	mov	r2, r3, lsr #24
	ldr	r3, .L394
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-100]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-96]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-108]
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-112]
	add	r3, r3, #36
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-116]
	add	r3, r3, #4
	ldr	r2, [fp, #-24]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #5
	ldr	r2, [fp, #-24]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #6
	ldr	r2, [fp, #-24]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #7
	ldr	r2, [fp, #-24]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-100]
	mov	r2, r3, lsr #24
	ldr	r3, .L394
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-96]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-108]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-104]
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-112]
	add	r3, r3, #40
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-116]
	add	r3, r3, #8
	ldr	r2, [fp, #-20]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #9
	ldr	r2, [fp, #-20]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #10
	ldr	r2, [fp, #-20]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #11
	ldr	r2, [fp, #-20]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-96]
	mov	r2, r3, lsr #24
	ldr	r3, .L394
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #8
	and	r2, r3, #-16777216
	ldr	r3, [fp, #-108]
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #16711680
	eor	r2, r2, r3
	ldr	r3, [fp, #-104]
	mov	r3, r3, lsr #8
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	and	r3, r3, #65280
	eor	r2, r2, r3
	ldr	r3, [fp, #-100]
	and	r1, r3, #255
	ldr	r3, .L394
	ldr	r3, [r3, r1, asl #2]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	eor	r2, r2, r3
	ldr	r3, [fp, #-112]
	add	r3, r3, #44
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-116]
	add	r3, r3, #12
	ldr	r2, [fp, #-16]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #13
	ldr	r2, [fp, #-16]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #14
	ldr	r2, [fp, #-16]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-116]
	add	r3, r3, #15
	ldr	r2, [fp, #-16]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	ldr	r2, [fp, #-92]
	str	r2, [fp, #-72]
	mov	r2, #2
	str	r2, [fp, #-68]
	mov	r2, #4
	str	r2, [fp, #-40]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-64]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r1, [fp, #-72]
	ldr	r2, [fp, #-68]
	mov	r5, r1
	mov	r4, r2
#APP
@ 95 "../../lib/mpi.h" 1
	1:
	ldr	r8, [r5]
	str	r8, [r3, #0]
	add	r5, r5, #4
	subs	r4, r4, #1
	bne	1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L395:
	.align	2
.L394:
	.word	_ZL3Te0
	.cantunwind
	.fnend
	.size	_Z21rijndaelEncrypt_FinalPKjPhi, .-_Z21rijndaelEncrypt_FinalPKjPhi
	.align	2
	.global	_Z19rijndaelKeySetupDecPjPKh
	.type	_Z19rijndaelKeySetupDecPjPKh, %function
_Z19rijndaelKeySetupDecPjPKh:
	.fnstart
.LFB41:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #10
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-36]
	bl	_Z19rijndaelKeySetupEncPjPKh
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	str	r3, [fp, #-24]
	b	.L397
.L398:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r2, r2, #1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r2, r2, #2
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r2, r2, #3
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #4
	str	r3, [fp, #-24]
.L397:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L398
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L399
.L402:
	ldr	r3, [fp, #-32]
	add	r3, r3, #16
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L400
.L401:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r4, r2, r3
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r2, r3, lsr #24
	ldr	r3, .L403
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L403+4
	ldr	r5, [r3, r2, asl #2]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L403
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L403+4
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r5, r5, r3
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L403
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L403+4
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r5, r5, r3
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	and	r2, r3, #255
	ldr	r3, .L403
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L403+4
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r3, r5, r3
	str	r3, [r4, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L400:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L401
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L399:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L402
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L404:
	.align	2
.L403:
	.word	_ZL3Te0
	.word	_ZL3Td0
	.cantunwind
	.fnend
	.size	_Z19rijndaelKeySetupDecPjPKh, .-_Z19rijndaelKeySetupDecPjPKh
	.align	2
	.global	_Z15rijndaelDecryptPKjPKhPh
	.type	_Z15rijndaelDecryptPKjPKhPh, %function
_Z15rijndaelDecryptPKjPKhPh:
	.fnstart
.LFB42:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	mov	r3, #10
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-60]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-60]
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-60]
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-60]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-60]
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #14
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r3, r3, #15
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	mov	r3, #5
	str	r3, [fp, #-36]
.L408:
	ldr	r3, [fp, #-52]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-40]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-44]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-48]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #16
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-52]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-40]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-44]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-48]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-52]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-40]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #24
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-44]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-48]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-52]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #28
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-56]
	add	r3, r3, #32
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L410
.L406:
	ldr	r3, [fp, #-28]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-24]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-24]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-20]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-20]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-16]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-16]
	mov	r2, r3, lsr #24
	ldr	r3, .L411
	ldr	r4, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #8
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #8
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #16
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r4, r4, r3
	ldr	r3, [fp, #-28]
	and	r2, r3, #255
	ldr	r3, .L411
	ldr	r3, [r3, r2, asl #2]
	mov	r0, r3
	mov	r1, #24
	bl	_ZL4rotrji
	mov	r3, r0
	eor	r2, r4, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	b	.L408
.L410:
	mov	r0, r0	@ nop
.L409:
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #24
	ldr	r2, .L411+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #16
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	eor	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	mov	r3, r3, lsr #24
	and	r2, r3, #255
	ldr	r3, [fp, #-64]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	ldr	r2, [fp, #-52]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #2
	ldr	r2, [fp, #-52]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #3
	ldr	r2, [fp, #-52]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #24
	ldr	r2, .L411+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #16
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	eor	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-64]
	add	r3, r3, #4
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #5
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #6
	ldr	r2, [fp, #-48]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #7
	ldr	r2, [fp, #-48]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #24
	ldr	r2, .L411+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #16
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	eor	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-64]
	add	r3, r3, #8
	ldr	r2, [fp, #-44]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #9
	ldr	r2, [fp, #-44]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #10
	ldr	r2, [fp, #-44]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #11
	ldr	r2, [fp, #-44]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #24
	ldr	r2, .L411+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #8
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	ldr	r1, .L411+4
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	eor	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	eor	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-64]
	add	r3, r3, #12
	ldr	r2, [fp, #-40]
	mov	r2, r2, lsr #24
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #13
	ldr	r2, [fp, #-40]
	mov	r2, r2, lsr #16
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #14
	ldr	r2, [fp, #-40]
	mov	r2, r2, lsr #8
	and	r2, r2, #255
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-64]
	add	r3, r3, #15
	ldr	r2, [fp, #-40]
	and	r2, r2, #255
	strb	r2, [r3, #0]
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L412:
	.align	2
.L411:
	.word	_ZL3Td0
	.word	_ZL4Td4s
	.cantunwind
	.fnend
	.size	_Z15rijndaelDecryptPKjPKhPh, .-_Z15rijndaelDecryptPKjPKhPh
	.section	.rodata
	.align	2
.LC4:
	.ascii	"\012core id = %d inited for aes...\012\000"
	.align	2
.LC0:
	.byte	51
	.byte	-58
	.byte	109
	.byte	9
	.byte	62
	.byte	104
	.byte	92
	.byte	15
	.byte	99
	.byte	3
	.byte	19
	.byte	121
	.byte	-110
	.byte	124
	.byte	42
	.byte	9
	.align	2
.LC1:
	.byte	37
	.byte	92
	.byte	49
	.byte	29
	.byte	113
	.byte	-40
	.byte	4
	.byte	-73
	.byte	67
	.byte	17
	.byte	64
	.byte	-122
	.byte	18
	.byte	-94
	.byte	-56
	.byte	61
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB43:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #64
	sub	sp, sp, #64
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	ldr	r3, .L429
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	mov	r3, #16
	str	r3, [fp, #-48]
	mov	r3, #6
	str	r3, [fp, #-44]
	mov	r3, #10
	str	r3, [fp, #-52]
	sub	r2, fp, #64
	sub	r3, fp, #68
	mov	r0, r2
	mov	r1, r3
.LEHB30:
	bl	_Z8MPI_InitPiPPPc
	sub	r3, fp, #56
	mov	r0, #0
	mov	r1, r3
	bl	_Z13MPI_Comm_rankiPi
	ldr	r3, .L429+4
	sub	r1, fp, #40
	mov	r2, r3
	mov	r3, #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L414
	ldr	r3, [fp, #-56]
	sub	r2, fp, #40
	ldr	r0, .L429+8
	mov	r1, r2
	mov	r2, r3
	bl	_Z26rijndaelKeySetupEnc_MasterPjPKhi
	b	.L415
.L414:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bge	.L415
	ldr	r3, [fp, #-56]
	ldr	r0, .L429+8
	mov	r1, r3
	bl	_Z26rijndaelKeySetupEnc_MiddlePji
.L415:
	ldr	r3, [fp, #-56]
	ldr	r0, .L429+12
	mov	r1, r3
	bl	printf
	bl	m5_barrier
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L416
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	m5_dump_stats
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	m5_reset_stats
.L416:
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L417
.L422:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L418
	ldr	r3, .L429+16
	sub	r1, fp, #24
	mov	r2, r3
	mov	r3, #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	ldr	r3, [fp, #-56]
	sub	r2, fp, #24
	ldr	r0, .L429+8
	mov	r1, r2
	mov	r2, r3
	bl	_Z22rijndaelEncrypt_MasterPKjPKhi
	b	.L419
.L418:
	ldr	r3, [fp, #-44]
	sub	r2, r3, #1
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	bne	.L420
	sub	r3, fp, #24
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	ldr	r3, [fp, #-56]
	sub	r2, fp, #24
	ldr	r0, .L429+8
	mov	r1, r2
	mov	r2, r3
	bl	_Z21rijndaelEncrypt_FinalPKjPhi
	b	.L419
.L420:
	ldr	r3, [fp, #-56]
	ldr	r0, .L429+8
	mov	r1, r3
	bl	_Z22rijndaelEncrypt_MiddlePKji
.L419:
	ldr	r1, [fp, #-52]
	ldr	r3, .L429+20
	smull	r2, r3, r1, r3
    .word 0xeff00001
    .word 0xf0000000
//	mov	r2, r3, asr #3
//	mov	r3, r1, asr #31
//	rsb	r2, r3, r2
//	mov	r3, r2
//	mov	r3, r3, asl #2
//	add	r3, r3, r2
//	mov	r3, r3, asl #2
//	rsb	r2, r3, r1
	cmp	r2, #0
	bne	.L421
	bl	m5_barrier
.L421:
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L417:
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L422
	ldr	r3, [fp, #-48]
	sub	r2, r3, #1
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	bne	.L423
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	m5_dump_stats
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	m5_reset_stats
.LEHE30:
.L423:
	bl	_Z12MPI_Finalizev
	mov	r3, #0
	mov	r0, r3
	ldr	r3, .L429
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L426
	b	.L428
.L427:
.LEHB31:
	bl	__cxa_end_cleanup
.LEHE31:
.L428:
	bl	__stack_chk_fail
.L426:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L430:
	.align	2
.L429:
	.word	__stack_chk_guard
	.word	.LC0
	.word	encpt_rk
	.word	.LC4
	.word	.LC1
	.word	1717986919
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA43:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE43-.LLSDACSB43
.LLSDACSB43:
	.uleb128 .LEHB30-.LFB43
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L427-.LFB43
	.uleb128 0
	.uleb128 .LEHB31-.LFB43
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSE43:
	.text
	.fnend
	.size	main, .-main
	.section	.rodata
	.align	2
	.type	_ZL3Te0, %object
	.size	_ZL3Te0, 1024
_ZL3Te0:
	.word	-966564955
	.word	-126059388
	.word	-294160487
	.word	-159679603
	.word	-855539
	.word	-697603139
	.word	-563122255
	.word	-1849309868
	.word	1613770832
	.word	33620227
	.word	-832084055
	.word	1445669757
	.word	-402719207
	.word	-1244145822
	.word	1303096294
	.word	-327780710
	.word	-1882535355
	.word	528646813
	.word	-1983264448
	.word	-92439161
	.word	-268764651
	.word	-1302767125
	.word	-1907931191
	.word	-68095989
	.word	1101901292
	.word	-1277897625
	.word	1604494077
	.word	1169141738
	.word	597466303
	.word	1403299063
	.word	-462261610
	.word	-1681866661
	.word	1974974402
	.word	-503448292
	.word	1033081774
	.word	1277568618
	.word	1815492186
	.word	2118074177
	.word	-168298750
	.word	-2083730353
	.word	1748251740
	.word	1369810420
	.word	-773462732
	.word	-101584632
	.word	-495881837
	.word	-1411852173
	.word	1647391059
	.word	706024767
	.word	134480908
	.word	-1782069422
	.word	1176707941
	.word	-1648114850
	.word	806885416
	.word	932615841
	.word	168101135
	.word	798661301
	.word	235341577
	.word	605164086
	.word	461406363
	.word	-538779075
	.word	-840176858
	.word	1311188841
	.word	2142417613
	.word	-361400929
	.word	302582043
	.word	495158174
	.word	1479289972
	.word	874125870
	.word	907746093
	.word	-596742478
	.word	-1269146898
	.word	1537253627
	.word	-1538108682
	.word	1983593293
	.word	-1210657183
	.word	2108928974
	.word	1378429307
	.word	-572267714
	.word	1580150641
	.word	327451799
	.word	-1504488459
	.word	-1177431704
	.word	0
	.word	-1041371860
	.word	1075847264
	.word	-469959649
	.word	2041688520
	.word	-1235526675
	.word	-731223362
	.word	-1916023994
	.word	1740553945
	.word	1916352843
	.word	-1807070498
	.word	-1739830060
	.word	-1336387352
	.word	-2049978550
	.word	-1143943061
	.word	-974131414
	.word	1336584933
	.word	-302253290
	.word	-2042412091
	.word	-1706209833
	.word	1714631509
	.word	293963156
	.word	-1975171633
	.word	-369493744
	.word	67240454
	.word	-25198719
	.word	-1605349136
	.word	2017213508
	.word	631218106
	.word	1269344483
	.word	-1571728909
	.word	1571005438
	.word	-2143272768
	.word	93294474
	.word	1066570413
	.word	563977660
	.word	1882732616
	.word	-235539196
	.word	1673313503
	.word	2008463041
	.word	-1344611723
	.word	1109467491
	.word	537923632
	.word	-436207846
	.word	-34344178
	.word	-1076702611
	.word	-2117218996
	.word	403442708
	.word	638784309
	.word	-1007883217
	.word	-1101045791
	.word	899127202
	.word	-2008791860
	.word	773265209
	.word	-1815821225
	.word	1437050866
	.word	-58818942
	.word	2050833735
	.word	-932944724
	.word	-1168286233
	.word	840505643
	.word	-428641387
	.word	-1067425632
	.word	427917720
	.word	-1638969391
	.word	-1545806721
	.word	1143087718
	.word	1412049534
	.word	999329963
	.word	193497219
	.word	-1941551414
	.word	-940642775
	.word	1807268051
	.word	672404540
	.word	-1478566279
	.word	-1134666014
	.word	369822493
	.word	-1378100362
	.word	-606019525
	.word	1681011286
	.word	1949973070
	.word	336202270
	.word	-1840690725
	.word	201721354
	.word	1210328172
	.word	-1201906460
	.word	-1614626211
	.word	-1110191250
	.word	1135389935
	.word	-1000185178
	.word	965841320
	.word	831886756
	.word	-739974089
	.word	-226920053
	.word	-706222286
	.word	-1949775805
	.word	1849112409
	.word	-630362697
	.word	26054028
	.word	-1311386268
	.word	-1672589614
	.word	1235855840
	.word	-663982924
	.word	-1403627782
	.word	-202050553
	.word	-806688219
	.word	-899324497
	.word	-193299826
	.word	1202630377
	.word	268961816
	.word	1874508501
	.word	-260540280
	.word	1243948399
	.word	1546530418
	.word	941366308
	.word	1470539505
	.word	1941222599
	.word	-1748580783
	.word	-873928669
	.word	-1579295364
	.word	-395021156
	.word	1042226977
	.word	-1773450275
	.word	1639824860
	.word	227249030
	.word	260737669
	.word	-529502064
	.word	2084453954
	.word	1907733956
	.word	-865704278
	.word	-1874310952
	.word	100860677
	.word	-134810111
	.word	470683154
	.word	-1033805405
	.word	1781871967
	.word	-1370007559
	.word	1773779408
	.word	394692241
	.word	-1715355304
	.word	974986535
	.word	664706745
	.word	-639508168
	.word	-336005101
	.word	731420851
	.word	571543859
	.word	-764843589
	.word	-1445340816
	.word	126783113
	.word	865375399
	.word	765172662
	.word	1008606754
	.word	361203602
	.word	-907417312
	.word	-2016489911
	.word	-1437248001
	.word	1344809080
	.word	-1512054918
	.word	59542671
	.word	1503764984
	.word	160008576
	.word	437062935
	.word	1707065306
	.word	-672733647
	.word	-2076032314
	.word	-798463816
	.word	-2109652541
	.word	697932208
	.word	1512910199
	.word	504303377
	.word	2075177163
	.word	-1470868228
	.word	1841019862
	.word	739644986
	.align	2
	.type	_ZL3Td0, %object
	.size	_ZL3Td0, 1024
_ZL3Td0:
	.word	1374988112
	.word	2118214995
	.word	437757123
	.word	975658646
	.word	1001089995
	.word	530400753
	.word	-1392879445
	.word	1273168787
	.word	540080725
	.word	-1384747530
	.word	-1999866223
	.word	-184398811
	.word	1340463100
	.word	-987051049
	.word	641025152
	.word	-1251826801
	.word	-558802359
	.word	632953703
	.word	1172967064
	.word	1576976609
	.word	-1020300030
	.word	-2125664238
	.word	-1924753501
	.word	1809054150
	.word	59727847
	.word	361929877
	.word	-1083344149
	.word	-1789765158
	.word	-725712083
	.word	1484005843
	.word	1239443753
	.word	-1899378620
	.word	1975683434
	.word	-191989384
	.word	-1722270101
	.word	666464733
	.word	-1092530250
	.word	-259478249
	.word	-920605594
	.word	2110667444
	.word	1675577880
	.word	-451268222
	.word	-1756286112
	.word	1649639237
	.word	-1318815776
	.word	-1150570876
	.word	-25059300
	.word	-116905068
	.word	1883793496
	.word	-1891238631
	.word	-1797362553
	.word	1383856311
	.word	-1418472669
	.word	1917518562
	.word	-484470953
	.word	1716890410
	.word	-1293211641
	.word	800440835
	.word	-2033878118
	.word	-751368027
	.word	807962610
	.word	599762354
	.word	33778362
	.word	-317291940
	.word	-1966138325
	.word	-1485196142
	.word	-217582864
	.word	1315562145
	.word	1708848333
	.word	101039829
	.word	-785096161
	.word	-995688822
	.word	875451293
	.word	-1561111136
	.word	92987698
	.word	-1527321739
	.word	193195065
	.word	1080094634
	.word	1584504582
	.word	-1116860335
	.word	1042385657
	.word	-1763899843
	.word	-583137874
	.word	1306967366
	.word	-1856729675
	.word	1908694277
	.word	67556463
	.word	1615861247
	.word	429456164
	.word	-692196969
	.word	-1992277044
	.word	1742315127
	.word	-1326955843
	.word	126454664
	.word	-417768648
	.word	2043211483
	.word	-1585706425
	.word	2084704233
	.word	-125559095
	.word	0
	.word	159417987
	.word	841739592
	.word	504459436
	.word	1817866830
	.word	-49348613
	.word	260388950
	.word	1034867998
	.word	908933415
	.word	168810852
	.word	1750902305
	.word	-1688513327
	.word	607530554
	.word	202008497
	.word	-1822955761
	.word	-1259432238
	.word	463180190
	.word	-2134850225
	.word	1641816226
	.word	1517767529
	.word	470948374
	.word	-493635062
	.word	-1063245083
	.word	1008918595
	.word	303765277
	.word	235474187
	.word	-225720403
	.word	766945465
	.word	337553864
	.word	1475418501
	.word	-1351284916
	.word	-291906117
	.word	-1551933187
	.word	-150919521
	.word	1551037884
	.word	1147550661
	.word	1543208500
	.word	-1958532746
	.word	-886847780
	.word	-1225917336
	.word	-1192955549
	.word	-684598070
	.word	1113818384
	.word	328671808
	.word	-2067394272
	.word	-2058738563
	.word	-759480840
	.word	-1359400431
	.word	-953573011
	.word	496906059
	.word	-592301837
	.word	226906860
	.word	2009195472
	.word	733156972
	.word	-1452230247
	.word	294930682
	.word	1206477858
	.word	-1459843900
	.word	-1594867942
	.word	1451044056
	.word	573804783
	.word	-2025238841
	.word	-650587711
	.word	-1932877058
	.word	-1730933962
	.word	-1493859889
	.word	-1518674392
	.word	-625504730
	.word	1068351396
	.word	742039012
	.word	1350078989
	.word	1784663195
	.word	1417561698
	.word	-158526526
	.word	-1864845080
	.word	775550814
	.word	-2101104651
	.word	-1621262146
	.word	1775276924
	.word	1876241833
	.word	-819653965
	.word	-928212677
	.word	270040487
	.word	-392404114
	.word	-616842373
	.word	-853116919
	.word	1851332852
	.word	-325404927
	.word	-2091935064
	.word	-426414491
	.word	-1426069890
	.word	566021896
	.word	-283776794
	.word	-1159226407
	.word	1248802510
	.word	-358676012
	.word	699432150
	.word	832877231
	.word	708780849
	.word	-962227152
	.word	899835584
	.word	1951317047
	.word	-58537306
	.word	-527380304
	.word	866637845
	.word	-251357110
	.word	1106041591
	.word	2144161806
	.word	395441711
	.word	1984812685
	.word	1139781709
	.word	-861254316
	.word	-459930401
	.word	-1630423581
	.word	1282050075
	.word	-1054072904
	.word	1181045119
	.word	-1654724092
	.word	25965917
	.word	-91786125
	.word	-83148498
	.word	-1285087910
	.word	-1831087534
	.word	-384805325
	.word	1842759443
	.word	-1697160820
	.word	933301370
	.word	1509430414
	.word	-351060855
	.word	-827774994
	.word	-1218328267
	.word	-518199827
	.word	2051518780
	.word	-1663901863
	.word	1441952575
	.word	404016761
	.word	1942435775
	.word	1408749034
	.word	1610459739
	.word	-549621996
	.word	2017778566
	.word	-894438527
	.word	-1184316354
	.word	941896748
	.word	-1029488545
	.word	371049330
	.word	-1126030068
	.word	675039627
	.word	-15887039
	.word	967311729
	.word	135050206
	.word	-659233636
	.word	1683407248
	.word	2076935265
	.word	-718096784
	.word	1215061108
	.word	-793225406
	.align	2
	.type	_ZL4Td4s, %object
	.size	_ZL4Td4s, 256
_ZL4Td4s:
	.byte	82
	.byte	9
	.byte	106
	.byte	-43
	.byte	48
	.byte	54
	.byte	-91
	.byte	56
	.byte	-65
	.byte	64
	.byte	-93
	.byte	-98
	.byte	-127
	.byte	-13
	.byte	-41
	.byte	-5
	.byte	124
	.byte	-29
	.byte	57
	.byte	-126
	.byte	-101
	.byte	47
	.byte	-1
	.byte	-121
	.byte	52
	.byte	-114
	.byte	67
	.byte	68
	.byte	-60
	.byte	-34
	.byte	-23
	.byte	-53
	.byte	84
	.byte	123
	.byte	-108
	.byte	50
	.byte	-90
	.byte	-62
	.byte	35
	.byte	61
	.byte	-18
	.byte	76
	.byte	-107
	.byte	11
	.byte	66
	.byte	-6
	.byte	-61
	.byte	78
	.byte	8
	.byte	46
	.byte	-95
	.byte	102
	.byte	40
	.byte	-39
	.byte	36
	.byte	-78
	.byte	118
	.byte	91
	.byte	-94
	.byte	73
	.byte	109
	.byte	-117
	.byte	-47
	.byte	37
	.byte	114
	.byte	-8
	.byte	-10
	.byte	100
	.byte	-122
	.byte	104
	.byte	-104
	.byte	22
	.byte	-44
	.byte	-92
	.byte	92
	.byte	-52
	.byte	93
	.byte	101
	.byte	-74
	.byte	-110
	.byte	108
	.byte	112
	.byte	72
	.byte	80
	.byte	-3
	.byte	-19
	.byte	-71
	.byte	-38
	.byte	94
	.byte	21
	.byte	70
	.byte	87
	.byte	-89
	.byte	-115
	.byte	-99
	.byte	-124
	.byte	-112
	.byte	-40
	.byte	-85
	.byte	0
	.byte	-116
	.byte	-68
	.byte	-45
	.byte	10
	.byte	-9
	.byte	-28
	.byte	88
	.byte	5
	.byte	-72
	.byte	-77
	.byte	69
	.byte	6
	.byte	-48
	.byte	44
	.byte	30
	.byte	-113
	.byte	-54
	.byte	63
	.byte	15
	.byte	2
	.byte	-63
	.byte	-81
	.byte	-67
	.byte	3
	.byte	1
	.byte	19
	.byte	-118
	.byte	107
	.byte	58
	.byte	-111
	.byte	17
	.byte	65
	.byte	79
	.byte	103
	.byte	-36
	.byte	-22
	.byte	-105
	.byte	-14
	.byte	-49
	.byte	-50
	.byte	-16
	.byte	-76
	.byte	-26
	.byte	115
	.byte	-106
	.byte	-84
	.byte	116
	.byte	34
	.byte	-25
	.byte	-83
	.byte	53
	.byte	-123
	.byte	-30
	.byte	-7
	.byte	55
	.byte	-24
	.byte	28
	.byte	117
	.byte	-33
	.byte	110
	.byte	71
	.byte	-15
	.byte	26
	.byte	113
	.byte	29
	.byte	41
	.byte	-59
	.byte	-119
	.byte	111
	.byte	-73
	.byte	98
	.byte	14
	.byte	-86
	.byte	24
	.byte	-66
	.byte	27
	.byte	-4
	.byte	86
	.byte	62
	.byte	75
	.byte	-58
	.byte	-46
	.byte	121
	.byte	32
	.byte	-102
	.byte	-37
	.byte	-64
	.byte	-2
	.byte	120
	.byte	-51
	.byte	90
	.byte	-12
	.byte	31
	.byte	-35
	.byte	-88
	.byte	51
	.byte	-120
	.byte	7
	.byte	-57
	.byte	49
	.byte	-79
	.byte	18
	.byte	16
	.byte	89
	.byte	39
	.byte	-128
	.byte	-20
	.byte	95
	.byte	96
	.byte	81
	.byte	127
	.byte	-87
	.byte	25
	.byte	-75
	.byte	74
	.byte	13
	.byte	45
	.byte	-27
	.byte	122
	.byte	-97
	.byte	-109
	.byte	-55
	.byte	-100
	.byte	-17
	.byte	-96
	.byte	-32
	.byte	59
	.byte	77
	.byte	-82
	.byte	42
	.byte	-11
	.byte	-80
	.byte	-56
	.byte	-21
	.byte	-69
	.byte	60
	.byte	-125
	.byte	83
	.byte	-103
	.byte	97
	.byte	23
	.byte	43
	.byte	4
	.byte	126
	.byte	-70
	.byte	119
	.byte	-42
	.byte	38
	.byte	-31
	.byte	105
	.byte	20
	.byte	99
	.byte	85
	.byte	33
	.byte	12
	.byte	125
	.align	2
	.type	_ZL5rcons, %object
	.size	_ZL5rcons, 10
_ZL5rcons:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	-128
	.byte	27
	.byte	54
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
