I have dissembled the DOS release of "The Scoop", a mystery adventure game published by Spinnaker Software in 1989.
The original code was compiled using the Microsoft C compiler. Write a C function keeping the original name that gets compiled to this assembly code by the Microsoft C 5.0 (released in 1987)
making sure you cover the following requirements:

* Only answer with the code, and nothing else.
* Keep the code as high-level as possible: do not use inline assembly, gotos nor dummy variables.
* Do not use extern variables nor pragmas, these are not supported by this old compiler.
* Import and use dos.h and other headers if needed to call a well known function ("call _strlen" is really a call to strlen, the "_" is inserted by the compiler). If you see an unknown function call, write a function implementation with an explicit empty body.
* Preserve memory usage: make sure that the local variables are in the same order.
* For segmented or global memory, just create a global variable with the name and type (e.g. `int word_F6EC`)
* Do NOT use FP_REG, FP_SEG, FP_OFF, or any other FP_ function.
* Ignore the call to `sub_AAFE` (__chkstk) since it is automatically inserted by the compiler.
* Include a main() function that calls the function you are writing using zeros as parameters and immediately return 0. The main should not call any other functions
* Do NOT include comments since these can break the compiler parsing

sub_1A9B:

var_6= byte ptr	-6
var_4= word ptr	-4
var_2= word ptr	-2
arg_0= byte ptr	 4

push	bp
mov	bp, sp
mov	ax, 6
call	__chkstk
mov	al, byte_F8A2
cmp	[bp+arg_0], al
jz	short loc_1ABF
mov	bl, [bp+arg_0]
sub	bh, bh
mov	es, seg_15422
mov	al, es:[bx+66h]
sub	ah, ah
jmp	loc_1B6C

loc_1ABF:
cmp	word_F8B0, 0
jz	short loc_1ACC
call	sub_1B70
jmp	loc_1B6C

loc_1ACC:
mov	ax, 1
push	ax
mov	ax, 0FEh ; ''
push	ds
push	ax
mov	ax, 14h
push	ax
push	ax
call	sub_3446
add	sp, 0Ah
mov	ax, 1
push	ax
mov	ax, 100h
push	ds
push	ax
mov	ax, 15h
push	ax
mov	ax, 10h
push	ax
call	sub_3446
add	sp, 0Ah
mov	ax, 1
push	ax
mov	ax, 5BE6h
push	ds
push	ax
mov	ax, 18h
push	ax
mov	ax, 7
push	ax
call	sub_3446
add	sp, 0Ah
call	sub_1ED5
mov	[bp+var_4], ax
mov	[bp+var_2], dx

loc_1B17:
call	_kbhit
or	ax, ax
jnz	short loc_1B36
call	sub_1ED5
mov	cx, [bp+var_4]
sub	cx, ax
push	cx
call	sub_BD4E
add	sp, 2
cmp	ax, 14h
jle	short loc_1B17

loc_1B32:
sub	ax, ax
jmp	short loc_1B6C

loc_1B36:
call	sub_1B70
mov	[bp+var_6], al
call	sub_99FE
mov	al, [bp+var_6]
sub	ah, ah
cmp	ax, 1
jz	short loc_1B5A
cmp	ax, 2
jz	short loc_1B5F
cmp	ax, 3
jz	short loc_1B69
cmp	ax, 5
jz	short loc_1B64
jmp	short loc_1B32

loc_1B5A:
mov	ax, 1
jmp	short loc_1B6C

loc_1B5F:
mov	ax, 2
jmp	short loc_1B6C

loc_1B64:
mov	ax, 5
jmp	short loc_1B6C

loc_1B69:
mov	ax, 3

loc_1B6C:
mov	sp, bp
pop	bp
retn

