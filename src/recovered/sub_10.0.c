I have dissembled the DOS release of "The Scoop", a mystery adventure game published by Spinnaker Software in 1989.
The original code was compiled using the Microsoft C compiler. Write a C function keeping the original name that gets compiled to this assembly code by the Microsoft C 5.0 (released in 1987)
making sure you cover the following requirements:

* Only answer with the code, and nothing else.
* Keep the code as high-level as possible: do not use inline assembly, gotos nor dummy variables.
* Do not use extern variables nor pragmas, these are not supported by this old compiler.
* Import and use dos.h and other headers if needed to call a well known function. If you see an unknown function call, write a function implementation with an explicit empty body.
* Preserve memory usage: make sure that the local variables are in the same order.
* For segmented memory access, you can define and use `#define MK_FP(a,off) ((void FAR *) (((unsigned long)(a) << 16) | (unsigned long)(off)))`. Do NOT use _DS as it is not supported in this compiler.
* Try to avoid using `DS` directly. If you still need to, use segread.
* Ignore the call to `sub_AAFE` (__chkstk) since it is automatically inserted by the compiler.
* Include a main() function that calls the function you are writing using zeros as parameters and immediately return 0. The main should not call any other functions
* Do NOT include comments since these can break the compiler parsing

sub_10:

arg_0= word ptr	 4
arg_2= dword ptr  6

push	bp
mov	bp, sp
xor	ax, ax
call	__chkstk
les	bx, [bp+arg_2]
mov	ax, es:[bx]
mov	dx, es:[bx+2]
mov	es, seg_1515C
assume es:seg002
mov	es:word_C5A0, ax
mov	es:word_C5A2, dx
mov	es, seg_1515E
sub	ax, ax
mov	word ptr es:dword_D520+2, ax
mov	word ptr es:dword_D520,	ax
mov	word_F8BC, ax
mov	word_F8BA, ax
cmp	[bp+arg_0], 1
jle	short loc_82
mov	es, word ptr [bp+arg_2+2]
assume es:nothing
les	bx, es:[bx+4]
cmp	byte ptr es:[bx], 2Fh ;	'/'
jnz	short loc_70
les	bx, [bp+arg_2]
mov	ax, es:[bx+4]
mov	dx, es:[bx+6]
mov	es, seg_1515E
assume es:seg002
mov	word ptr es:dword_D520,	ax
mov	word ptr es:dword_D520+2, dx
jmp	short loc_82

loc_70:
les	bx, [bp+arg_2]
assume es:nothing
mov	ax, es:[bx+4]
mov	dx, es:[bx+6]
mov	word_F8BA, ax
mov	word_F8BC, dx

loc_82:
cmp	[bp+arg_0], 3
jnz	short loc_C3
mov	es, seg_1515E
assume es:seg002
mov	ax, word ptr es:dword_D520
or	ax, word ptr es:dword_D520+2
jnz	short loc_B1
mov	es, word ptr [bp+arg_2+2]
assume es:nothing
mov	ax, es:[bx+8]
mov	dx, es:[bx+0Ah]
mov	es, seg_1515E
assume es:seg002
mov	word ptr es:dword_D520,	ax
mov	word ptr es:dword_D520+2, dx
jmp	short loc_C3

loc_B1:
les	bx, [bp+arg_2]
assume es:nothing
mov	ax, es:[bx+8]
mov	dx, es:[bx+0Ah]
mov	word_F8BA, ax
mov	word_F8BC, dx

loc_C3:
mov	ax, 0A482h
mov	dx, seg	seg000
push	dx
push	ax
call	__harderr
add	sp, 4
mov	ax, 1F1Bh
push	ax
mov	ax, 2
push	ax
call	_signal
add	sp, 4
mov	ax, 55F0h
push	ds
push	ax
mov	ax, 5936h
push	ds
push	ax
mov	ax, 5938h
push	ds
push	ax
call	sub_BACA
add	sp, 0Ch
call	sub_22F
call	sub_198
mov	ax, 2C06h
mov	dx, seg	seg002
push	dx
push	ax
call	_setjmp
add	sp, 4
mov	ax, word_F8BA
or	ax, word_F8BC
jnz	short loc_114
call	sub_49E7

loc_114:
call	sub_633
call	sub_11F
call	sub_14FE
pop	bp
retn

