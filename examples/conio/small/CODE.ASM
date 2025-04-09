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
EXTRN	__chkstk:NEAR
EXTRN	_cgets:NEAR
EXTRN	_cprintf:NEAR
EXTRN	_cputs:NEAR
EXTRN	_cscanf:NEAR
EXTRN	_getch:NEAR
EXTRN	_getche:NEAR
EXTRN	_inp:NEAR
EXTRN	_inpw:NEAR
EXTRN	_kbhit:NEAR
EXTRN	_outp:NEAR
EXTRN	_outpw:NEAR
EXTRN	_putch:NEAR
EXTRN	_ungetch:NEAR
EXTRN	__fltused:NEAR
CONST      SEGMENT
$SG119	DB	'This is a cprintf example with value: %d',  0dH,  0aH,  00H
	ORG	$+1
$SG127	DB	'%d %f',  00H
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 4
	PUBLIC	_example_cgets
_example_cgets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,82
	call	__chkstk
;	buffer = -82
; Line 6
	mov	BYTE PTR [bp-82],80	;buffer
; Line 7
	lea	ax,WORD PTR [bp-82]	;buffer
	push	ax
	call	_cgets
; Line 8
	mov	sp,bp
	pop	bp
	ret	

_example_cgets	ENDP
; Line 11
	PUBLIC	_example_cprintf
_example_cprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	value = -2
; Line 12
	mov	WORD PTR [bp-2],42	;value
; Line 13
	mov	ax,42
	push	ax
	mov	ax,OFFSET DGROUP:$SG119
	push	ax
	call	_cprintf
; Line 14
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_cprintf	ENDP
; Line 17
	PUBLIC	_example_cputs
_example_cputs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	str = -2
; Line 19
	push	WORD PTR [bp-2]	;str
	call	_cputs
; Line 20
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_cputs	ENDP
; Line 23
	PUBLIC	_example_cscanf
_example_cscanf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	i = -6
;	f = -4
; Line 27
	lea	ax,WORD PTR [bp-4]	;f
	push	ax
	lea	ax,WORD PTR [bp-6]	;i
	push	ax
	mov	ax,OFFSET DGROUP:$SG127
	push	ax
	call	_cscanf
; Line 28
	mov	sp,bp
	pop	bp
	ret	

_example_cscanf	ENDP
; Line 31
	PUBLIC	_example_getch
_example_getch	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 32
	call	_getch
; Line 33
	ret	
	nop	

_example_getch	ENDP
; Line 36
	PUBLIC	_example_getche
_example_getche	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 37
	call	_getche
; Line 38
	ret	
	nop	

_example_getche	ENDP
; Line 41
	PUBLIC	_example_inp
_example_inp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	port = -2
; Line 42
	mov	WORD PTR [bp-2],888	;port
; Line 43
	mov	ax,888
	push	ax
	call	_inp
; Line 44
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_inp	ENDP
; Line 47
	PUBLIC	_example_inpw
_example_inpw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	port = -2
; Line 48
	mov	WORD PTR [bp-2],888	;port
; Line 49
	mov	ax,888
	push	ax
	call	_inpw
; Line 50
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_inpw	ENDP
; Line 53
	PUBLIC	_example_kbhit
_example_kbhit	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 54
	call	_kbhit
; Line 55
	ret	
	nop	

_example_kbhit	ENDP
; Line 58
	PUBLIC	_example_outp
_example_outp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	port = -2
;	value = -4
; Line 59
	mov	WORD PTR [bp-2],888	;port
; Line 60
	mov	WORD PTR [bp-4],170	;value
; Line 61
	mov	ax,170
	push	ax
	mov	ax,888
	push	ax
	call	_outp
; Line 62
	mov	sp,bp
	pop	bp
	ret	

_example_outp	ENDP
; Line 65
	PUBLIC	_example_outpw
_example_outpw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	port = -2
;	value = -4
; Line 66
	mov	WORD PTR [bp-2],888	;port
; Line 67
	mov	WORD PTR [bp-4],-21846	;value
; Line 68
	mov	ax,-21846
	push	ax
	mov	ax,888
	push	ax
	call	_outpw
; Line 69
	mov	sp,bp
	pop	bp
	ret	

_example_outpw	ENDP
; Line 72
	PUBLIC	_example_putch
_example_putch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	character = -2
; Line 73
	mov	WORD PTR [bp-2],88	;character
; Line 74
	mov	ax,88
	push	ax
	call	_putch
; Line 75
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_putch	ENDP
; Line 78
	PUBLIC	_example_ungetch
_example_ungetch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	character = -2
; Line 79
	mov	WORD PTR [bp-2],89	;character
; Line 80
	mov	ax,89
	push	ax
	call	_ungetch
; Line 81
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_ungetch	ENDP
; Line 84
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 85
	call	_example_cgets
; Line 86
	call	_example_cprintf
; Line 87
	call	_example_cputs
; Line 88
	call	_example_cscanf
; Line 89
	call	_example_getch
; Line 90
	call	_example_getche
; Line 91
	call	_example_inp
; Line 92
	call	_example_inpw
; Line 93
	call	_example_kbhit
; Line 94
	call	_example_outp
; Line 95
	call	_example_outpw
; Line 96
	call	_example_putch
; Line 97
	call	_example_ungetch
; Line 99
	sub	ax,ax
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
