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
	1:     ldr     r8, [r2]
       str     r8, [r1, #0]
       add     r2, r2, #4
       subs    r3, r3, #1
       bne     1b
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
.LC0:
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
	.word	.LC0
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
	       ldr     r8, [r1, #0]
       str     r8, [r2]
       add     r2, r2, #4
       sub    r3, r3, #1

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
.LC1:
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
	.word	.LC1
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
	       ldr     r8, [r2]
       str     r8, [r3, #0]

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
	       ldr     r8, [r1, #0]
       str     r8, [r2]
       add     r2, r2, #4
       sub    r3, r3, #1

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
	       ldr     r8, [r2]
       str     r8, [r3, #0]

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
	       ldr     r8, [r1, #0]
       str     r8, [r2]
       add     r2, r2, #4
       sub    r3, r3, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
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
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

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
	.global	rank
	.bss
	.align	2
	.type	rank, %object
	.size	rank, 4
rank:
	.space	4
	.data
	.align	2
	.type	_ZL8DATA_LEN, %object
	.size	_ZL8DATA_LEN, 4
_ZL8DATA_LEN:
	.word	2000
	.align	2
	.type	_ZL10BUCKET_LEN, %object
	.size	_ZL10BUCKET_LEN, 4
_ZL10BUCKET_LEN:
	.word	10
	.section	.rodata
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"r\000"
	.align	2
.LC5:
	.ascii	"\012cannot open file \"%s\".\012\000"
	.align	2
.LC2:
	.ascii	"input_histogram/input_\000"
	.space	233
	.text
	.align	2
	.global	_Z8get_dataiPiS_i
	.type	_Z8get_dataiPiS_i, %function
_Z8get_dataiPiS_i:
	.fnstart
.LFB32:
	@ args = 0, pretend = 0, frame = 320
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #320
	sub	sp, sp, #320
	str	r0, [fp, #-312]
	str	r1, [fp, #-316]
	str	r2, [fp, #-320]
	str	r3, [fp, #-324]
	ldr	r3, .L376
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	ldr	r3, .L376+4
	sub	ip, fp, #264
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	str	r0, [ip, #0]
	add	ip, ip, #4
	strh	r1, [ip, #0]	@ movhi
	add	ip, ip, #2
	mov	r3, r1, lsr #16
	strb	r3, [ip, #0]
	sub	r2, fp, #241
	mov	r3, #233
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	mov	r3, #22
	str	r3, [fp, #-296]
	sub	r3, fp, #284
	mov	r0, r3
	ldr	r1, .L376+8
	ldr	r2, [fp, #-324]
	bl	sprintf
	mov	r3, #0
	str	r3, [fp, #-304]
	b	.L364
.L365:
	ldr	r2, [fp, #-296]
	ldr	r3, [fp, #-304]
	add	r1, r2, r3
	ldr	r3, .L376+12
	ldr	r2, [fp, #-304]
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, .L376+16
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-304]
	add	r3, r3, #1
	str	r3, [fp, #-304]
.L364:
	ldr	r3, .L376+12
	ldr	r2, [fp, #-304]
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L365
	ldr	r2, [fp, #-296]
	ldr	r3, [fp, #-304]
	add	r2, r2, r3
	ldr	r3, .L376+16
	sub	r0, fp, #4
	add	r2, r0, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	r3, fp, #264
	mov	r0, r3
	ldr	r1, .L376+20
.LEHB30:
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-292]
	ldr	r3, [fp, #-292]
	cmp	r3, #0
	bne	.L366
	sub	r3, fp, #264
	ldr	r0, .L376+24
	mov	r1, r3
	bl	printf
	mov	r0, #1
	bl	exit
.L366:
	ldr	r3, [fp, #-312]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-288]
	ldr	r3, [fp, #-288]
	str	r3, [fp, #-300]
	b	.L367
.L370:
	ldr	r0, [fp, #-292]
	ldr	r1, .L376+8
	ldr	r2, [fp, #-300]
	bl	fscanf
	ldr	r3, [fp, #-300]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-316]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	.L368
	ldr	r3, [fp, #-300]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-316]
	str	r2, [r3, #0]
	b	.L369
.L368:
	ldr	r3, [fp, #-300]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-320]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	ble	.L369
	ldr	r3, [fp, #-300]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-320]
	str	r2, [r3, #0]
.L369:
	ldr	r3, [fp, #-300]
	add	r3, r3, #4
	str	r3, [fp, #-300]
.L367:
	ldr	r3, [fp, #-312]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	ldr	r2, [fp, #-312]
	sub	r2, r2, #1
	str	r2, [fp, #-312]
	cmp	r3, #0
	bne	.L370
	ldr	r0, [fp, #-292]
	bl	fclose
.LEHE30:
	ldr	r3, [fp, #-288]
	mov	r0, r3
	ldr	r3, .L376
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L373
	b	.L375
.L374:
.LEHB31:
	bl	__cxa_end_cleanup
.LEHE31:
.L375:
	bl	__stack_chk_fail
.L373:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L377:
	.align	2
.L376:
	.word	__stack_chk_guard
	.word	.LC2
	.word	.LC3
	.word	-280
	.word	-260
	.word	.LC4
	.word	.LC5
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA32:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE32-.LLSDACSB32
.LLSDACSB32:
	.uleb128 .LEHB30-.LFB32
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L374-.LFB32
	.uleb128 0
	.uleb128 .LEHB31-.LFB32
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSE32:
	.text
	.fnend
	.size	_Z8get_dataiPiS_i, .-_Z8get_dataiPiS_i
	.align	2
	.global	_Z16get_bucket_cachei
	.type	_Z16get_bucket_cachei, %function
_Z16get_bucket_cachei:
	.fnstart
.LFB33:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r0, [fp, #-8]
	mov	r1, #0
	mov	r2, r3
	bl	memset
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_Z16get_bucket_cachei, .-_Z16get_bucket_cachei
	.global	__aeabi_idiv
	.section	.rodata
	.align	2
.LC6:
	.ascii	"RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROR on"
	.ascii	" core %d; cache_len=%d; b=%d\012\000"
	.text
	.align	2
	.global	_Z9histogramPiiiiS_i
	.type	_Z9histogramPiiiiS_i, %function
_Z9histogramPiiiiS_i:
	.fnstart
.LFB34:
	@ args = 8, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #40
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L381
.L384:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	ldr	r2, [fp, #8]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-12]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	bne	.L382
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L382:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	blt	.L383
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	bge	.L383
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L381
.L383:
	ldr	r3, .L385
	ldr	r3, [r3, #0]
	ldr	r0, .L385+4
	mov	r1, r3
	ldr	r2, [fp, #8]
	ldr	r3, [fp, #-20]
	bl	printf
	mov	r0, #0
	bl	exit
.L381:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L384
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L386:
	.align	2
.L385:
	.word	rank
	.word	.LC6
	.fnend
	.size	_Z9histogramPiiiiS_i, .-_Z9histogramPiiiiS_i
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Usage: %s [-h] | [-n DATA SIZE] [-b BUCKET SIZE]\012"
	.ascii	"\000"
	.text
	.align	2
	.global	_Z5usagePKc
	.type	_Z5usagePKc, %function
_Z5usagePKc:
	.fnstart
.LFB35:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, .L388
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, .L388+4
	ldr	r2, [fp, #-8]
	bl	fprintf
	mov	r0, #1
	bl	exit
.L389:
	.align	2
.L388:
	.word	stderr
	.word	.LC7
	.fnend
	.size	_Z5usagePKc, .-_Z5usagePKc
	.section	.rodata
	.align	2
.LC8:
	.ascii	"hn:b:\000"
	.text
	.align	2
	.global	_Z11get_optionsiPPc
	.type	_Z11get_optionsiPPc, %function
_Z11get_optionsiPPc:
	.fnstart
.LFB36:
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
	b	.L391
.L395:
	ldr	r3, [fp, #-8]
	cmp	r3, #98
	beq	.L393
	cmp	r3, #110
	bne	.L396
.L394:
	ldr	r3, .L397
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r2, r0
	ldr	r3, .L397+4
	str	r2, [r3, #0]
	b	.L391
.L393:
	ldr	r3, .L397
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r2, r0
	ldr	r3, .L397+8
	str	r2, [r3, #0]
	b	.L391
.L396:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	_Z5usagePKc
.L391:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, .L397+12
	bl	getopt
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L395
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L398:
	.align	2
.L397:
	.word	optarg
	.word	_ZL8DATA_LEN
	.word	_ZL10BUCKET_LEN
	.word	.LC8
	.fnend
	.size	_Z11get_optionsiPPc, .-_Z11get_optionsiPPc
	.section	.rodata
	.align	2
.LC9:
	.ascii	"RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRROR b="
	.ascii	"%d\012\000"
	.align	2
.LC10:
	.ascii	"len %d\012\000"
	.align	2
.LC11:
	.ascii	"min %d\012\000"
	.align	2
.LC12:
	.ascii	"del %d\012\000"
	.align	2
.LC13:
	.ascii	"result[%d]=%d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB37:
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #208
	sub	sp, sp, #208
	str	r0, [fp, #-200]
	str	r1, [fp, #-204]
	sub	r2, fp, #200
	sub	r3, fp, #204
	mov	r0, r2
	mov	r1, r3
.LEHB32:
	bl	_Z8MPI_InitPiPPPc
	sub	r3, fp, #196
	mov	r0, #0
	mov	r1, r3
	bl	_Z13MPI_Comm_sizeiPi
	mov	r0, #0
	ldr	r1, .L435
	bl	_Z13MPI_Comm_rankiPi
	ldr	r3, .L435+4
	str	r3, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-188]
	ldr	r3, .L435+8
	ldr	r0, [r3, #0]
	ldr	r3, .L435
	ldr	r3, [r3, #0]
	sub	r1, fp, #192
	sub	r2, fp, #188
	bl	_Z8get_dataiPiS_i
	mov	r3, r0
	str	r3, [fp, #-160]
	mov	r3, #0
	str	r3, [fp, #-184]
	mov	r3, #0
	str	r3, [fp, #-180]
	ldr	r3, [fp, #-192]
	rsb	r3, r3, #0
	str	r3, [fp, #-192]
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	_Z16get_bucket_cachei
	str	r0, [fp, #-156]
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	_Z16get_bucket_cachei
	str	r0, [fp, #-152]
	ldr	r3, [fp, #-188]
	str	r3, [fp, #-184]
	ldr	r3, [fp, #-192]
	str	r3, [fp, #-180]
	bl	m5_barrier
	ldr	r3, .L435
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L400
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
.L400:
	sub	r2, fp, #188
	sub	r3, fp, #184
	mov	r1, #1
	str	r1, [sp, #0]
	mov	r1, #0
	str	r1, [sp, #4]
	mov	r1, #0
	str	r1, [sp, #8]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #1
	mov	r3, #4
	bl	_Z10MPI_ReducePiS_iiiii
	bl	m5_barrier
	sub	r2, fp, #192
	sub	r3, fp, #180
	mov	r1, #1
	str	r1, [sp, #0]
	mov	r1, #0
	str	r1, [sp, #4]
	mov	r1, #0
	str	r1, [sp, #8]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #1
	mov	r3, #4
	bl	_Z10MPI_ReducePiS_iiiii
	ldr	r3, [fp, #-180]
	rsb	r3, r3, #0
	str	r3, [fp, #-180]
	bl	m5_barrier
	sub	r3, fp, #184
	str	r3, [fp, #-136]
	mov	r3, #1
	str	r3, [fp, #-132]
	mov	r3, #4
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-52]
	ldr	r3, .L435+16
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-128]
	cmp	r2, r3
	bne	.L401
	ldr	r3, [fp, #-128]
	orr	r3, r3, #-268435456
	orr	r3, r3, #3072
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	str	r3, [fp, #-124]
	b	.L402
.L403:
	ldr	r3, [fp, #-124]
	ldr	r2, [fp, #-136]
#APP
@ 233 "../../lib/mpi.h" 1
	       ldr     r8, [r2]
       str     r8, [r3, #0]

@ 0 "" 2
	ldr	r3, [fp, #-136]
	add	r3, r3, #4
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-132]
	sub	r3, r3, #1
	str	r3, [fp, #-132]
.L402:
	ldr	r3, [fp, #-132]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L403
	b	.L404
.L401:
	ldr	r3, .L435+20
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-120]
	str	r3, [fp, #-116]
	b	.L405
.L406:
	ldr	r3, [fp, #-116]
	ldr	r1, [fp, #-136]
	ldr	r2, [fp, #-132]
	mov	r5, r1
	mov	r4, r2
#APP
@ 254 "../../lib/mpi.h" 1
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-136]
	str	r4, [fp, #-132]
.L405:
	ldr	r3, [fp, #-132]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L406
.L404:
	bl	m5_barrier
	sub	r3, fp, #180
	str	r3, [fp, #-112]
	mov	r3, #1
	str	r3, [fp, #-108]
	mov	r3, #4
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-104]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, .L435+16
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-104]
	cmp	r2, r3
	bne	.L408
	ldr	r3, [fp, #-104]
	orr	r3, r3, #-268435456
	orr	r3, r3, #3072
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-100]
	b	.L409
.L410:
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-112]
#APP
@ 233 "../../lib/mpi.h" 1
	       ldr     r8, [r2]
       str     r8, [r3, #0]

@ 0 "" 2
	ldr	r3, [fp, #-112]
	add	r3, r3, #4
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-108]
	sub	r3, r3, #1
	str	r3, [fp, #-108]
.L409:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L410
	b	.L411
.L408:
	ldr	r3, .L435+20
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-92]
	b	.L412
.L413:
	ldr	r3, [fp, #-92]
	ldr	r1, [fp, #-112]
	ldr	r2, [fp, #-108]
	mov	r5, r1
	mov	r4, r2
#APP
@ 254 "../../lib/mpi.h" 1
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-112]
	str	r4, [fp, #-108]
.L412:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L413
.L411:
	ldr	r2, [fp, #-184]
	ldr	r3, [fp, #-180]
	rsb	r3, r3, r2
	str	r3, [fp, #-148]
	mov	r3, #0
	str	r3, [fp, #-172]
	b	.L415
.L418:
	ldr	r3, [fp, #-172]
	ldr	r2, [fp, #-160]
    .word 0xeff00001
    .word 0xf0000000
//	mov	r3, r3, asl #2
//	add	r3, r2, r3
//
	ldr	r8, [r3, #0]
	ldr	r3, [fp, #-180]
	ldr	r2, .L435+12
	ldr	r2, [r2, #0]
    .word 0xeff00000
    .word 0xf0000000
//	rsb	r3, r3, r8
//	mul	r3, r2, r3
//	mov	r0, r3
//
	ldr	r1, [fp, #-148]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-168]
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-168]
	cmp	r2, r3
	bne	.L416
	ldr	r3, [fp, #-168]
	sub	r3, r3, #1
	str	r3, [fp, #-168]
.L416:
	ldr	r3, [fp, #-168]
	cmp	r3, #0
	blt	.L417
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-168]
	cmp	r2, r3
	bge	.L417
	ldr	r3, [fp, #-168]
	ldr	r2, [fp, #-156]
    .word 0xeff00001
    .word 0xf0000000
//	mov	r3, r3, asl #2
//	add	r3, r2, r3
//
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, [fp, #-172]
	add	r3, r3, #1
	str	r3, [fp, #-172]
	b	.L415
.L417:
	ldr	r0, .L435+24
	ldr	r1, [fp, #-168]
	bl	printf
	mov	r0, #0
	bl	exit
.L415:
	ldr	r3, .L435+8
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-172]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L418
	bl	m5_barrier
	mov	r3, #0
	str	r3, [fp, #-172]
	b	.L419
.L427:
	ldr	r3, .L435
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-172]
	cmp	r2, r3
	bne	.L420
	ldr	r3, [fp, #-196]
	ldr	r2, [fp, #-172]
	cmp	r2, r3
	bge	.L420
	ldr	r3, [fp, #-172]
	ldr	r2, [fp, #-152]
    .word 0xeff00002
    .word 0xf0000000
//	mov	r3, r3, asl #2
//	add	r3, r2, r3
//
	ldr	r2, [fp, #-172]
	ldr	r1, [fp, #-156]
    .word 0xeff00004
    .word 0xf0000000
//	mov	r2, r2, asl #2
//	add	r2, r1, r2
//	mov	r6, #0
//    
	ldr	r2, [r2, #0]
	str	r2, [r3, #0]
	str	r6, [fp, #-164]
	b	.L421
.L425:
	ldr	r3, .L435
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-164]
	cmp	r2, r3
	beq	.L422
	sub	r3, fp, #176
	str	r3, [fp, #-88]
	mov	r3, #1
	str	r3, [fp, #-84]
	mov	r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	sub	r3, fp, #196
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #6
	orr	r3, r3, #-268435456
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-76]
	b	.L423
.L424:
	ldr	r3, [fp, #-76]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-84]
	mov	r5, r1
	mov	r4, r2
#APP
@ 141 "../../lib/mpi.h" 1
	       ldr     r8, [r3, #0]
       str     r8, [r5]
       add     r5, r5, #4
       sub    r4, r4, #1

@ 0 "" 2
	str	r5, [fp, #-88]
	str	r4, [fp, #-84]
.L423:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L424
	ldr	r3, [fp, #-172]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r2, r3
	ldr	r2, [fp, #-172]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-152]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-176]
	add	r2, r1, r2
	str	r2, [r3, #0]
.L422:
	ldr	r3, [fp, #-164]
	add	r3, r3, #1
	str	r3, [fp, #-164]
.L421:
	ldr	r3, [fp, #-196]
	ldr	r2, [fp, #-164]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L425
	b	.L426
.L420:
	ldr	r3, [fp, #-172]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	mov	r3, #1
	str	r3, [fp, #-68]
	mov	r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-172]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
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
	1:     ldr     r8, [r5]
       str     r8, [r3, #0]
       add     r5, r5, #4
       subs    r4, r4, #1
       bne     1b
@ 0 "" 2
	str	r5, [fp, #-72]
	str	r4, [fp, #-68]
.L426:
	ldr	r3, [fp, #-172]
	add	r3, r3, #1
	str	r3, [fp, #-172]
.L419:
	ldr	r3, [fp, #-196]
	ldr	r2, [fp, #-172]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L427
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, .L435
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L428
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
.L428:
	bl	m5_barrier
	ldr	r3, .L435
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L429
	ldr	r3, [fp, #-180]
	str	r3, [fp, #-144]
	ldr	r2, [fp, #-184]
	ldr	r3, [fp, #-144]
	rsb	r3, r3, r2
	str	r3, [fp, #-140]
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	ldr	r0, .L435+28
	mov	r1, r3
	bl	printf
	ldr	r0, .L435+32
	ldr	r1, [fp, #-144]
	bl	printf
	ldr	r0, .L435+36
	ldr	r1, [fp, #-140]
	bl	printf
.L429:
	ldr	r3, .L435
	ldr	r2, [r3, #0]
	ldr	r3, .L435+12
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	.L430
	ldr	r3, .L435
	ldr	r2, [r3, #0]
	ldr	r3, .L435
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-152]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	ldr	r0, .L435+40
	mov	r1, r2
	mov	r2, r3
	bl	printf
.LEHE32:
.L430:
	bl	_Z12MPI_Finalizev
	mov	r3, #0
	b	.L434
.L433:
.LEHB33:
	bl	__cxa_end_cleanup
.LEHE33:
.L434:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L436:
	.align	2
.L435:
	.word	rank
	.word	999999
	.word	_ZL8DATA_LEN
	.word	_ZL10BUCKET_LEN
	.word	myRank
	.word	-268432384
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA37:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE37-.LLSDACSB37
.LLSDACSB37:
	.uleb128 .LEHB32-.LFB37
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L433-.LFB37
	.uleb128 0
	.uleb128 .LEHB33-.LFB37
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
.LLSDACSE37:
	.text
	.fnend
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
