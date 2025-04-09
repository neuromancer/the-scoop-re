;	Static Name Aliases
;
;	$S269_env_var	EQU	env_var
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
PUBLIC  _search_data
PUBLIC  _sort_data
EXTRN	__acrtused:ABS
EXTRN	_ecvt:NEAR
EXTRN	_exit:NEAR
EXTRN	_fcvt:NEAR
EXTRN	_free:NEAR
EXTRN	_gcvt:NEAR
EXTRN	_getenv:NEAR
EXTRN	_itoa:NEAR
EXTRN	_labs:NEAR
EXTRN	_ldiv:NEAR
EXTRN	__lrotl:NEAR
EXTRN	__lrotr:NEAR
EXTRN	_ltoa:NEAR
EXTRN	__makepath:NEAR
EXTRN	_malloc:NEAR
EXTRN	_onexit:NEAR
EXTRN	_perror:NEAR
EXTRN	_putenv:NEAR
EXTRN	_qsort:NEAR
EXTRN	__rotl:NEAR
EXTRN	__rotr:NEAR
EXTRN	_rand:NEAR
EXTRN	_realloc:NEAR
EXTRN	__searchenv:NEAR
EXTRN	__splitpath:NEAR
EXTRN	_srand:NEAR
EXTRN	_strtod:NEAR
EXTRN	_strtol:NEAR
EXTRN	_strtoul:NEAR
EXTRN	_swab:NEAR
EXTRN	_system:NEAR
EXTRN	_ultoa:NEAR
EXTRN	_tolower:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_toupper:NEAR
EXTRN	_abort:NEAR
EXTRN	_abs:NEAR
EXTRN	_atexit:NEAR
EXTRN	_atof:NEAR
EXTRN	_atoi:NEAR
EXTRN	_atol:NEAR
EXTRN	_bsearch:NEAR
EXTRN	_calloc:NEAR
EXTRN	_div:NEAR
EXTRN	__fltused:NEAR
CONST      SEGMENT
$SG187	DB	'123.45',  00H
	ORG	$+1
$SG191	DB	'12345',  00H
$SG195	DB	'123456789',  00H
	ORG	$+24
$SG229	DB	'PATH',  00H
	ORG	$+1
$SG253	DB	'h',  00H
$SG254	DB	'stdlib',  00H
	ORG	$+1
$SG255	DB	'\msdev\include',  00H
	ORG	$+1
$SG256	DB	'c',  00H
$SG265	DB	'Error opening file',  00H
	ORG	$+1
$SG286	DB	'PATH',  00H
	ORG	$+1
$SG287	DB	'cl.exe',  00H
	ORG	$+1
$SG301	DB	'  -123.45e-2junk',  00H
	ORG	$+1
$SG306	DB	' ',  09H, '-0xABCjunk',  00H
	ORG	$+1
$SG311	DB	'  12345junk',  00H
CONST      ENDS
_DATA      SEGMENT
_search_data	DW	0aH
	DW	014H
	DW	01eH
	DW	028H
	DW	032H
_sort_data	DW	037H
	DW	016H
	DW	058H
	DW	0bH
	DW	021H
_DATA      ENDS
_BSS      SEGMENT
$S269_env_var	DW 05H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 4
	PUBLIC	_dummy_atexit_func
_dummy_atexit_func	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 6
	ret	

_dummy_atexit_func	ENDP
; Line 9
	PUBLIC	_dummy_onexit_func
_dummy_onexit_func	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 10
	sub	ax,ax
	ret	

_dummy_onexit_func	ENDP
; Line 14
	PUBLIC	_dummy_compare_func
_dummy_compare_func	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	elem1 = 4
;	elem2 = 6
;	i1 = -2
;	i2 = -4
; Line 15
	mov	bx,WORD PTR [bp+4]	;elem1
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;i1
; Line 16
	mov	bx,WORD PTR [bp+6]	;elem2
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;i2
; Line 17
	cmp	WORD PTR [bp-2],ax	;i1
	jge	$I172
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I172:
	mov	ax,WORD PTR [bp-4]	;i2
	cmp	WORD PTR [bp-2],ax	;i1
	jle	$I173
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I173:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	

_dummy_compare_func	ENDP
; Line 26
	PUBLIC	_example_abort
_example_abort	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 27
	call	_abort
; Line 28
	ret	
	nop	

_example_abort	ENDP
; Line 30
	PUBLIC	_example_abs
_example_abs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 32
	mov	ax,-10
	push	ax
	call	_abs
	mov	WORD PTR [bp-2],ax	;result
; Line 33
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_abs	ENDP
; Line 35
	PUBLIC	_example_atexit
_example_atexit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 37
	mov	ax,OFFSET _dummy_atexit_func
	push	ax
	call	_atexit
	mov	WORD PTR [bp-2],ax	;result
; Line 38
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_atexit	ENDP
; Line 40
	PUBLIC	_example_atof
_example_atof	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
	push	di
	push	si
;	result = -8
; Line 42
	mov	ax,OFFSET DGROUP:$SG187
	push	ax
	call	_atof
	add	sp,2
	lea	di,WORD PTR [bp-8]	;result
	mov	si,ax
	push	ss
	pop	es
	movsw
	movsw
	movsw
	movsw
; Line 43
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_example_atof	ENDP
; Line 45
	PUBLIC	_example_atoi
_example_atoi	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 47
	mov	ax,OFFSET DGROUP:$SG191
	push	ax
	call	_atoi
	mov	WORD PTR [bp-2],ax	;result
; Line 48
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_atoi	ENDP
; Line 50
	PUBLIC	_example_atol
_example_atol	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -4
; Line 52
	mov	ax,OFFSET DGROUP:$SG195
	push	ax
	call	_atol
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 53
	mov	sp,bp
	pop	bp
	ret	

_example_atol	ENDP
; Line 55
	PUBLIC	_example_bsearch
_example_bsearch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -2
;	key = -4
; Line 57
	mov	WORD PTR [bp-4],30	;key
; Line 58
	mov	ax,OFFSET _dummy_compare_func
	push	ax
	mov	ax,2
	push	ax
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:_search_data
	push	ax
	lea	ax,WORD PTR [bp-4]	;key
	push	ax
	call	_bsearch
	mov	WORD PTR [bp-2],ax	;result
; Line 59
	mov	sp,bp
	pop	bp
	ret	

_example_bsearch	ENDP
; Line 61
	PUBLIC	_example_calloc
_example_calloc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	ptr = -2
; Line 63
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_calloc
	mov	WORD PTR [bp-2],ax	;ptr
; Line 65
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_calloc	ENDP
; Line 67
	PUBLIC	_example_div
_example_div	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -4
; Line 69
	mov	ax,3
	push	ax
	mov	ax,10
	push	ax
	call	_div
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 70
	mov	sp,bp
	pop	bp
	ret	

_example_div	ENDP
; Line 72
_TEXT      ENDS
CONST      SEGMENT
	ORG	$-136
$T20001	DQ	0405edd3a92a30553H    ;	123.4567000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_ecvt
_example_ecvt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	result = -2
;	decpt = -6
;	sign = -4
; Line 75
	lea	ax,WORD PTR [bp-4]	;sign
	push	ax
	lea	ax,WORD PTR [bp-6]	;decpt
	push	ax
	mov	ax,5
	push	ax
	fld	QWORD PTR $T20001
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_ecvt
	mov	WORD PTR [bp-2],ax	;result
; Line 76
	mov	sp,bp
	pop	bp
	ret	

_example_ecvt	ENDP
; Line 78
	PUBLIC	_example_exit
_example_exit	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 79
	sub	ax,ax
	push	ax
	call	_exit
	add	sp,2
; Line 80
	ret	
	nop	

_example_exit	ENDP
; Line 82
	PUBLIC	_example__exit
_example__exit	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 84
	ret	

_example__exit	ENDP
; Line 86
_TEXT      ENDS
CONST      SEGMENT
$T20002	DQ	0c08edd3333333333H    ;	-987.6500000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_fcvt
_example_fcvt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	result = -2
;	decpt = -6
;	sign = -4
; Line 89
	lea	ax,WORD PTR [bp-4]	;sign
	push	ax
	lea	ax,WORD PTR [bp-6]	;decpt
	push	ax
	mov	ax,4
	push	ax
	fld	QWORD PTR $T20002
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_fcvt
	mov	WORD PTR [bp-2],ax	;result
; Line 90
	mov	sp,bp
	pop	bp
	ret	

_example_fcvt	ENDP
; Line 92
	PUBLIC	_example_free
_example_free	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 93
	sub	ax,ax
	push	ax
	call	_free
	add	sp,2
; Line 94
	ret	
	nop	

_example_free	ENDP
; Line 96
_TEXT      ENDS
CONST      SEGMENT
$T20003	DQ	0405edd2f1a9fbe77H    ;	123.4560000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_gcvt
_example_gcvt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__chkstk
;	buffer = -52
;	result = -2
; Line 99
	lea	ax,WORD PTR [bp-52]	;buffer
	push	ax
	mov	ax,6
	push	ax
	fld	QWORD PTR $T20003
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_gcvt
	mov	WORD PTR [bp-2],ax	;result
; Line 100
	mov	sp,bp
	pop	bp
	ret	

_example_gcvt	ENDP
; Line 102
	PUBLIC	_example_getenv
_example_getenv	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	value = -2
; Line 104
	mov	ax,OFFSET DGROUP:$SG229
	push	ax
	call	_getenv
	mov	WORD PTR [bp-2],ax	;value
; Line 105
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_getenv	ENDP
; Line 107
	PUBLIC	_example_itoa
_example_itoa	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__chkstk
;	buffer = -22
;	result = -2
; Line 110
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-22]	;buffer
	push	ax
	mov	ax,12345
	push	ax
	call	_itoa
	mov	WORD PTR [bp-2],ax	;result
; Line 111
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_itoa	ENDP
; Line 113
	PUBLIC	_example_labs
_example_labs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -4
; Line 115
	mov	ax,10617
	mov	dx,-19
	push	dx
	push	ax
	call	_labs
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 116
	mov	sp,bp
	pop	bp
	ret	

_example_labs	ENDP
; Line 118
	PUBLIC	_example_ldiv
_example_ldiv	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
	push	di
	push	si
;	result = -8
; Line 120
	mov	ax,7
	cwd	
	push	dx
	push	ax
	mov	ax,16960
	mov	dx,15
	push	dx
	push	ax
	call	_ldiv
	add	sp,8
	lea	di,WORD PTR [bp-8]	;result
	mov	si,ax
	push	ss
	pop	es
	movsw
	movsw
	movsw
	movsw
; Line 121
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_example_ldiv	ENDP
; Line 123
	PUBLIC	_example__lrotl
_example__lrotl	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -4
; Line 125
	mov	ax,4
	push	ax
	mov	ax,22136
	mov	dx,4660
	push	dx
	push	ax
	call	__lrotl
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 126
	mov	sp,bp
	pop	bp
	ret	

_example__lrotl	ENDP
; Line 128
	PUBLIC	_example__lrotr
_example__lrotr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	result = -4
; Line 130
	mov	ax,4
	push	ax
	mov	ax,22136
	mov	dx,4660
	push	dx
	push	ax
	call	__lrotr
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 131
	mov	sp,bp
	pop	bp
	ret	

_example__lrotr	ENDP
; Line 133
	PUBLIC	_example_ltoa
_example_ltoa	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__chkstk
;	buffer = -38
;	result = -2
; Line 136
	mov	ax,16
	push	ax
	lea	ax,WORD PTR [bp-38]	;buffer
	push	ax
	mov	ax,-10617
	mov	dx,18
	push	dx
	push	ax
	call	_ltoa
	mov	WORD PTR [bp-2],ax	;result
; Line 137
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ltoa	ENDP
; Line 139
	PUBLIC	_example__makepath
_example__makepath	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,80
	call	__chkstk
;	path_buffer = -80
; Line 141
	mov	ax,OFFSET DGROUP:$SG253
	push	ax
	mov	ax,OFFSET DGROUP:$SG254
	push	ax
	mov	ax,OFFSET DGROUP:$SG255
	push	ax
	mov	ax,OFFSET DGROUP:$SG256
	push	ax
	lea	ax,WORD PTR [bp-80]	;path_buffer
	push	ax
	call	__makepath
; Line 142
	mov	sp,bp
	pop	bp
	ret	

_example__makepath	ENDP
; Line 144
	PUBLIC	_example_malloc
_example_malloc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	ptr = -2
; Line 146
	mov	ax,100
	push	ax
	call	_malloc
	mov	WORD PTR [bp-2],ax	;ptr
; Line 148
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_malloc	ENDP
; Line 150
	PUBLIC	_example_onexit
_example_onexit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 152
	mov	ax,OFFSET _dummy_onexit_func
	push	ax
	call	_onexit
	mov	WORD PTR [bp-2],ax	;result
; Line 153
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_onexit	ENDP
; Line 155
	PUBLIC	_example_perror
_example_perror	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 157
	mov	ax,OFFSET DGROUP:$SG265
	push	ax
	call	_perror
	add	sp,2
; Line 158
	ret	

_example_perror	ENDP
; Line 160
	PUBLIC	_example_putenv
_example_putenv	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 164
	mov	ax,OFFSET DGROUP:$S269_env_var
	push	ax
	call	_putenv
	mov	WORD PTR [bp-2],ax	;result
; Line 167
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_putenv	ENDP
; Line 169
	PUBLIC	_example_qsort
_example_qsort	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 170
	mov	ax,OFFSET _dummy_compare_func
	push	ax
	mov	ax,2
	push	ax
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:_sort_data
	push	ax
	call	_qsort
	add	sp,8
; Line 171
	ret	

_example_qsort	ENDP
; Line 173
	PUBLIC	_example__rotl
_example__rotl	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 175
	mov	ax,2
	push	ax
	mov	ax,4660
	push	ax
	call	__rotl
	mov	WORD PTR [bp-2],ax	;result
; Line 176
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example__rotl	ENDP
; Line 178
	PUBLIC	_example__rotr
_example__rotr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 180
	mov	ax,2
	push	ax
	mov	ax,4660
	push	ax
	call	__rotr
	mov	WORD PTR [bp-2],ax	;result
; Line 181
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example__rotr	ENDP
; Line 183
	PUBLIC	_example_rand
_example_rand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 185
	call	_rand
	mov	WORD PTR [bp-2],ax	;result
; Line 186
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_rand	ENDP
; Line 188
	PUBLIC	_example_realloc
_example_realloc	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 189
	mov	ax,50
	push	ax
	sub	ax,ax
	push	ax
	call	_realloc
	add	sp,4
; Line 190
	ret	
	nop	

_example_realloc	ENDP
; Line 192
	PUBLIC	_example__searchenv
_example__searchenv	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,80
	call	__chkstk
;	result_path = -80
; Line 195
	lea	ax,WORD PTR [bp-80]	;result_path
	push	ax
	mov	ax,OFFSET DGROUP:$SG286
	push	ax
	mov	ax,OFFSET DGROUP:$SG287
	push	ax
	call	__searchenv
; Line 196
	mov	sp,bp
	pop	bp
	ret	

_example__searchenv	ENDP
; Line 198
	PUBLIC	_example__splitpath
_example__splitpath	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,96
	call	__chkstk
;	full_path = -10
;	drive = -30
;	dir = -96
;	fname = -26
;	ext = -16
; Line 204
	lea	ax,WORD PTR [bp-16]	;ext
	push	ax
	lea	ax,WORD PTR [bp-26]	;fname
	push	ax
	lea	ax,WORD PTR [bp-96]	;dir
	push	ax
	lea	ax,WORD PTR [bp-30]	;drive
	push	ax
	lea	ax,WORD PTR [bp-10]	;full_path
	push	ax
	call	__splitpath
; Line 205
	mov	sp,bp
	pop	bp
	ret	

_example__splitpath	ENDP
; Line 207
	PUBLIC	_example_srand
_example_srand	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 208
	mov	ax,12345
	push	ax
	call	_srand
	add	sp,2
; Line 209
	ret	

_example_srand	ENDP
; Line 211
	PUBLIC	_example_strtod
_example_strtod	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
	push	di
	push	si
;	result = -8
;	endptr = -10
; Line 214
	lea	ax,WORD PTR [bp-10]	;endptr
	push	ax
	mov	ax,OFFSET DGROUP:$SG301
	push	ax
	call	_strtod
	add	sp,4
	lea	di,WORD PTR [bp-8]	;result
	mov	si,ax
	push	ss
	pop	es
	movsw
	movsw
	movsw
	movsw
; Line 215
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_example_strtod	ENDP
; Line 217
	PUBLIC	_example_strtol
_example_strtol	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	result = -4
;	endptr = -6
; Line 220
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-6]	;endptr
	push	ax
	mov	ax,OFFSET DGROUP:$SG306
	push	ax
	call	_strtol
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 221
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_strtol	ENDP
; Line 223
	PUBLIC	_example_strtoul
_example_strtoul	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	result = -4
;	endptr = -6
; Line 226
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-6]	;endptr
	push	ax
	mov	ax,OFFSET DGROUP:$SG311
	push	ax
	call	_strtoul
	mov	WORD PTR [bp-4],ax	;result
	mov	WORD PTR [bp-2],dx
; Line 227
	mov	sp,bp
	pop	bp
	ret	

_example_strtoul	ENDP
; Line 229
	PUBLIC	_example_swab
_example_swab	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	source = -16
;	dest = -8
; Line 232
	mov	ax,6
	push	ax
	lea	ax,WORD PTR [bp-8]	;dest
	push	ax
	lea	ax,WORD PTR [bp-16]	;source
	push	ax
	call	_swab
; Line 233
	mov	sp,bp
	pop	bp
	ret	

_example_swab	ENDP
; Line 235
	PUBLIC	_example_system
_example_system	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 238
	sub	ax,ax
	push	ax
	call	_system
	mov	WORD PTR [bp-2],ax	;result
; Line 241
	mov	sp,bp
	pop	bp
	ret	

_example_system	ENDP
; Line 243
	PUBLIC	_example_ultoa
_example_ultoa	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__chkstk
;	buffer = -38
;	result = -2
; Line 246
	mov	ax,8
	push	ax
	lea	ax,WORD PTR [bp-38]	;buffer
	push	ax
	mov	ax,26801
	mov	dx,15070
	push	dx
	push	ax
	call	_ultoa
	mov	WORD PTR [bp-2],ax	;result
; Line 247
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ultoa	ENDP
; Line 254
	PUBLIC	_example_tolower
_example_tolower	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 256
	mov	ax,88
	push	ax
	call	_tolower
	mov	WORD PTR [bp-2],ax	;result
; Line 257
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_tolower	ENDP
; Line 259
	PUBLIC	_example_toupper
_example_toupper	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	result = -2
; Line 261
	mov	ax,121
	push	ax
	call	_toupper
	mov	WORD PTR [bp-2],ax	;result
; Line 262
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_toupper	ENDP
; Line 265
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 266
	call	_example_abort
; Line 267
	call	_example_abs
; Line 268
	call	_example_atexit
; Line 269
	call	_example_atof
; Line 270
	call	_example_atoi
; Line 271
	call	_example_atol
; Line 272
	call	_example_bsearch
; Line 273
	call	_example_calloc
; Line 274
	call	_example_div
; Line 275
	call	_example_ecvt
; Line 276
	call	_example_exit
; Line 277
	call	_example__exit
; Line 278
	call	_example_fcvt
; Line 279
	call	_example_free
; Line 280
	call	_example_gcvt
; Line 281
	call	_example_getenv
; Line 282
	call	_example_itoa
; Line 283
	call	_example_labs
; Line 284
	call	_example_ldiv
; Line 285
	call	_example__lrotl
; Line 286
	call	_example__lrotr
; Line 287
	call	_example_ltoa
; Line 288
	call	_example__makepath
; Line 289
	call	_example_malloc
; Line 290
	call	_example_onexit
; Line 291
	call	_example_perror
; Line 292
	call	_example_putenv
; Line 293
	call	_example_qsort
; Line 294
	call	_example__rotl
; Line 295
	call	_example__rotr
; Line 296
	call	_example_rand
; Line 297
	call	_example_realloc
; Line 298
	call	_example__searchenv
; Line 299
	call	_example__splitpath
; Line 300
	call	_example_srand
; Line 301
	call	_example_strtod
; Line 302
	call	_example_strtol
; Line 303
	call	_example_strtoul
; Line 304
	call	_example_swab
; Line 305
	call	_example_system
; Line 306
	call	_example_ultoa
; Line 307
	call	_example_tolower
; Line 308
	call	_example_toupper
; Line 315
	sub	ax,ax
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
