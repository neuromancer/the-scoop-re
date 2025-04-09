I have dissembled the DOS release of "The Scoop", a mystery adventure game published by Spinnaker Software in 1989.
The original code was compiled using the Microsoft C compiler. Write a C function keeping the original name that gets compiled to this assembly code by the Microsoft C 5.0 (released in 1987)
making sure you cover the following requirements:

* Only answer with the code, and nothing else.
* Keep the code as high-level as possible: do not use inline assembly, gotos nor dummy variables.
* Do not use extern variables nor pragmas, these are not supported by this old compiler. If you see a function call, write a function implementation with an explicity empty body.
* Feel free to import and use dos.h if needed.
* Preserve memory usage: make sure that the local variables are in the same order.
* For segmented memory access, you can define and use `#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))`. Do NOT use _DS as it is not supported in this compiler.
* Try to avoid using `DS` directly. If you still need to, use segread.
* Ignore the call to `sub_AAFE` (__chkstk) since it is automatically inserted by the compiler.
* Include a main() function that calls the function you are writing using zeros as parameters and immediately return 0. The main should not call any other functions
* Do NOT include comments since these can break the compiler parsing

sub_22F:

var_A= word ptr	-0Ah
var_8= word ptr	-8
var_6= word ptr	-6

push	bp
mov	bp, sp
mov	ax, 0Ah
call	sub_AAFE ; __chkstk
mov	es, seg_1515E
assume es:seg002
les	bx, es:dword_D520
assume es:nothing
cmp	byte ptr es:[bx], 2Fh ;	'/'
jnz	short loc_253
mov	es, seg_1515E
assume es:seg002
push	word ptr es:dword_D520+2
push	bx
jmp	short loc_257

loc_253:
sub	ax, ax
push	ax
push	ax

loc_257:
call	sub_3020
add	sp, 4
call	sub_1765
call	sub_99B4
mov	es, seg_151EE
push	es:word_F16A
push	es:word_F168
mov	es, seg_15166
call	es:word_E9D4
add	sp, 4
mov	ax, 2415h
push	ax
mov	es, seg_151F0
push	es:word_C516
push	es:word_C514
mov	ax, 3
push	ax
call	sub_A307
add	sp, 8
mov	[bp+var_8], ax
call	sub_4B2
mov	ax, 1
push	ax
mov	ax, 1F4h
push	ax
call	sub_16C5
add	sp, 4
or	ax, ax
jnz	short loc_2C0
call	sub_9618
call	sub_BA18 ; _kbhit
or	ax, ax
jz	short loc_2C3
call	sub_1B70
jmp	short loc_2C3

loc_2C0:
call	sub_BA2C ; _getch

loc_2C3:
mov	es, seg_151F2
cmp	es:byte_F6E6, 1
jnz	short loc_30A
mov	es, seg_151F4
push	es:word_EA0E
push	es:word_EA0C
call	sub_B5FE
add	sp, 4
jmp	short loc_30A

loc_2E5:
call	sub_3DE1
mov	ax, 1
push	ax
push	seg_F8B4
push	word_F8B2
mov	ax, 16h
push	ax
mov	ax, 1
push	ax
call	sub_3446
add	sp, 0Ah

loc_302:
call	sub_1B70
cmp	ax, 5
jnz	short loc_302

loc_30A:
sub	ax, ax
push	ax
mov	ax, 594Ah
push	ds
push	ax
call	sub_C114
add	sp, 6
inc	ax
jz	short loc_2E5
mov	es, seg_151EE
push	es:word_F16A
push	es:word_F168
mov	es, seg_15166
call	es:word_E9D4
add	sp, 4
sub	bx, bx
mov	es, bx
assume es:seg000
mov	bx, 46Ch
mov	ax, es:[bx]
mov	[bp+var_A], ax
mov	cx, 0Ch
sub	dx, dx
div	cx
mov	[bp+var_A], dx
call	sub_3DE1
mov	[bp+var_6], 0

loc_354:
mov	ax, 1
push	ax
mov	ax, 5951h
push	ds
push	ax
mov	ax, 14h
push	ax
sub	ax, ax
push	ax
call	sub_3446
add	sp, 0Ah
mov	ax, [bp+var_A]
add	ax, 4
push	ax
call	sub_421
add	sp, 2
mov	ax, 14h
push	ax
mov	ax, 2C44h
mov	dx, seg	seg002
push	dx
push	ax
call	sub_1CBB
add	sp, 6
call	sub_3DE1
mov	bx, [bp+var_A]
shl	bx, 1
shl	bx, 1
push	word ptr [bx+0A0h]
push	word ptr [bx+9Eh]
mov	ax, 2C44h
mov	dx, seg	seg002
push	dx
push	ax
call	sub_BBFE
add	sp, 8
or	ax, ax
jz	short loc_3D8
cmp	[bp+var_6], 3
jz	short loc_3CC
mov	ax, 1
push	ax
mov	ax, 596Bh
push	ds
push	ax
mov	ax, 15h
push	ax
sub	ax, ax
push	ax
call	sub_3446
add	sp, 0Ah
call	sub_7571

loc_3CC:
inc	[bp+var_6]
cmp	[bp+var_6], 4
jge	short loc_3D8
jmp	loc_354

loc_3D8:
cmp	[bp+var_6], 4
jnz	short loc_41D
mov	ax, 1
push	ax
mov	ax, 5992h
push	ds
push	ax
mov	ax, 15h
push	ax
sub	ax, ax
push	ax
call	sub_3446
add	sp, 0Ah
mov	ax, 1
push	ax
mov	ax, 59B3h
push	ds
push	ax
mov	ax, 16h
push	ax
sub	ax, ax
push	ax
call	sub_3446
add	sp, 0Ah
call	sub_7571
call	sub_33C0
call	sub_19DF
mov	ax, 1
push	ax
call	sub_AA2C ; _exit
add	sp, 2

loc_41D:
mov	sp, bp
pop	bp
retn

