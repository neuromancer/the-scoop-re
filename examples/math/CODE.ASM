;	Static Name Aliases
;
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
EXTRN	_frexp:NEAR
EXTRN	_hypot:NEAR
EXTRN	_j0:NEAR
EXTRN	_j1:NEAR
EXTRN	_jn:NEAR
EXTRN	_labs:NEAR
EXTRN	_ldexp:NEAR
EXTRN	_log:NEAR
EXTRN	_log10:NEAR
EXTRN	_matherr:NEAR
EXTRN	_modf:NEAR
EXTRN	_pow:NEAR
EXTRN	_sin:NEAR
EXTRN	_sinh:NEAR
EXTRN	_sqrt:NEAR
EXTRN	_tan:NEAR
EXTRN	_tanh:NEAR
EXTRN	_y0:NEAR
EXTRN	_y1:NEAR
EXTRN	_yn:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_abs:NEAR
EXTRN	_acos:NEAR
EXTRN	_asin:NEAR
EXTRN	_atan:NEAR
EXTRN	_atan2:NEAR
EXTRN	_atof:NEAR
EXTRN	_cabs:NEAR
EXTRN	_ceil:NEAR
EXTRN	_cos:NEAR
EXTRN	_cosh:NEAR
EXTRN	_dieeetomsbin:NEAR
EXTRN	_dmsbintoieee:NEAR
EXTRN	_exp:NEAR
EXTRN	_fabs:NEAR
EXTRN	_fieeetomsbin:NEAR
EXTRN	_floor:NEAR
EXTRN	_fmod:NEAR
EXTRN	_fmsbintoieee:NEAR
EXTRN	__fltused:NEAR
CONST      SEGMENT
	ORG	$+16
$SG312	DB	'3.14159',  00H
	ORG	$+76
$SG366	DB	'example_func',  00H
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 47
	PUBLIC	_example_abs
_example_abs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	i = -2
; Line 48
	mov	WORD PTR [bp-2],-10	;i
; Line 49
	mov	ax,-10
	push	ax
	call	_abs
; Line 50
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_abs	ENDP
; Line 52
_TEXT      ENDS
CONST      SEGMENT
	ORG	$-113
$T20001	DQ	03fe0000000000000H    ;	.5000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_acos
_example_acos	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 53
	fld	QWORD PTR $T20001
	fst	QWORD PTR [bp-8]	;d
; Line 54
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_acos
; Line 55
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_acos	ENDP
; Line 57
	PUBLIC	_example_asin
_example_asin	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 58
	fld	QWORD PTR $T20001
	fst	QWORD PTR [bp-8]	;d
; Line 59
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_asin
; Line 60
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_asin	ENDP
; Line 62
_TEXT      ENDS
CONST      SEGMENT
$T20002	DQ	03ff0000000000000H    ;	1.000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_atan
_example_atan	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 63
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 64
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_atan
; Line 65
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_atan	ENDP
; Line 67
	PUBLIC	_example_atan2
_example_atan2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	y = -16
;	x = -8
; Line 68
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-16]	;y
; Line 69
	fst	QWORD PTR [bp-8]	;x
; Line 70
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fld	QWORD PTR $T20002
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_atan2
; Line 71
	mov	sp,bp
	pop	bp
	ret	

_example_atan2	ENDP
; Line 73
	PUBLIC	_example_atof
_example_atof	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	s = -2
; Line 74
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG312	;s
; Line 75
	mov	ax,OFFSET DGROUP:$SG312
	push	ax
	call	_atof
; Line 76
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_atof	ENDP
; Line 78
_TEXT      ENDS
CONST      SEGMENT
	ORG	$+8
$T20003	DQ	04008000000000000H    ;	3.000000000000000
$T20004	DQ	04010000000000000H    ;	4.000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_cabs
_example_cabs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
	push	di
	push	si
;	c = -16
; Line 80
	fld	QWORD PTR $T20003
	fstp	QWORD PTR [bp-16]	;c
; Line 81
	fld	QWORD PTR $T20004
	fstp	QWORD PTR [bp-8]
	fwait	
; Line 82
	sub	sp,16
	lea	si,WORD PTR [bp-16]	;c
	mov	di,sp
	push	ss
	pop	es
	mov	cx,8
	rep	movsw
	call	_cabs
	add	sp,16
; Line 83
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_example_cabs	ENDP
; Line 85
_TEXT      ENDS
CONST      SEGMENT
$T20005	DQ	04005be76c8b43958H    ;	2.718000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_ceil
_example_ceil	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 86
	fld	QWORD PTR $T20005
	fst	QWORD PTR [bp-8]	;d
; Line 87
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_ceil
; Line 88
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ceil	ENDP
; Line 90
	PUBLIC	_example_cos
_example_cos	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 91
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 92
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_cos
; Line 93
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_cos	ENDP
; Line 95
	PUBLIC	_example_cosh
_example_cosh	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 96
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 97
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_cosh
; Line 98
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_cosh	ENDP
; Line 100
	PUBLIC	_example_dieeetomsbin
_example_dieeetomsbin	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	ieee_val = -8
;	msbin_val = -16
; Line 101
	fld	QWORD PTR $T20002
	fstp	QWORD PTR [bp-8]	;ieee_val
	fwait	
; Line 103
	lea	ax,WORD PTR [bp-16]	;msbin_val
	push	ax
	lea	ax,WORD PTR [bp-8]	;ieee_val
	push	ax
	call	_dieeetomsbin
; Line 104
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dieeetomsbin	ENDP
; Line 106
	PUBLIC	_example_dmsbintoieee
_example_dmsbintoieee	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	msbin_val = -16
;	ieee_val = -8
; Line 107
	fld	QWORD PTR $T20002
	fstp	QWORD PTR [bp-16]	;msbin_val
	fwait	
; Line 109
	lea	ax,WORD PTR [bp-8]	;ieee_val
	push	ax
	lea	ax,WORD PTR [bp-16]	;msbin_val
	push	ax
	call	_dmsbintoieee
; Line 110
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dmsbintoieee	ENDP
; Line 112
	PUBLIC	_example_exp
_example_exp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 113
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 114
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_exp
; Line 115
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_exp	ENDP
; Line 117
_TEXT      ENDS
CONST      SEGMENT
$T20006	DQ	0c0091eb851eb851fH    ;	-3.140000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_fabs
_example_fabs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 118
	fld	QWORD PTR $T20006
	fst	QWORD PTR [bp-8]	;d
; Line 119
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_fabs
; Line 120
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fabs	ENDP
; Line 122
_TEXT      ENDS
CONST      SEGMENT
$T20007	DD	03f800000H   ;	1.0000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_fieeetomsbin
_example_fieeetomsbin	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	ieee_val = -4
;	msbin_val = -8
; Line 123
	fld	DWORD PTR $T20007
	fstp	DWORD PTR [bp-4]	;ieee_val
	fwait	
; Line 125
	lea	ax,WORD PTR [bp-8]	;msbin_val
	push	ax
	lea	ax,WORD PTR [bp-4]	;ieee_val
	push	ax
	call	_fieeetomsbin
; Line 126
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fieeetomsbin	ENDP
; Line 128
	PUBLIC	_example_floor
_example_floor	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 129
	fld	QWORD PTR $T20005
	fst	QWORD PTR [bp-8]	;d
; Line 130
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_floor
; Line 131
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_floor	ENDP
; Line 133
_TEXT      ENDS
CONST      SEGMENT
$T20008	DQ	04015333333333333H    ;	5.300000000000000
$T20009	DQ	04000cccccccccccdH    ;	2.100000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_fmod
_example_fmod	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	x = -8
;	y = -16
; Line 134
	fld	QWORD PTR $T20008
	fstp	QWORD PTR [bp-8]	;x
; Line 135
	fld	QWORD PTR $T20009
	fst	QWORD PTR [bp-16]	;y
; Line 136
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fld	QWORD PTR $T20008
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_fmod
; Line 137
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fmod	ENDP
; Line 139
	PUBLIC	_example_fmsbintoieee
_example_fmsbintoieee	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	msbin_val = -8
;	ieee_val = -4
; Line 140
	fld	DWORD PTR $T20007
	fstp	DWORD PTR [bp-8]	;msbin_val
	fwait	
; Line 142
	lea	ax,WORD PTR [bp-4]	;ieee_val
	push	ax
	lea	ax,WORD PTR [bp-8]	;msbin_val
	push	ax
	call	_fmsbintoieee
; Line 143
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_fmsbintoieee	ENDP
; Line 145
_TEXT      ENDS
CONST      SEGMENT
$T20010	DQ	04030000000000000H    ;	16.00000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_frexp
_example_frexp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	d = -10
;	exp_val = -2
; Line 146
	fld	QWORD PTR $T20010
	fstp	QWORD PTR [bp-10]	;d
	fwait	
; Line 148
	lea	ax,WORD PTR [bp-2]	;exp_val
	push	ax
	fld	QWORD PTR $T20010
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_frexp
; Line 149
	mov	sp,bp
	pop	bp
	ret	

_example_frexp	ENDP
; Line 151
	PUBLIC	_example_hypot
_example_hypot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	x = -8
;	y = -16
; Line 152
	fld	QWORD PTR $T20003
	fstp	QWORD PTR [bp-8]	;x
; Line 153
	fld	QWORD PTR $T20004
	fst	QWORD PTR [bp-16]	;y
; Line 154
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fld	QWORD PTR $T20003
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_hypot
; Line 155
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_hypot	ENDP
; Line 157
	PUBLIC	_example_j0
_example_j0	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 158
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 159
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_j0
; Line 160
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_j0	ENDP
; Line 162
	PUBLIC	_example_j1
_example_j1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 163
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 164
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_j1
; Line 165
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_j1	ENDP
; Line 167
	PUBLIC	_example_jn
_example_jn	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	n = -10
;	d = -8
; Line 168
	mov	WORD PTR [bp-10],2	;n
; Line 169
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 170
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	mov	ax,2
	push	ax
	call	_jn
; Line 171
	mov	sp,bp
	pop	bp
	ret	

_example_jn	ENDP
; Line 173
	PUBLIC	_example_labs
_example_labs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	l = -4
; Line 174
	mov	WORD PTR [bp-4],7616	;l
	mov	WORD PTR [bp-2],-2
; Line 175
	mov	ax,7616
	mov	dx,-2
	push	dx
	push	ax
	call	_labs
; Line 176
	mov	sp,bp
	pop	bp
	ret	

_example_labs	ENDP
; Line 178
	PUBLIC	_example_ldexp
_example_ldexp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	d = -10
;	exp_val = -2
; Line 179
	fld	QWORD PTR $T20001
	fstp	QWORD PTR [bp-10]	;d
	fwait	
; Line 180
	mov	WORD PTR [bp-2],3	;exp_val
; Line 181
	mov	ax,3
	push	ax
	fld	QWORD PTR $T20001
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_ldexp
; Line 182
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ldexp	ENDP
; Line 184
_TEXT      ENDS
CONST      SEGMENT
$T20011	DQ	04024000000000000H    ;	10.00000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_log
_example_log	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 185
	fld	QWORD PTR $T20011
	fst	QWORD PTR [bp-8]	;d
; Line 186
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_log
; Line 187
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_log	ENDP
; Line 189
_TEXT      ENDS
CONST      SEGMENT
$T20012	DQ	04059000000000000H    ;	100.0000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_log10
_example_log10	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 190
	fld	QWORD PTR $T20012
	fst	QWORD PTR [bp-8]	;d
; Line 191
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_log10
; Line 192
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_log10	ENDP
; Line 194
_TEXT      ENDS
CONST      SEGMENT
	ORG	$+14
$T20013	DQ	0bff0000000000000H    ;	-1.000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_matherr
_example_matherr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__chkstk
;	ex = -28
; Line 196
	mov	WORD PTR [bp-28],1	;ex
; Line 197
	mov	WORD PTR [bp-26],OFFSET DGROUP:$SG366
; Line 198
	fld	QWORD PTR $T20013
	fstp	QWORD PTR [bp-24]
; Line 199
	fldz	
	fst	QWORD PTR [bp-16]
; Line 200
	fstp	QWORD PTR [bp-8]
	fwait	
; Line 201
	lea	ax,WORD PTR [bp-28]	;ex
	push	ax
	call	_matherr
; Line 202
	mov	sp,bp
	pop	bp
	ret	

_example_matherr	ENDP
; Line 204
_TEXT      ENDS
CONST      SEGMENT
$T20014	DQ	0400921f9f01b866eH    ;	3.141590000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_modf
_example_modf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	d = -16
;	intpart = -8
; Line 205
	fld	QWORD PTR $T20014
	fstp	QWORD PTR [bp-16]	;d
	fwait	
; Line 207
	lea	ax,WORD PTR [bp-8]	;intpart
	push	ax
	fld	QWORD PTR $T20014
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_modf
; Line 208
	mov	sp,bp
	pop	bp
	ret	

_example_modf	ENDP
; Line 210
_TEXT      ENDS
CONST      SEGMENT
$T20015	DQ	04000000000000000H    ;	2.000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_pow
_example_pow	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	base = -16
;	exponent = -8
; Line 211
	fld	QWORD PTR $T20015
	fstp	QWORD PTR [bp-16]	;base
; Line 212
	fld	QWORD PTR $T20003
	fst	QWORD PTR [bp-8]	;exponent
; Line 213
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fld	QWORD PTR $T20015
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_pow
; Line 214
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_pow	ENDP
; Line 216
_TEXT      ENDS
CONST      SEGMENT
$T20016	DQ	03ff91eb851eb851fH    ;	1.570000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_sin
_example_sin	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 217
	fld	QWORD PTR $T20016
	fst	QWORD PTR [bp-8]	;d
; Line 218
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_sin
; Line 219
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_sin	ENDP
; Line 221
	PUBLIC	_example_sinh
_example_sinh	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 222
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 223
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_sinh
; Line 224
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_sinh	ENDP
; Line 226
_TEXT      ENDS
CONST      SEGMENT
$T20017	DQ	04022000000000000H    ;	9.000000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_sqrt
_example_sqrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 227
	fld	QWORD PTR $T20017
	fst	QWORD PTR [bp-8]	;d
; Line 228
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_sqrt
; Line 229
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_sqrt	ENDP
; Line 231
_TEXT      ENDS
CONST      SEGMENT
$T20018	DQ	03fe91eb851eb851fH    ;	.7850000000000000
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_example_tan
_example_tan	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 232
	fld	QWORD PTR $T20018
	fst	QWORD PTR [bp-8]	;d
; Line 233
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_tan
; Line 234
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_tan	ENDP
; Line 236
	PUBLIC	_example_tanh
_example_tanh	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 237
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 238
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_tanh
; Line 239
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_tanh	ENDP
; Line 241
	PUBLIC	_example_y0
_example_y0	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 242
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 243
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_y0
; Line 244
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_y0	ENDP
; Line 246
	PUBLIC	_example_y1
_example_y1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	d = -8
; Line 247
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 248
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	call	_y1
; Line 249
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_y1	ENDP
; Line 251
	PUBLIC	_example_yn
_example_yn	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	n = -10
;	d = -8
; Line 252
	mov	WORD PTR [bp-10],2	;n
; Line 253
	fld	QWORD PTR $T20002
	fst	QWORD PTR [bp-8]	;d
; Line 254
	sub	sp,8
	mov	bx,sp
	fstp	QWORD PTR [bx]
	fwait	
	mov	ax,2
	push	ax
	call	_yn
; Line 255
	mov	sp,bp
	pop	bp
	ret	

_example_yn	ENDP
; Line 258
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 259
	call	_example_abs
; Line 260
	call	_example_acos
; Line 261
	call	_example_asin
; Line 262
	call	_example_atan
; Line 263
	call	_example_atan2
; Line 264
	call	_example_atof
; Line 265
	call	_example_cabs
; Line 266
	call	_example_ceil
; Line 267
	call	_example_cos
; Line 268
	call	_example_cosh
; Line 269
	call	_example_dieeetomsbin
; Line 270
	call	_example_dmsbintoieee
; Line 271
	call	_example_exp
; Line 272
	call	_example_fabs
; Line 273
	call	_example_fieeetomsbin
; Line 274
	call	_example_floor
; Line 275
	call	_example_fmod
; Line 276
	call	_example_fmsbintoieee
; Line 277
	call	_example_frexp
; Line 278
	call	_example_hypot
; Line 279
	call	_example_j0
; Line 280
	call	_example_j1
; Line 281
	call	_example_jn
; Line 282
	call	_example_labs
; Line 283
	call	_example_ldexp
; Line 284
	call	_example_log
; Line 285
	call	_example_log10
; Line 286
	call	_example_matherr
; Line 287
	call	_example_modf
; Line 288
	call	_example_pow
; Line 289
	call	_example_sin
; Line 290
	call	_example_sinh
; Line 291
	call	_example_sqrt
; Line 292
	call	_example_tan
; Line 293
	call	_example_tanh
; Line 294
	call	_example_y0
; Line 295
	call	_example_y1
; Line 296
	call	_example_yn
; Line 298
	sub	ax,ax
	ret	

_main	ENDP
_TEXT	ENDS
END
