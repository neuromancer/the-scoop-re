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

sub_198:

var_2= word ptr	-2

push	bp
mov	bp, sp
mov	ax, 2
call	__chkstk
push	si
call	sub_1A7C
call	sub_59A8
mov	[bp+var_2], 0

loc_1AD:
mov	bx, [bp+var_2]
mov	es, seg_15160
mov	byte ptr es:[bx+24C6h],	63h ; 'c'
inc	[bp+var_2]
cmp	[bp+var_2], 7
jl	short loc_1AD
mov	[bp+var_2], 0

loc_1C8:
mov	ax, 0Ah
imul	[bp+var_2]
mov	si, ax
mov	es, seg_15162
mov	byte ptr es:[si+98h], 1
mov	byte ptr es:[si+9Ah], 0
mov	byte ptr es:[si+9Bh], 63h ; 'c'
mov	byte ptr es:[si+94h], 64h ; 'd'
mov	byte ptr es:[si+95h], 64h ; 'd'
inc	[bp+var_2]
cmp	[bp+var_2], 25h	; '%'
jl	short loc_1C8
mov	es, seg_15164
push	es:word_F12A
push	es:word_F128
mov	es, seg_15166
call	es:word_E9D4
add	sp, 4
mov	ax, 5
push	ax
mov	es, seg_15168
assume es:dseg
mov	al, es:byte_1478A
sub	ah, ah
push	ax
call	sub_5588
add	sp, 4
pop	si
mov	sp, bp
pop	bp
retn

