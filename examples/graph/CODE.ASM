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
EXTRN	__moveto:FAR
EXTRN	__getcurrentposition:FAR
EXTRN	__lineto:FAR
EXTRN	__rectangle:FAR
EXTRN	__ellipse:FAR
EXTRN	__arc:FAR
EXTRN	__pie:FAR
EXTRN	__setpixel:FAR
EXTRN	__getpixel:FAR
EXTRN	__floodfill:FAR
EXTRN	__setcolor:FAR
EXTRN	__getcolor:FAR
EXTRN	__setlinestyle:FAR
EXTRN	__getlinestyle:FAR
EXTRN	__setfillmask:FAR
EXTRN	__getfillmask:FAR
EXTRN	__setbkcolor:FAR
EXTRN	__getbkcolor:FAR
EXTRN	__remappalette:FAR
EXTRN	__remapallpalette:FAR
EXTRN	__selectpalette:FAR
EXTRN	__settextwindow:FAR
EXTRN	__outtext:FAR
EXTRN	__wrapon:FAR
EXTRN	__displaycursor:FAR
EXTRN	__settextposition:FAR
EXTRN	__gettextposition:FAR
EXTRN	__settextcolor:FAR
EXTRN	__gettextcolor:FAR
EXTRN	__getimage:FAR
EXTRN	__putimage:FAR
EXTRN	__imagesize:FAR
EXTRN	__chkstk:NEAR
EXTRN	__setvideomode:FAR
EXTRN	__setactivepage:FAR
EXTRN	__setvisualpage:FAR
EXTRN	__getvideoconfig:FAR
EXTRN	__setlogorg:FAR
EXTRN	__getlogcoord:FAR
EXTRN	__getphyscoord:FAR
EXTRN	__setcliprgn:FAR
EXTRN	__setviewport:FAR
EXTRN	__clearscreen:FAR
CONST      SEGMENT
$SG243	DB	'Hello Graphics World!',  00H
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 52
	PUBLIC	_example_setvideomode
_example_setvideomode	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 53
	mov	ax,13
	push	ax
	call	FAR PTR __setvideomode
	add	sp,2
; Line 54
	ret	

_example_setvideomode	ENDP
; Line 56
	PUBLIC	_example_setactivepage
_example_setactivepage	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 57
	sub	ax,ax
	push	ax
	call	FAR PTR __setactivepage
	add	sp,2
; Line 58
	ret	
	nop	

_example_setactivepage	ENDP
; Line 60
	PUBLIC	_example_setvisualpage
_example_setvisualpage	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 61
	sub	ax,ax
	push	ax
	call	FAR PTR __setvisualpage
	add	sp,2
; Line 62
	ret	
	nop	

_example_setvisualpage	ENDP
; Line 64
	PUBLIC	_example_getvideoconfig
_example_getvideoconfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__chkstk
;	vc = -22
; Line 66
	lea	ax,WORD PTR [bp-22]	;vc
	push	ss
	push	ax
	call	FAR PTR __getvideoconfig
; Line 67
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_getvideoconfig	ENDP
; Line 69
	PUBLIC	_example_setlogorg
_example_setlogorg	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 70
	mov	ax,50
	push	ax
	mov	ax,100
	push	ax
	call	FAR PTR __setlogorg
	add	sp,4
; Line 71
	ret	

_example_setlogorg	ENDP
; Line 73
	PUBLIC	_example_getlogcoord
_example_getlogcoord	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 74
	mov	ax,150
	push	ax
	mov	ax,200
	push	ax
	call	FAR PTR __getlogcoord
	add	sp,4
; Line 75
	ret	

_example_getlogcoord	ENDP
; Line 77
	PUBLIC	_example_getphyscoord
_example_getphyscoord	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 78
	mov	ax,25
	push	ax
	mov	ax,50
	push	ax
	call	FAR PTR __getphyscoord
	add	sp,4
; Line 79
	ret	

_example_getphyscoord	ENDP
; Line 81
	PUBLIC	_example_setcliprgn
_example_setcliprgn	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 82
	mov	ax,190
	push	ax
	mov	ax,310
	push	ax
	mov	ax,10
	push	ax
	push	ax
	call	FAR PTR __setcliprgn
	add	sp,8
; Line 83
	ret	
	nop	

_example_setcliprgn	ENDP
; Line 85
	PUBLIC	_example_setviewport
_example_setviewport	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 86
	mov	ax,180
	push	ax
	mov	ax,300
	push	ax
	mov	ax,20
	push	ax
	push	ax
	call	FAR PTR __setviewport
	add	sp,8
; Line 87
	ret	
	nop	

_example_setviewport	ENDP
; Line 89
	PUBLIC	_example_clearscreen
_example_clearscreen	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 90
	sub	ax,ax
	push	ax
	call	FAR PTR __clearscreen
	add	sp,2
; Line 91
	ret	
	nop	

_example_clearscreen	ENDP
; Line 93
	PUBLIC	_example_moveto
_example_moveto	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 94
	mov	ax,100
	push	ax
	mov	ax,160
	push	ax
	call	FAR PTR __moveto
	add	sp,4
; Line 95
	ret	

_example_moveto	ENDP
; Line 97
	PUBLIC	_example_getcurrentposition
_example_getcurrentposition	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 98
	call	FAR PTR __getcurrentposition
; Line 99
	ret	
	nop	

_example_getcurrentposition	ENDP
; Line 101
	PUBLIC	_example_lineto
_example_lineto	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 102
	mov	ax,150
	push	ax
	mov	ax,200
	push	ax
	call	FAR PTR __lineto
	add	sp,4
; Line 103
	ret	

_example_lineto	ENDP
; Line 105
	PUBLIC	_example_rectangle
_example_rectangle	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 106
	mov	ax,150
	push	ax
	push	ax
	mov	ax,50
	push	ax
	push	ax
	mov	ax,2
	push	ax
	call	FAR PTR __rectangle
	add	sp,10
; Line 107
	ret	

_example_rectangle	ENDP
; Line 109
	PUBLIC	_example_ellipse
_example_ellipse	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 110
	mov	ax,150
	push	ax
	mov	ax,200
	push	ax
	mov	ax,100
	push	ax
	push	ax
	mov	ax,3
	push	ax
	call	FAR PTR __ellipse
	add	sp,10
; Line 111
	ret	
	nop	

_example_ellipse	ENDP
; Line 113
	PUBLIC	_example_arc
_example_arc	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 114
	mov	ax,150
	push	ax
	mov	ax,100
	push	ax
	mov	ax,50
	push	ax
	mov	ax,200
	push	ax
	mov	ax,150
	push	ax
	mov	ax,260
	push	ax
	mov	ax,100
	push	ax
	mov	ax,160
	push	ax
	call	FAR PTR __arc
	add	sp,16
; Line 115
	ret	

_example_arc	ENDP
; Line 117
	PUBLIC	_example_pie
_example_pie	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 118
	mov	ax,150
	push	ax
	mov	ax,100
	push	ax
	mov	ax,50
	push	ax
	mov	ax,200
	push	ax
	mov	ax,150
	push	ax
	mov	ax,260
	push	ax
	mov	ax,100
	push	ax
	mov	ax,160
	push	ax
	mov	ax,2
	push	ax
	call	FAR PTR __pie
	add	sp,18
; Line 119
	ret	

_example_pie	ENDP
; Line 121
	PUBLIC	_example_setpixel
_example_setpixel	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 122
	mov	ax,10
	push	ax
	push	ax
	call	FAR PTR __setpixel
	add	sp,4
; Line 123
	ret	
	nop	

_example_setpixel	ENDP
; Line 125
	PUBLIC	_example_getpixel
_example_getpixel	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 126
	mov	ax,20
	push	ax
	push	ax
	call	FAR PTR __getpixel
	add	sp,4
; Line 127
	ret	
	nop	

_example_getpixel	ENDP
; Line 129
	PUBLIC	_example_floodfill
_example_floodfill	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 130
	mov	ax,1
	push	ax
	mov	ax,100
	push	ax
	push	ax
	call	FAR PTR __floodfill
	add	sp,6
; Line 131
	ret	
	nop	

_example_floodfill	ENDP
; Line 133
	PUBLIC	_example_setcolor
_example_setcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 134
	mov	ax,4
	push	ax
	call	FAR PTR __setcolor
	add	sp,2
; Line 135
	ret	

_example_setcolor	ENDP
; Line 137
	PUBLIC	_example_getcolor
_example_getcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 138
	call	FAR PTR __getcolor
; Line 139
	ret	
	nop	

_example_getcolor	ENDP
; Line 141
	PUBLIC	_example_setlinestyle
_example_setlinestyle	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 142
	mov	ax,-21846
	push	ax
	call	FAR PTR __setlinestyle
	add	sp,2
; Line 143
	ret	

_example_setlinestyle	ENDP
; Line 145
	PUBLIC	_example_getlinestyle
_example_getlinestyle	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 146
	call	FAR PTR __getlinestyle
; Line 147
	ret	
	nop	

_example_getlinestyle	ENDP
; Line 149
	PUBLIC	_example_setfillmask
_example_setfillmask	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	fill_pattern = -8
; Line 151
	lea	ax,WORD PTR [bp-8]	;fill_pattern
	push	ss
	push	ax
	call	FAR PTR __setfillmask
; Line 152
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_setfillmask	ENDP
; Line 154
	PUBLIC	_example_getfillmask
_example_getfillmask	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	mask_buffer = -8
; Line 156
	lea	ax,WORD PTR [bp-8]	;mask_buffer
	push	ss
	push	ax
	call	FAR PTR __getfillmask
; Line 157
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_getfillmask	ENDP
; Line 159
	PUBLIC	_example_setbkcolor
_example_setbkcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 160
	sub	ax,ax
	mov	dx,42
	push	dx
	push	ax
	call	FAR PTR __setbkcolor
	add	sp,4
; Line 161
	ret	
	nop	

_example_setbkcolor	ENDP
; Line 163
	PUBLIC	_example_getbkcolor
_example_getbkcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 164
	call	FAR PTR __getbkcolor
; Line 165
	ret	
	nop	

_example_getbkcolor	ENDP
; Line 167
	PUBLIC	_example_remappalette
_example_remappalette	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 168
	mov	ax,42
	cwd	
	push	dx
	push	ax
	sub	ax,ax
	push	ax
	call	FAR PTR __remappalette
	add	sp,6
; Line 169
	ret	
	nop	

_example_remappalette	ENDP
; Line 171
	PUBLIC	_example_remapallpalette
_example_remapallpalette	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__chkstk
	push	si
;	palette_array = -64
;	i = -66
; Line 174
	mov	WORD PTR [bp-66],0	;i
$FC238:
; Line 175
	mov	si,WORD PTR [bp-66]	;i
	shl	si,1
	shl	si,1
	sub	ax,ax
	mov	[bp-62][si],ax
	mov	[bp-64][si],ax
; Line 176
	inc	WORD PTR [bp-66]	;i
	cmp	WORD PTR [bp-66],16	;i
	jl	$FC238
; Line 177
	mov	WORD PTR [bp-60],5397
	mov	WORD PTR [bp-58],63
; Line 178
	mov	WORD PTR [bp-56],16149
	mov	WORD PTR [bp-54],21
; Line 179
	lea	ax,WORD PTR [bp-64]	;palette_array
	push	ss
	push	ax
	call	FAR PTR __remapallpalette
	add	sp,4
; Line 180
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_remapallpalette	ENDP
; Line 182
	PUBLIC	_example_selectpalette
_example_selectpalette	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 183
	sub	ax,ax
	push	ax
	call	FAR PTR __selectpalette
	add	sp,2
; Line 184
	ret	
	nop	

_example_selectpalette	ENDP
; Line 186
	PUBLIC	_example_settextwindow
_example_settextwindow	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 187
	mov	ax,79
	push	ax
	mov	ax,24
	push	ax
	mov	ax,2
	push	ax
	push	ax
	call	FAR PTR __settextwindow
	add	sp,8
; Line 188
	ret	
	nop	

_example_settextwindow	ENDP
; Line 190
	PUBLIC	_example_outtext
_example_outtext	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 191
	mov	ax,OFFSET DGROUP:$SG243
	push	ds
	push	ax
	call	FAR PTR __outtext
	add	sp,4
; Line 192
	ret	
	nop	

_example_outtext	ENDP
; Line 194
	PUBLIC	_example_wrapon
_example_wrapon	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 195
	mov	ax,1
	push	ax
	call	FAR PTR __wrapon
	add	sp,2
; Line 196
	ret	

_example_wrapon	ENDP
; Line 198
	PUBLIC	_example_displaycursor
_example_displaycursor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 199
	mov	ax,1
	push	ax
	call	FAR PTR __displaycursor
	add	sp,2
; Line 200
	ret	

_example_displaycursor	ENDP
; Line 202
	PUBLIC	_example_settextposition
_example_settextposition	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 203
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	FAR PTR __settextposition
	add	sp,4
; Line 204
	ret	

_example_settextposition	ENDP
; Line 206
	PUBLIC	_example_gettextposition
_example_gettextposition	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 207
	call	FAR PTR __gettextposition
; Line 208
	ret	
	nop	

_example_gettextposition	ENDP
; Line 210
	PUBLIC	_example_settextcolor
_example_settextcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 211
	mov	ax,14
	push	ax
	call	FAR PTR __settextcolor
	add	sp,2
; Line 212
	ret	

_example_settextcolor	ENDP
; Line 214
	PUBLIC	_example_gettextcolor
_example_gettextcolor	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 215
	call	FAR PTR __gettextcolor
; Line 216
	ret	
	nop	

_example_gettextcolor	ENDP
; Line 218
	PUBLIC	_example_getimage
_example_getimage	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	buffer_size = -4
;	image_buffer = -6
; Line 221
	mov	ax,100
	push	ax
	push	ax
	mov	ax,10
	push	ax
	push	ax
	call	FAR PTR __imagesize
	add	sp,8
	mov	WORD PTR [bp-4],ax	;buffer_size
	mov	WORD PTR [bp-2],dx
; Line 224
	mov	WORD PTR [bp-6],4660	;image_buffer
; Line 225
	or	dx,dx
	jl	$I253
	jg	$L20001
	or	ax,ax
	je	$I253
$L20001:
	cmp	WORD PTR [bp-2],0
	jg	$I253
	jl	$L20002
	cmp	WORD PTR [bp-4],-1	;buffer_size
	jae	$I253
$L20002:
; Line 228
	mov	ax,4660
	push	ds
	push	ax
	mov	ax,100
	push	ax
	push	ax
	mov	ax,10
	push	ax
	push	ax
	call	FAR PTR __getimage
	add	sp,12
; Line 229
; Line 230
$I253:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_getimage	ENDP
; Line 232
	PUBLIC	_example_putimage
_example_putimage	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	image_buffer = -2
; Line 234
	mov	WORD PTR [bp-2],22136	;image_buffer
; Line 235
	mov	ax,3
	push	ax
	mov	ax,22136
	push	ds
	push	ax
	mov	ax,50
	push	ax
	mov	ax,150
	push	ax
	call	FAR PTR __putimage
; Line 236
	mov	sp,bp
	pop	bp
	ret	

_example_putimage	ENDP
; Line 238
	PUBLIC	_example_imagesize
_example_imagesize	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 239
	mov	ax,100
	push	ax
	push	ax
	mov	ax,10
	push	ax
	push	ax
	call	FAR PTR __imagesize
	add	sp,8
; Line 240
	ret	

_example_imagesize	ENDP
; Line 244
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 245
	call	_example_setvideomode
; Line 246
	call	_example_setactivepage
; Line 247
	call	_example_setvisualpage
; Line 248
	call	_example_getvideoconfig
; Line 249
	call	_example_setlogorg
; Line 250
	call	_example_getlogcoord
; Line 251
	call	_example_getphyscoord
; Line 252
	call	_example_setcliprgn
; Line 253
	call	_example_setviewport
; Line 254
	call	_example_clearscreen
; Line 255
	call	_example_moveto
; Line 256
	call	_example_getcurrentposition
; Line 257
	call	_example_lineto
; Line 258
	call	_example_rectangle
; Line 259
	call	_example_ellipse
; Line 260
	call	_example_arc
; Line 261
	call	_example_pie
; Line 262
	call	_example_setpixel
; Line 263
	call	_example_getpixel
; Line 264
	call	_example_floodfill
; Line 265
	call	_example_setcolor
; Line 266
	call	_example_getcolor
; Line 267
	call	_example_setlinestyle
; Line 268
	call	_example_getlinestyle
; Line 269
	call	_example_setfillmask
; Line 270
	call	_example_getfillmask
; Line 271
	call	_example_setbkcolor
; Line 272
	call	_example_getbkcolor
; Line 273
	call	_example_remappalette
; Line 274
	call	_example_remapallpalette
; Line 275
	call	_example_selectpalette
; Line 276
	call	_example_settextwindow
; Line 277
	call	_example_outtext
; Line 278
	call	_example_wrapon
; Line 279
	call	_example_displaycursor
; Line 280
	call	_example_settextposition
; Line 281
	call	_example_gettextposition
; Line 282
	call	_example_settextcolor
; Line 283
	call	_example_gettextcolor
; Line 284
	call	_example_getimage
; Line 285
	call	_example_putimage
; Line 286
	call	_example_imagesize
; Line 289
	mov	ax,-1
	push	ax
	call	FAR PTR __setvideomode
	add	sp,2
; Line 290
	ret	

_main	ENDP
_TEXT	ENDS
END
