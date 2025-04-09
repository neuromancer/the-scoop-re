;	Static Name Aliases
;
;	$S268_mybuffer	EQU	mybuffer
;	$S272_myvbuffer	EQU	myvbuffer
	TITLE   CODE.C
	NAME    CODE

	.8087
_TEXT	SEGMENT  WORD PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME  CS: _TEXT, DS: DGROUP, SS: DGROUP
EXTRN	__acrtused:ABS
EXTRN	_fscanf:NEAR
EXTRN	_fsetpos:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_gets:NEAR
EXTRN	_getw:NEAR
EXTRN	_perror:NEAR
EXTRN	_printf:NEAR
EXTRN	_puts:NEAR
EXTRN	_putw:NEAR
EXTRN	_remove:NEAR
EXTRN	_rename:NEAR
EXTRN	_rewind:NEAR
EXTRN	_rmtmp:NEAR
EXTRN	_scanf:NEAR
EXTRN	_setbuf:NEAR
EXTRN	_setvbuf:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_sscanf:NEAR
EXTRN	_tempnam:NEAR
EXTRN	_tmpfile:NEAR
EXTRN	_tmpnam:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_unlink:NEAR
EXTRN	_vfprintf:NEAR
EXTRN	_vprintf:NEAR
EXTRN	_vsprintf:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_clearerr:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fcloseall:NEAR
EXTRN	_fdopen:NEAR
EXTRN	_fflush:NEAR
EXTRN	_fgetc:NEAR
EXTRN	_fgetchar:NEAR
EXTRN	_fgets:NEAR
EXTRN	_flushall:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_fputc:NEAR
EXTRN	_fputchar:NEAR
EXTRN	_fputs:NEAR
EXTRN	_fread:NEAR
EXTRN	_freopen:NEAR
EXTRN	__iob:BYTE
EXTRN	__fltused:NEAR
CONST      SEGMENT
$SG167	DB	'r',  00H
$SG184	DB	'w',  00H
$SG185	DB	'dummy_file.txt',  00H
	ORG	$+1
$SG189	DB	'hello',  00H
$SG190	DB	'This is test %d, string %s',  0aH,  00H
$SG199	DB	'Hello World',  0aH,  00H
	ORG	$+1
$SG207	DB	'a',  00H
$SG208	DB	'another_dummy.txt',  00H
$SG214	DB	'%d %19s',  00H
$SG228	DB	'Some data to write',  00H
	ORG	$+1
$SG238	DB	'An example error occurred',  00H
$SG241	DB	'example',  00H
$SG242	DB	'Example printf: number %d, string %s',  0aH,  00H
$SG245	DB	'Example puts string.',  00H
	ORG	$+1
$SG251	DB	'file_to_delete.tmp',  00H
	ORG	$+1
$SG254	DB	'new_name.txt',  00H
	ORG	$+1
$SG255	DB	'old_name.txt',  00H
	ORG	$+1
$SG265	DB	'%d %f',  00H
$SG277	DB	'value',  00H
$SG278	DB	'Sprintf example: %d %s',  00H
	ORG	$+1
$SG282	DB	'123 abc',  00H
$SG285	DB	'%d %9s',  00H
	ORG	$+1
$SG288	DB	'myapp',  00H
$SG289	DB	'C:\TEMP',  00H
$SG300	DB	'file_to_unlink.tmp',  00H
	ORG	$+1
$SG306	DB	'Vfprintf: %d %s',  0aH,  00H
	ORG	$+1
$SG311	DB	'Vprintf: %d %s',  0aH,  00H
$SG317	DB	'Vsprintf: %d %s',  00H
$SG320	DB	0aH, 'All stdio example functions called (compilation check)'
	DB	'.',  0aH,  00H
CONST      ENDS
_BSS      SEGMENT
$S268_mybuffer	DW 0100H DUP (?)
$S272_myvbuffer	DW 0100H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 4
	PUBLIC	_example_clearerr
_example_clearerr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 5
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 6
	mov	ax,OFFSET __iob
	push	ax
	call	_clearerr
; Line 7
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_clearerr	ENDP
; Line 9
	PUBLIC	_example_fclose
_example_fclose	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 10
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 11
	mov	ax,OFFSET __iob+8
	push	ax
	call	_fclose
; Line 12
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fclose	ENDP
; Line 14
	PUBLIC	_example_fcloseall
_example_fcloseall	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 15
	call	_fcloseall
; Line 16
	ret	
	nop	

_example_fcloseall	ENDP
; Line 18
	PUBLIC	_example_fdopen
_example_fdopen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_handle = -2
; Line 19
	mov	WORD PTR [bp-2],0	;dummy_handle
; Line 20
	mov	ax,OFFSET DGROUP:$SG167
	push	ax
	sub	ax,ax
	push	ax
	call	_fdopen
; Line 21
	mov	sp,bp
	pop	bp
	ret	

_example_fdopen	ENDP
; Line 23
	PUBLIC	_example_fflush
_example_fflush	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 24
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 25
	mov	ax,OFFSET __iob+8
	push	ax
	call	_fflush
; Line 26
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fflush	ENDP
; Line 28
	PUBLIC	_example_fgetc
_example_fgetc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 29
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 30
	mov	ax,OFFSET __iob
	push	ax
	call	_fgetc
; Line 31
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fgetc	ENDP
; Line 33
	PUBLIC	_example_fgetchar
_example_fgetchar	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 34
	call	_fgetchar
; Line 35
	ret	
	nop	

_example_fgetchar	ENDP
; Line 37
	PUBLIC	_example_fgets
_example_fgets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,102
	call	__chkstk
;	buffer = -102
;	fp = -2
; Line 39
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 40
	mov	ax,OFFSET __iob
	push	ax
	mov	ax,100
	push	ax
	lea	ax,WORD PTR [bp-102]	;buffer
	push	ax
	call	_fgets
; Line 41
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fgets	ENDP
; Line 43
	PUBLIC	_example_flushall
_example_flushall	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 44
	call	_flushall
; Line 45
	ret	
	nop	

_example_flushall	ENDP
; Line 47
	PUBLIC	_example_fopen
_example_fopen	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 48
	mov	ax,OFFSET DGROUP:$SG184
	push	ax
	mov	ax,OFFSET DGROUP:$SG185
	push	ax
	call	_fopen
	add	sp,4
; Line 49
	ret	

_example_fopen	ENDP
; Line 51
	PUBLIC	_example_fprintf
_example_fprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 52
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 53
	mov	ax,OFFSET DGROUP:$SG189
	push	ax
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG190
	push	ax
	mov	ax,OFFSET __iob+8
	push	ax
	call	_fprintf
; Line 54
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fprintf	ENDP
; Line 56
	PUBLIC	_example_fputc
_example_fputc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 57
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 58
	mov	ax,OFFSET __iob+8
	push	ax
	mov	ax,65
	push	ax
	call	_fputc
; Line 59
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fputc	ENDP
; Line 61
	PUBLIC	_example_fputchar
_example_fputchar	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 62
	mov	ax,66
	push	ax
	call	_fputchar
	add	sp,2
; Line 63
	ret	

_example_fputchar	ENDP
; Line 65
	PUBLIC	_example_fputs
_example_fputs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 66
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 67
	mov	ax,OFFSET __iob+8
	push	ax
	mov	ax,OFFSET DGROUP:$SG199
	push	ax
	call	_fputs
; Line 68
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fputs	ENDP
; Line 70
	PUBLIC	_example_fread
_example_fread	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__chkstk
;	buffer = -52
;	fp = -2
; Line 72
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 73
	mov	ax,OFFSET __iob
	push	ax
	mov	ax,50
	push	ax
	mov	ax,1
	push	ax
	lea	ax,WORD PTR [bp-52]	;buffer
	push	ax
	call	_fread
; Line 74
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fread	ENDP
; Line 76
	PUBLIC	_example_freopen
_example_freopen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 77
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 78
	mov	ax,OFFSET __iob+8
	push	ax
	mov	ax,OFFSET DGROUP:$SG207
	push	ax
	mov	ax,OFFSET DGROUP:$SG208
	push	ax
	call	_freopen
; Line 79
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_freopen	ENDP
; Line 81
	PUBLIC	_example_fscanf
_example_fscanf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__chkstk
;	i = -24
;	s = -20
;	fp = -22
; Line 84
	mov	WORD PTR [bp-22],OFFSET __iob	;fp
; Line 85
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	lea	ax,WORD PTR [bp-24]	;i
	push	ax
	mov	ax,OFFSET DGROUP:$SG214
	push	ax
	mov	ax,OFFSET __iob
	push	ax
	call	_fscanf
; Line 86
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fscanf	ENDP
; Line 88
	PUBLIC	_example_fsetpos
_example_fsetpos	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	new_pos = -6
;	fp = -2
; Line 89
	sub	ax,ax
	mov	WORD PTR [bp-4],ax
	mov	WORD PTR [bp-6],ax	;new_pos
; Line 90
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 91
	lea	ax,WORD PTR [bp-6]	;new_pos
	push	ax
	mov	ax,OFFSET __iob
	push	ax
	call	_fsetpos
; Line 92
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fsetpos	ENDP
; Line 94
	PUBLIC	_example_fseek
_example_fseek	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 95
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 96
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,OFFSET __iob
	push	ax
	call	_fseek
; Line 97
	mov	sp,bp
	pop	bp
	ret	

_example_fseek	ENDP
; Line 99
	PUBLIC	_example_ftell
_example_ftell	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 100
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 101
	mov	ax,OFFSET __iob
	push	ax
	call	_ftell
; Line 102
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ftell	ENDP
; Line 104
	PUBLIC	_example_fwrite
_example_fwrite	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	data = -4
;	fp = -2
; Line 105
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG228	;data
; Line 106
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 107
	mov	ax,OFFSET __iob+8
	push	ax
	mov	ax,10
	push	ax
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG228
	push	ax
	call	_fwrite
; Line 108
	mov	sp,bp
	pop	bp
	ret	

_example_fwrite	ENDP
; Line 110
	PUBLIC	_example_gets
_example_gets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,100
	call	__chkstk
;	buffer = -100
; Line 112
	lea	ax,WORD PTR [bp-100]	;buffer
	push	ax
	call	_gets
; Line 113
	mov	sp,bp
	pop	bp
	ret	

_example_gets	ENDP
; Line 115
	PUBLIC	_example_getw
_example_getw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 116
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 117
	mov	ax,OFFSET __iob
	push	ax
	call	_getw
; Line 118
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_getw	ENDP
; Line 120
	PUBLIC	_example_perror
_example_perror	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 121
	mov	ax,OFFSET DGROUP:$SG238
	push	ax
	call	_perror
	add	sp,2
; Line 122
	ret	

_example_perror	ENDP
; Line 124
	PUBLIC	_example_printf
_example_printf	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 125
	mov	ax,OFFSET DGROUP:$SG241
	push	ax
	mov	ax,42
	push	ax
	mov	ax,OFFSET DGROUP:$SG242
	push	ax
	call	_printf
	add	sp,6
; Line 126
	ret	

_example_printf	ENDP
; Line 128
	PUBLIC	_example_puts
_example_puts	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 129
	mov	ax,OFFSET DGROUP:$SG245
	push	ax
	call	_puts
	add	sp,2
; Line 130
	ret	

_example_puts	ENDP
; Line 132
	PUBLIC	_example_putw
_example_putw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 133
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 134
	mov	ax,OFFSET __iob+8
	push	ax
	mov	ax,12345
	push	ax
	call	_putw
; Line 135
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_putw	ENDP
; Line 137
	PUBLIC	_example_remove
_example_remove	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 138
	mov	ax,OFFSET DGROUP:$SG251
	push	ax
	call	_remove
	add	sp,2
; Line 139
	ret	

_example_remove	ENDP
; Line 141
	PUBLIC	_example_rename
_example_rename	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 142
	mov	ax,OFFSET DGROUP:$SG254
	push	ax
	mov	ax,OFFSET DGROUP:$SG255
	push	ax
	call	_rename
	add	sp,4
; Line 143
	ret	

_example_rename	ENDP
; Line 145
	PUBLIC	_example_rewind
_example_rewind	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 146
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 147
	mov	ax,OFFSET __iob
	push	ax
	call	_rewind
; Line 148
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_rewind	ENDP
; Line 150
	PUBLIC	_example_rmtmp
_example_rmtmp	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 151
	call	_rmtmp
; Line 152
	ret	
	nop	

_example_rmtmp	ENDP
; Line 154
	PUBLIC	_example_scanf
_example_scanf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	i = -6
;	f = -4
; Line 157
	lea	ax,WORD PTR [bp-4]	;f
	push	ax
	lea	ax,WORD PTR [bp-6]	;i
	push	ax
	mov	ax,OFFSET DGROUP:$SG265
	push	ax
	call	_scanf
; Line 158
	mov	sp,bp
	pop	bp
	ret	

_example_scanf	ENDP
; Line 160
	PUBLIC	_example_setbuf
_example_setbuf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 162
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 163
	mov	ax,OFFSET DGROUP:$S268_mybuffer
	push	ax
	mov	ax,OFFSET __iob+8
	push	ax
	call	_setbuf
; Line 164
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_setbuf	ENDP
; Line 166
	PUBLIC	_example_setvbuf
_example_setvbuf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 168
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 169
	mov	ax,512
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$S272_myvbuffer
	push	ax
	mov	ax,OFFSET __iob+8
	push	ax
	call	_setvbuf
; Line 170
	mov	sp,bp
	pop	bp
	ret	

_example_setvbuf	ENDP
; Line 172
	PUBLIC	_example_sprintf
_example_sprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,200
	call	__chkstk
;	buffer = -200
; Line 174
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	mov	ax,100
	push	ax
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	lea	ax,WORD PTR [bp-200]	;buffer
	push	ax
	call	_sprintf
; Line 175
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_sprintf	ENDP
; Line 177
	PUBLIC	_example_sscanf
_example_sscanf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__chkstk
;	input = -2
;	i = -14
;	s = -12
; Line 178
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG282	;input
; Line 181
	lea	ax,WORD PTR [bp-12]	;s
	push	ax
	lea	ax,WORD PTR [bp-14]	;i
	push	ax
	mov	ax,OFFSET DGROUP:$SG285
	push	ax
	mov	ax,OFFSET DGROUP:$SG282
	push	ax
	call	_sscanf
; Line 182
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_sscanf	ENDP
; Line 184
	PUBLIC	_example_tempnam
_example_tempnam	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 185
	mov	ax,OFFSET DGROUP:$SG288
	push	ax
	mov	ax,OFFSET DGROUP:$SG289
	push	ax
	call	_tempnam
	add	sp,4
; Line 186
	ret	

_example_tempnam	ENDP
; Line 188
	PUBLIC	_example_tmpfile
_example_tmpfile	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 189
	call	_tmpfile
; Line 190
	ret	
	nop	

_example_tmpfile	ENDP
; Line 192
	PUBLIC	_example_tmpnam
_example_tmpnam	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	name_buffer = -10
; Line 194
	lea	ax,WORD PTR [bp-10]	;name_buffer
	push	ax
	call	_tmpnam
; Line 195
	mov	sp,bp
	pop	bp
	ret	

_example_tmpnam	ENDP
; Line 197
	PUBLIC	_example_ungetc
_example_ungetc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	fp = -2
; Line 198
	mov	WORD PTR [bp-2],OFFSET __iob	;fp
; Line 199
	mov	ax,OFFSET __iob
	push	ax
	mov	ax,90
	push	ax
	call	_ungetc
; Line 200
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ungetc	ENDP
; Line 202
	PUBLIC	_example_unlink
_example_unlink	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 203
	mov	ax,OFFSET DGROUP:$SG300
	push	ax
	call	_unlink
	add	sp,2
; Line 204
	ret	

_example_unlink	ENDP
; Line 206
	PUBLIC	_example_vfprintf
_example_vfprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_args = -6
;	dummy_va_list_area = -4
;	fp = -2
; Line 209
	mov	WORD PTR [bp-2],OFFSET __iob+8	;fp
; Line 210
	lea	ax,WORD PTR [bp-4]	;dummy_va_list_area
	mov	WORD PTR [bp-6],ax	;dummy_args
; Line 211
	lea	ax,WORD PTR [bp-4]	;dummy_va_list_area
	push	ax
	mov	ax,OFFSET DGROUP:$SG306
	push	ax
	mov	ax,OFFSET __iob+8
	push	ax
	call	_vfprintf
; Line 212
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_vfprintf	ENDP
; Line 214
	PUBLIC	_example_vprintf
_example_vprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_args = -4
;	dummy_va_list_area = -2
; Line 217
	lea	ax,WORD PTR [bp-2]	;dummy_va_list_area
	mov	WORD PTR [bp-4],ax	;dummy_args
; Line 218
	lea	ax,WORD PTR [bp-2]	;dummy_va_list_area
	push	ax
	mov	ax,OFFSET DGROUP:$SG311
	push	ax
	call	_vprintf
; Line 219
	mov	sp,bp
	pop	bp
	ret	

_example_vprintf	ENDP
; Line 221
	PUBLIC	_example_vsprintf
_example_vsprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,204
	call	__chkstk
;	buffer = -204
;	dummy_args = -4
;	dummy_va_list_area = -2
; Line 225
	lea	ax,WORD PTR [bp-2]	;dummy_va_list_area
	mov	WORD PTR [bp-4],ax	;dummy_args
; Line 226
	lea	ax,WORD PTR [bp-2]	;dummy_va_list_area
	push	ax
	mov	ax,OFFSET DGROUP:$SG317
	push	ax
	lea	ax,WORD PTR [bp-204]	;buffer
	push	ax
	call	_vsprintf
; Line 227
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_vsprintf	ENDP
; Line 229
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 230
	call	_example_clearerr
; Line 231
	call	_example_fclose
; Line 232
	call	_example_fcloseall
; Line 233
	call	_example_fdopen
; Line 234
	call	_example_fflush
; Line 235
	call	_example_fgetc
; Line 236
	call	_example_fgetchar
; Line 237
	call	_example_fgets
; Line 238
	call	_example_flushall
; Line 239
	call	_example_fopen
; Line 240
	call	_example_fprintf
; Line 241
	call	_example_fputc
; Line 242
	call	_example_fputchar
; Line 243
	call	_example_fputs
; Line 244
	call	_example_fread
; Line 245
	call	_example_freopen
; Line 246
	call	_example_fscanf
; Line 247
	call	_example_fsetpos
; Line 248
	call	_example_fseek
; Line 249
	call	_example_ftell
; Line 250
	call	_example_fwrite
; Line 251
	call	_example_gets
; Line 252
	call	_example_getw
; Line 253
	call	_example_perror
; Line 254
	call	_example_printf
; Line 255
	call	_example_puts
; Line 256
	call	_example_putw
; Line 257
	call	_example_remove
; Line 258
	call	_example_rename
; Line 259
	call	_example_rewind
; Line 260
	call	_example_rmtmp
; Line 261
	call	_example_scanf
; Line 262
	call	_example_setbuf
; Line 263
	call	_example_setvbuf
; Line 264
	call	_example_sprintf
; Line 265
	call	_example_sscanf
; Line 266
	call	_example_tempnam
; Line 267
	call	_example_tmpfile
; Line 268
	call	_example_tmpnam
; Line 269
	call	_example_ungetc
; Line 270
	call	_example_unlink
; Line 271
	call	_example_vfprintf
; Line 272
	call	_example_vprintf
; Line 273
	call	_example_vsprintf
; Line 275
	mov	ax,OFFSET DGROUP:$SG320
	push	ax
	call	_printf
	add	sp,2
; Line 277
	sub	ax,ax
	ret	

_main	ENDP
_TEXT	ENDS
END
