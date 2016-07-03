	.arch armv5t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main_minus1.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.global	lock
	.bss
	.align	2
	.type	lock, %object
	.size	lock, 24576
lock:
	.space	24576
	.global	value_lock
	.align	2
	.type	value_lock, %object
	.size	value_lock, 64
value_lock:
	.space	64
	.global	S
	.align	2
	.type	S, %object
	.size	S, 644
S:
	.space	644
	.global	T
	.align	2
	.type	T, %object
	.size	T, 644
T:
	.space	644
	.global	DTW
	.align	2
	.type	DTW, %object
	.size	DTW, 104976
DTW:
	.space	104976
	.global	X
	.align	2
	.type	X, %object
	.size	X, 12
X:
	.space	12
	.global	Y
	.align	2
	.type	Y, %object
	.size	Y, 12
Y:
	.space	12
	.text
	.align	2
	.global	_Z8add_intsPiS_ji
	.type	_Z8add_intsPiS_ji, %function
_Z8add_intsPiS_ji:
	.fnstart
.LFB1232:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-28]
	add	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-24]
	bic	r2, r3, #3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z8add_intsPiS_ji, .-_Z8add_intsPiS_ji
	.align	2
	.global	_Z7minimumiii
	.type	_Z7minimumiii, %function
_Z7minimumiii:
	.fnstart
.LFB1233:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #65536
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L6
.L5:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L7
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z7minimumiii, .-_Z7minimumiii
	.align	2
	.global	_Z7minimumii
	.type	_Z7minimumii, %function
_Z7minimumii:
	.fnstart
.LFB1234:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #65536
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L10
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L11
.L10:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z7minimumii, .-_Z7minimumii
	.align	2
	.global	_Z7maximumiii
	.type	_Z7maximumiii, %function
_Z7maximumiii:
	.fnstart
.LFB1235:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L14
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	b	.L15
.L14:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L15:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L16
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z7maximumiii, .-_Z7maximumiii
	.align	2
	.global	_Z7maximumii
	.type	_Z7maximumii, %function
_Z7maximumii:
	.fnstart
.LFB1236:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L19
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	b	.L20
.L19:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L20:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z7maximumii, .-_Z7maximumii
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\011\000"
	.text
	.align	2
	.global	_Z6outputv
	.type	_Z6outputv, %function
_Z6outputv:
	.fnstart
.LFB1237:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r3, #161
	str	r3, [fp, #-12]
	b	.L23
.L27:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L26:
	ldr	r3, [fp, #-8]
	cmp	r3, #161
	bne	.L25
	ldr	r1, .L28
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r1, r3, asl #2]
	ldr	r0, .L28+4
	mov	r1, r3
	bl	_ZNSolsEi
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L28+8
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.L25:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L26
	ldr	r0, .L28+4
	ldr	r1, .L28+12
	bl	_ZNSolsEPFRSoS_E
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L23:
	ldr	r3, [fp, #-12]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L27
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L29:
	.align	2
.L28:
	.word	DTW
	.word	_ZSt4cout
	.word	.LC0
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.fnend
	.size	_Z6outputv, .-_Z6outputv
	.align	2
	.global	_Z8absolutei
	.type	_Z8absolutei, %function
_Z8absolutei:
	.fnstart
.LFB1238:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L31
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
.L31:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_Z8absolutei, .-_Z8absolutei
	.section	.rodata
	.align	2
.LC3:
	.ascii	"r\000"
	.align	2
.LC4:
	.ascii	"\012cannot open file \"%s\".\012\000"
	.align	2
.LC5:
	.ascii	"%f,%f\000"
	.align	2
.LC1:
	.ascii	"input_dtw/input_std\000"
	.space	236
	.align	2
.LC2:
	.ascii	"input_dtw/input_smp\000"
	.space	236
	.text
	.align	2
	.global	_Z8get_dataiPPiS0_
	.type	_Z8get_dataiPPiS0_, %function
_Z8get_dataiPPiS0_:
	.fnstart
.LFB1239:
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #560
	sub	sp, sp, #560
	str	r0, [fp, #-552]
	str	r1, [fp, #-556]
	str	r2, [fp, #-560]
	ldr	r3, .L44+4
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	ldr	r3, .L44+8
	sub	ip, fp, #520
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr, #0]
	str	r3, [ip, #0]
	sub	r2, fp, #500
	mov	r3, #236
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	ldr	r3, .L44+12
	sub	ip, fp, #264
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr, #0]
	str	r3, [ip, #0]
	sub	r2, fp, #244
	mov	r3, #236
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	mov	r3, #18
	str	r3, [fp, #-536]
	ldr	r3, [fp, #-536]
	add	r2, r3, #1
	ldr	r3, .L44+16
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	r3, fp, #520
	mov	r0, r3
	ldr	r1, .L44+20
.LEHB0:
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-532]
	ldr	r3, [fp, #-532]
	cmp	r3, #0
	bne	.L34
	sub	r3, fp, #520
	ldr	r0, .L44+24
	mov	r1, r3
	bl	printf
	mov	r0, #1
	bl	exit
.L34:
	ldr	r3, [fp, #-552]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-528]
	ldr	r3, [fp, #-552]
	str	r3, [fp, #-524]
	ldr	r3, [fp, #-528]
	str	r3, [fp, #-540]
	flds	s15, .L44
	fsts	s15, [fp, #-548]
	flds	s15, .L44
	fsts	s15, [fp, #-544]
	b	.L35
.L36:
	sub	r2, fp, #548
	sub	r3, fp, #544
	ldr	r0, [fp, #-532]
	ldr	r1, .L44+28
	bl	fscanf
	flds	s15, [fp, #-548]
	ftosizs	s15, s15
	ldr	r3, [fp, #-540]
	fsts	s15, [r3, #0]	@ int
	ldr	r3, [fp, #-540]
	add	r3, r3, #4
	str	r3, [fp, #-540]
.L35:
	ldr	r3, [fp, #-552]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	ldr	r2, [fp, #-552]
	sub	r2, r2, #1
	str	r2, [fp, #-552]
	cmp	r3, #0
	bne	.L36
	ldr	r0, [fp, #-532]
	bl	fclose
	ldr	r3, [fp, #-556]
	ldr	r2, [fp, #-528]
	str	r2, [r3, #0]
	sub	r3, fp, #264
	mov	r0, r3
	ldr	r1, .L44+20
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-532]
	ldr	r3, [fp, #-532]
	cmp	r3, #0
	bne	.L37
	sub	r3, fp, #264
	ldr	r0, .L44+24
	mov	r1, r3
	bl	printf
	mov	r0, #1
	bl	exit
.L37:
	ldr	r3, [fp, #-524]
	str	r3, [fp, #-552]
	ldr	r3, [fp, #-552]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-528]
	ldr	r3, [fp, #-528]
	str	r3, [fp, #-540]
	flds	s15, .L44
	fsts	s15, [fp, #-548]
	flds	s15, .L44
	fsts	s15, [fp, #-544]
	b	.L38
.L39:
	sub	r2, fp, #548
	sub	r3, fp, #544
	ldr	r0, [fp, #-532]
	ldr	r1, .L44+28
	bl	fscanf
	flds	s15, [fp, #-548]
	ftosizs	s15, s15
	ldr	r3, [fp, #-540]
	fsts	s15, [r3, #0]	@ int
	ldr	r3, [fp, #-540]
	add	r3, r3, #4
	str	r3, [fp, #-540]
.L38:
	ldr	r3, [fp, #-552]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r3, r3, #255
	ldr	r2, [fp, #-552]
	sub	r2, r2, #1
	str	r2, [fp, #-552]
	cmp	r3, #0
	bne	.L39
	ldr	r0, [fp, #-532]
	bl	fclose
.LEHE0:
	ldr	r3, [fp, #-560]
	ldr	r2, [fp, #-528]
	str	r2, [r3, #0]
	ldr	r3, .L44+4
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L41
	b	.L43
.L42:
.LEHB1:
	bl	__cxa_end_cleanup
.LEHE1:
.L43:
	bl	__stack_chk_fail
.L41:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L45:
	.align	2
.L44:
	.word	0
	.word	__stack_chk_guard
	.word	.LC1
	.word	.LC2
	.word	-516
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1239:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1239-.LLSDACSB1239
.LLSDACSB1239:
	.uleb128 .LEHB0-.LFB1239
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L42-.LFB1239
	.uleb128 0
	.uleb128 .LEHB1-.LFB1239
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1239:
	.text
	.fnend
	.size	_Z8get_dataiPPiS0_, .-_Z8get_dataiPPiS0_
	.section	.rodata
	.align	2
.LC6:
	.ascii	"\012-----------------------------------------------"
	.ascii	"--------\000"
	.text
	.align	2
	.global	_Z10initializeb
	.type	_Z10initializeb, %function
_Z10initializeb:
	.fnstart
.LFB1240:
	@ args = 0, pretend = 0, frame = 1336
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #1328
	sub	sp, sp, #1328
	.pad #8
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-1333]
	mov	r3, #0
	str	r3, [fp, #-1332]
	b	.L47
.L48:
	ldr	r3, [fp, #-1332]
	add	r2, r3, #1
	ldr	r1, [fp, #-1332]
	ldr	r3, .L71
	mov	r1, r1, asl #2
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-1332]
	add	r3, r3, #1
	str	r3, [fp, #-1332]
.L47:
	ldr	r3, [fp, #-1332]
	cmp	r3, #160
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L48
	mov	r3, #0
	str	r3, [fp, #-1328]
	b	.L49
.L50:
	ldr	r2, [fp, #-1328]
	ldr	r3, .L71
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, .L71+4
	ldr	r2, [fp, #-1328]
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-1328]
	add	r3, r3, #1
	str	r3, [fp, #-1328]
.L49:
	ldr	r3, [fp, #-1328]
	cmp	r3, #160
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L50
	mov	r3, #0
	str	r3, [fp, #-1324]
	b	.L51
.L52:
	ldr	r3, [fp, #-1324]
	add	r2, r3, #3
	ldr	r1, [fp, #-1324]
	ldr	r3, .L71+8
	mov	r1, r1, asl #2
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-1324]
	add	r3, r3, #1
	str	r3, [fp, #-1324]
.L51:
	ldr	r3, [fp, #-1324]
	cmp	r3, #160
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L52
	mov	r3, #0
	str	r3, [fp, #-1320]
	b	.L53
.L54:
	ldr	r2, [fp, #-1320]
	ldr	r3, .L71+8
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, .L71+12
	ldr	r2, [fp, #-1320]
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-1320]
	add	r3, r3, #1
	str	r3, [fp, #-1320]
.L53:
	ldr	r3, [fp, #-1320]
	cmp	r3, #160
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L54
	mov	r3, #1
	str	r3, [fp, #-1316]
	b	.L55
.L58:
	mov	r3, #1
	str	r3, [fp, #-1312]
	b	.L56
.L57:
	ldr	r1, .L71+16
	ldr	r2, [fp, #-1316]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-1312]
	add	r3, r3, r2
	mvn	r2, #0
	str	r2, [r1, r3, asl #2]
	ldr	r3, [fp, #-1312]
	add	r3, r3, #1
	str	r3, [fp, #-1312]
.L56:
	ldr	r3, [fp, #-1312]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L57
	ldr	r3, [fp, #-1316]
	add	r3, r3, #1
	str	r3, [fp, #-1316]
.L55:
	ldr	r3, [fp, #-1316]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L58
	ldr	r0, .L71+20
	ldr	r1, .L71+24
.LEHB2:
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L71+28
	bl	_ZNSolsEPFRSoS_E
.LEHE2:
	mov	r3, #1
	str	r3, [fp, #-1308]
	b	.L59
.L60:
	ldr	r1, .L71+16
	ldr	r2, [fp, #-1308]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	mov	r2, #65536
	str	r2, [r3, #0]
	ldr	r3, .L71+16
	ldr	r2, [fp, #-1308]
	mov	r1, #65536
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-1308]
	add	r3, r3, #1
	str	r3, [fp, #-1308]
.L59:
	ldr	r3, [fp, #-1308]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L60
	mov	r3, #1
	str	r3, [fp, #-1304]
	b	.L61
.L62:
	ldr	r0, .L71+16
	ldr	r2, [fp, #-1304]
	mov	r1, #4
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r0, r3
	add	r3, r3, r1
	mov	r2, #65536
	str	r2, [r3, #0]
	ldr	r3, .L71+4
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-1304]
	sub	r1, r3, #1
	ldr	r3, .L71+12
	ldr	r3, [r3, r1, asl #2]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	_Z8absolutei
	mov	r1, r0
	ldr	r3, .L71+16
	ldr	r2, [fp, #-1304]
	add	r2, r2, #162
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-1304]
	add	r3, r3, #1
	str	r3, [fp, #-1304]
.L61:
	ldr	r3, [fp, #-1304]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L62
	ldrb	r3, [fp, #-1333]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L63
	mov	r3, #0
	str	r3, [fp, #-1300]
	b	.L64
.L67:
	mov	r3, #0
	str	r3, [fp, #-1296]
	b	.L65
.L66:
	ldr	r1, .L71+16
	ldr	r2, [fp, #-1300]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-1296]
	add	r3, r3, r2
	mov	r2, #65536
	str	r2, [r1, r3, asl #2]
	ldr	r3, [fp, #-1296]
	add	r3, r3, #1
	str	r3, [fp, #-1296]
.L65:
	ldr	r3, [fp, #-1296]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L66
	ldr	r3, [fp, #-1300]
	add	r3, r3, #1
	str	r3, [fp, #-1300]
.L64:
	ldr	r3, [fp, #-1300]
	cmp	r3, #161
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L67
.L63:
	ldr	r3, .L71+16
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L70
.L69:
.LEHB3:
	bl	__cxa_end_cleanup
.LEHE3:
.L70:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L72:
	.align	2
.L71:
	.word	-1288
	.word	S
	.word	-644
	.word	T
	.word	DTW
	.word	_ZSt4cout
	.word	.LC6
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1240:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1240-.LLSDACSB1240
.LLSDACSB1240:
	.uleb128 .LEHB2-.LFB1240
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L69-.LFB1240
	.uleb128 0
	.uleb128 .LEHB3-.LFB1240
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE1240:
	.text
	.fnend
	.size	_Z10initializeb, .-_Z10initializeb
	.align	2
	.global	_Z6masterPv
	.type	_Z6masterPv, %function
_Z6masterPv:
	.fnstart
.LFB1241:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #76
	str	r0, [fp, #-88]
	ldr	r3, [fp, #-88]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, #1
	str	r3, [fp, #-64]
	mov	r3, #0
	strb	r3, [fp, #-81]
	mov	r3, #1
	str	r3, [fp, #-80]
	b	.L74
.L80:
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L75
.L76:
	ldr	r3, .L81
	ldr	r2, [fp, #-80]
	ldr	r2, [r3, r2, asl #2]
	ldr	r1, [fp, #-64]
	ldr	r3, [fp, #-76]
	add	r1, r1, r3
	ldr	r3, .L81+4
	ldr	r3, [r3, r1, asl #2]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	_Z8absolutei
	mov	r2, r0
	ldr	r1, [fp, #-76]
	mvn	r3, #39
	mov	r1, r1, asl #2
	sub	r0, fp, #20
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L75:
	ldr	r3, [fp, #-76]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L76
	mov	r0, r0	@ nop
.L77:
	ldr	r1, .L81+8
	ldr	r2, [fp, #-80]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-64]
	add	r3, r3, r2
	ldr	r3, [r1, r3, asl #2]
	cmn	r3, #1
	movne	r3, #0
	moveq	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L77
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L78
.L79:
	ldr	r3, [fp, #-80]
	add	r4, r3, #1
	ldr	r3, [fp, #-64]
	add	r2, r3, #1
	ldr	r3, [fp, #-72]
	add	r5, r2, r3
	ldr	r2, [fp, #-72]
	mvn	r3, #39
	mov	r2, r2, asl #2
	sub	r1, fp, #20
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r6, [r3, #0]
	ldr	r3, [fp, #-80]
	sub	r2, r3, #1
	ldr	r1, [fp, #-64]
	ldr	r3, [fp, #-72]
	add	r0, r1, r3
	ldr	r1, .L81+8
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r0, [r1, r3, asl #2]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-72]
	add	ip, r2, r3
	ldr	r1, .L81+8
	ldr	r2, [fp, #-80]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, ip
	ldr	r1, [r1, r3, asl #2]
	ldr	r3, [fp, #-64]
	sub	r2, r3, #1
	ldr	r3, [fp, #-72]
	add	lr, r2, r3
	ldr	ip, .L81+8
	ldr	r2, [fp, #-80]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, lr
	ldr	r3, [ip, r3, asl #2]
	mov	r2, r3
	bl	_Z7minimumiii
	mov	r3, r0
	add	r1, r6, r3
	ldr	r2, .L81+8
	mov	r3, r4
	mov	r3, r3, asl #3
	add	r3, r3, r4
	mov	r0, r3, asl #3
	add	r3, r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r5
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
.L78:
	ldr	r3, [fp, #-72]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L79
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
.L74:
	ldr	r3, [fp, #-80]
	cmp	r3, #160
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L80
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, pc}
.L82:
	.align	2
.L81:
	.word	S
	.word	T
	.word	DTW
	.cantunwind
	.fnend
	.size	_Z6masterPv, .-_Z6masterPv
	.section	.rodata
	.align	2
.LC7:
	.ascii	"================= DTW variation==============\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB1242:
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #152
	sub	sp, sp, #152
	str	r0, [fp, #-152]
	str	r1, [fp, #-156]
	mov	r0, #0
.LEHB4:
	bl	_Z10initializeb
	mov	r3, #0
	str	r3, [fp, #-144]
	b	.L84
.L85:
	ldr	r2, [fp, #-144]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #9
	mov	r2, r3
	ldr	r3, .L92
	add	r3, r2, r3
	mov	r0, r3
	mov	r1, #0
	bl	pthread_mutex_init
	ldr	r3, [fp, #-144]
	add	r3, r3, #1
	str	r3, [fp, #-144]
.L84:
	ldr	r3, [fp, #-144]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L85
	ldr	r0, .L92+4
	ldr	r1, .L92+8
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L92+12
	bl	_ZNSolsEPFRSoS_E
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
	mov	r3, #0
	str	r3, [fp, #-140]
	b	.L86
.L87:
	ldr	r2, [fp, #-140]
	mvn	r3, #63
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [fp, #-140]
	str	r2, [r3, #0]
	sub	r2, fp, #132
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #2
	sub	r1, fp, #68
	add	r3, r1, r3
	mov	r0, r2
	mov	r1, #0
	ldr	r2, .L92+16
	bl	pthread_create
	str	r0, [fp, #-136]
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L86:
	ldr	r3, [fp, #-140]
	cmp	r3, #14
	movgt	r3, #0
	movle	r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L87
	mov	r3, #15
	str	r3, [fp, #-8]
	sub	r3, fp, #68
	add	r3, r3, #60
	mov	r0, r3
	bl	_Z6masterPv
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
	bl	_Z6outputv
.LEHE4:
	mov	r3, #0
	b	.L91
.L90:
.LEHB5:
	bl	__cxa_end_cleanup
.LEHE5:
.L91:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L93:
	.align	2
.L92:
	.word	lock
	.word	_ZSt4cout
	.word	.LC7
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.word	_Z6masterPv
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1242:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1242-.LLSDACSB1242
.LLSDACSB1242:
	.uleb128 .LEHB4-.LFB1242
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L90-.LFB1242
	.uleb128 0
	.uleb128 .LEHB5-.LFB1242
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE1242:
	.text
	.fnend
	.size	main, .-main
	.section	.text._ZNSt6vectorIiSaIiEEC2Ev,"axG",%progbits,_ZNSt6vectorIiSaIiEEC5Ev,comdat
	.align	2
	.weak	_ZNSt6vectorIiSaIiEEC2Ev
	.type	_ZNSt6vectorIiSaIiEEC2Ev, %function
_ZNSt6vectorIiSaIiEEC2Ev:
	.fnstart
.LFB1245:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEEC2Ev
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZNSt6vectorIiSaIiEEC2Ev, .-_ZNSt6vectorIiSaIiEEC2Ev
	.weak	_ZNSt6vectorIiSaIiEEC1Ev
_ZNSt6vectorIiSaIiEEC1Ev = _ZNSt6vectorIiSaIiEEC2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev, %function
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev:
	.fnstart
.LFB1254:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	_ZNSaIiED2Ev
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev = _ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEEC2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEEC5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEEC2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEEC2Ev, %function
_ZNSt12_Vector_baseIiSaIiEEC2Ev:
	.fnstart
.LFB1256:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEEC2Ev, .-_ZNSt12_Vector_baseIiSaIiEEC2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEEC1Ev
_ZNSt12_Vector_baseIiSaIiEEC1Ev = _ZNSt12_Vector_baseIiSaIiEEC2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEED2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEED2Ev, %function
_ZNSt12_Vector_baseIiSaIiEED2Ev:
	.fnstart
.LFB1259:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r1, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	rsb	r3, r3, r1
	mov	r3, r3, asr #2
	ldr	r0, [fp, #-8]
	mov	r1, r2
	mov	r2, r3
.LEHB6:
	bl	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij
.LEHE6:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev
	ldr	r3, [fp, #-8]
	b	.L108
.L107:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev
.LEHB7:
	bl	__cxa_end_cleanup
.LEHE7:
.L108:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1259:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1259-.LLSDACSB1259
.LLSDACSB1259:
	.uleb128 .LEHB6-.LFB1259
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L107-.LFB1259
	.uleb128 0
	.uleb128 .LEHB7-.LFB1259
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE1259:
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEED2Ev, .-_ZNSt12_Vector_baseIiSaIiEED2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEED1Ev
_ZNSt12_Vector_baseIiSaIiEED1Ev = _ZNSt12_Vector_baseIiSaIiEED2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev
	.type	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev, %function
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev:
	.fnstart
.LFB1266:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	_ZNSaIiEC2Ev
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev, .-_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev = _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev
	.section	.text._ZNSaIiED2Ev,"axG",%progbits,_ZNSaIiED5Ev,comdat
	.align	2
	.weak	_ZNSaIiED2Ev
	.type	_ZNSaIiED2Ev, %function
_ZNSaIiED2Ev:
	.fnstart
.LFB1269:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	_ZN9__gnu_cxx13new_allocatorIiED2Ev
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSaIiED2Ev, .-_ZNSaIiED2Ev
	.weak	_ZNSaIiED1Ev
_ZNSaIiED1Ev = _ZNSaIiED2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij
	.type	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij, %function
_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij:
	.fnstart
.LFB1271:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L115
	ldr	r3, [fp, #-8]
	mov	r0, r3
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-16]
	bl	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij
.L115:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij, .-_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij
	.section	.text._ZNSaIiEC2Ev,"axG",%progbits,_ZNSaIiEC5Ev,comdat
	.align	2
	.weak	_ZNSaIiEC2Ev
	.type	_ZNSaIiEC2Ev, %function
_ZNSaIiEC2Ev:
	.fnstart
.LFB1275:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZNSaIiEC2Ev, .-_ZNSaIiEC2Ev
	.weak	_ZNSaIiEC1Ev
_ZNSaIiEC1Ev = _ZNSaIiEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorIiED2Ev,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiED5Ev,comdat
	.align	2
	.weak	_ZN9__gnu_cxx13new_allocatorIiED2Ev
	.type	_ZN9__gnu_cxx13new_allocatorIiED2Ev, %function
_ZN9__gnu_cxx13new_allocatorIiED2Ev:
	.fnstart
.LFB1278:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiED2Ev, .-_ZN9__gnu_cxx13new_allocatorIiED2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIiED1Ev
_ZN9__gnu_cxx13new_allocatorIiED1Ev = _ZN9__gnu_cxx13new_allocatorIiED2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij,comdat
	.align	2
	.weak	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij
	.type	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij, %function
_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij:
	.fnstart
.LFB1280:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r0, [fp, #-12]
	bl	_ZdlPv
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij, .-_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij
	.section	.text._ZN9__gnu_cxx13new_allocatorIiEC2Ev,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiEC5Ev,comdat
	.align	2
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.type	_ZN9__gnu_cxx13new_allocatorIiEC2Ev, %function
_ZN9__gnu_cxx13new_allocatorIiEC2Ev:
	.fnstart
.LFB1282:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiEC2Ev, .-_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC1Ev
_ZN9__gnu_cxx13new_allocatorIiEC1Ev = _ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.text
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB1284:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L127
	ldr	r2, [fp, #-12]
	ldr	r3, .L129
	cmp	r2, r3
	bne	.L127
	ldr	r0, .L129+4
	bl	_ZNSt8ios_base4InitC1Ev
	ldr	r0, .L129+4
	ldr	r1, .L129+8
	ldr	r2, .L129+12
	bl	__aeabi_atexit
	ldr	r0, .L129+16
	bl	_ZNSt6vectorIiSaIiEEC1Ev
	ldr	r0, .L129+16
	ldr	r1, .L129+20
	ldr	r2, .L129+12
	bl	__aeabi_atexit
	ldr	r0, .L129+24
	bl	_ZNSt6vectorIiSaIiEEC1Ev
	ldr	r0, .L129+24
	ldr	r1, .L129+20
	ldr	r2, .L129+12
	bl	__aeabi_atexit
.L127:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L130:
	.align	2
.L129:
	.word	65535
	.word	_ZStL8__ioinit
	.word	_ZNSt8ios_base4InitD1Ev
	.word	__dso_handle
	.word	X
	.word	_ZNSt6vectorIiSaIiEED1Ev
	.word	Y
	.cantunwind
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",%progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.align	2
	.weak	_ZNSt6vectorIiSaIiEED2Ev
	.type	_ZNSt6vectorIiSaIiEED2Ev, %function
_ZNSt6vectorIiSaIiEED2Ev:
	.fnstart
.LFB1286:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	.save {r4, r5, fp, lr}
	.setfp fp, sp, #12
	add	fp, sp, #12
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r5, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r4, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv
	mov	r3, r0
	mov	r0, r5
	mov	r1, r4
	mov	r2, r3
.LEHB8:
	bl	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E
.LEHE8:
	ldr	r3, [fp, #-16]
	mov	r0, r3
.LEHB9:
	bl	_ZNSt12_Vector_baseIiSaIiEED2Ev
.LEHE9:
	ldr	r3, [fp, #-16]
	b	.L136
.L135:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEED2Ev
.LEHB10:
	bl	__cxa_end_cleanup
.LEHE10:
.L136:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA1286:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1286-.LLSDACSB1286
.LLSDACSB1286:
	.uleb128 .LEHB8-.LFB1286
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L135-.LFB1286
	.uleb128 0
	.uleb128 .LEHB9-.LFB1286
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB1286
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE1286:
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",%progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.fnend
	.size	_ZNSt6vectorIiSaIiEED2Ev, .-_ZNSt6vectorIiSaIiEED2Ev
	.weak	_ZNSt6vectorIiSaIiEED1Ev
_ZNSt6vectorIiSaIiEED1Ev = _ZNSt6vectorIiSaIiEED2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv
	.type	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv, %function
_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:
	.fnstart
.LFB1288:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv
	.section	.text._ZSt8_DestroyIPiiEvT_S1_RSaIT0_E,"axG",%progbits,_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E,comdat
	.align	2
	.weak	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E
	.type	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E, %function
_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E:
	.fnstart
.LFB1289:
	@ args = 0, pretend = 0, frame = 16
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
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	_ZSt8_DestroyIPiEvT_S1_
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E, .-_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E
	.section	.text._ZSt8_DestroyIPiEvT_S1_,"axG",%progbits,_ZSt8_DestroyIPiEvT_S1_,comdat
	.align	2
	.weak	_ZSt8_DestroyIPiEvT_S1_
	.type	_ZSt8_DestroyIPiEvT_S1_, %function
_ZSt8_DestroyIPiEvT_S1_:
	.fnstart
.LFB1290:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.cantunwind
	.fnend
	.size	_ZSt8_DestroyIPiEvT_S1_, .-_ZSt8_DestroyIPiEvT_S1_
	.section	.text._ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_,"axG",%progbits,_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_,comdat
	.align	2
	.weak	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_
	.type	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_, %function
_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_:
	.fnstart
.LFB1291:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_, .-_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_
	.text
	.align	2
	.type	_GLOBAL__sub_I_lock, %function
_GLOBAL__sub_I_lock:
	.fnstart
.LFB1292:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #1
	ldr	r1, .L143
	bl	_Z41__static_initialization_and_destruction_0ii
	ldmfd	sp!, {fp, pc}
.L144:
	.align	2
.L143:
	.word	65535
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I_lock, .-_GLOBAL__sub_I_lock
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_lock(target1)
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
