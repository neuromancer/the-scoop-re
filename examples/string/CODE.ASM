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
EXTRN	_strrev:NEAR
EXTRN	_strset:NEAR
EXTRN	_strspn:NEAR
EXTRN	_strstr:NEAR
EXTRN	_strtok:NEAR
EXTRN	_strupr:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_memccpy:NEAR
EXTRN	_memchr:NEAR
EXTRN	_memcmp:NEAR
EXTRN	_memicmp:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_memmove:NEAR
EXTRN	_memset:NEAR
EXTRN	_movedata:NEAR
EXTRN	_strcat:NEAR
EXTRN	_strchr:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strcmpi:NEAR
EXTRN	_stricmp:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strcspn:NEAR
EXTRN	_strdup:NEAR
EXTRN	__strerror:NEAR
EXTRN	_strerror:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strlwr:NEAR
EXTRN	_strncat:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_strnicmp:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_strnset:NEAR
EXTRN	_strpbrk:NEAR
EXTRN	_strrchr:NEAR
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 9
	PUBLIC	_example_memccpy
_example_memccpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__chkstk
;	src_memccpy = -20
;	dest_memccpy = -40
; Line 12
	mov	ax,15
	push	ax
	mov	ax,32
	push	ax
	lea	ax,WORD PTR [bp-20]	;src_memccpy
	push	ax
	lea	ax,WORD PTR [bp-40]	;dest_memccpy
	push	ax
	call	_memccpy
; Line 13
	mov	sp,bp
	pop	bp
	ret	

_example_memccpy	ENDP
; Line 15
	PUBLIC	_example_memchr
_example_memchr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__chkstk
;	buffer_memchr = -30
; Line 17
	mov	ax,20
	push	ax
	mov	ax,99
	push	ax
	lea	ax,WORD PTR [bp-30]	;buffer_memchr
	push	ax
	call	_memchr
; Line 18
	mov	sp,bp
	pop	bp
	ret	

_example_memchr	ENDP
; Line 20
	PUBLIC	_example_memcmp
_example_memcmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	buf1_memcmp = -10
;	buf2_memcmp = -20
; Line 23
	mov	ax,6
	push	ax
	lea	ax,WORD PTR [bp-20]	;buf2_memcmp
	push	ax
	lea	ax,WORD PTR [bp-10]	;buf1_memcmp
	push	ax
	call	_memcmp
; Line 24
	mov	sp,bp
	pop	bp
	ret	

_example_memcmp	ENDP
; Line 26
	PUBLIC	_example_memicmp
_example_memicmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	buf1_memicmp = -10
;	buf2_memicmp = -20
; Line 29
	mov	ax,6
	push	ax
	lea	ax,WORD PTR [bp-20]	;buf2_memicmp
	push	ax
	lea	ax,WORD PTR [bp-10]	;buf1_memicmp
	push	ax
	call	_memicmp
; Line 30
	mov	sp,bp
	pop	bp
	ret	

_example_memicmp	ENDP
; Line 32
	PUBLIC	_example_memcpy
_example_memcpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__chkstk
;	src_memcpy = -20
;	dest_memcpy = -40
; Line 35
	mov	ax,13
	push	ax
	lea	ax,WORD PTR [bp-20]	;src_memcpy
	push	ax
	lea	ax,WORD PTR [bp-40]	;dest_memcpy
	push	ax
	call	_memcpy
; Line 36
	mov	sp,bp
	pop	bp
	ret	

_example_memcpy	ENDP
; Line 38
	PUBLIC	_example_memmove
_example_memmove	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__chkstk
;	buffer_memmove = -30
; Line 40
	mov	ax,15
	push	ax
	lea	ax,WORD PTR [bp-30]	;buffer_memmove
	push	ax
	lea	ax,WORD PTR [bp-25]
	push	ax
	call	_memmove
; Line 41
	mov	sp,bp
	pop	bp
	ret	

_example_memmove	ENDP
; Line 43
	PUBLIC	_example_memset
_example_memset	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	buffer_memset = -20
; Line 45
	mov	ax,19
	push	ax
	mov	ax,65
	push	ax
	lea	ax,WORD PTR [bp-20]	;buffer_memset
	push	ax
	call	_memset
; Line 46
	mov	sp,bp
	pop	bp
	ret	

_example_memset	ENDP
; Line 48
	PUBLIC	_example_movedata
_example_movedata	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	src_seg = -4
;	src_off = -2
;	dest_seg = -10
;	dest_off = -8
;	count = -6
; Line 49
	mov	WORD PTR [bp-4],-18432	;src_seg
; Line 50
	mov	WORD PTR [bp-2],0	;src_off
; Line 51
	mov	WORD PTR [bp-10],-24576	;dest_seg
; Line 52
	mov	WORD PTR [bp-8],0	;dest_off
; Line 53
	mov	WORD PTR [bp-6],100	;count
; Line 54
	mov	ax,100
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,-24576
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,-18432
	push	ax
	call	_movedata
; Line 55
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_movedata	ENDP
; Line 57
	PUBLIC	_example_strcat
_example_strcat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,70
	call	__chkstk
;	dest_strcat = -50
;	src_strcat = -70
; Line 62
	lea	ax,WORD PTR [bp-70]	;src_strcat
	push	ax
	lea	ax,WORD PTR [bp-50]	;dest_strcat
	push	ax
	call	_strcat
; Line 63
	mov	sp,bp
	pop	bp
	ret	

_example_strcat	ENDP
; Line 65
	PUBLIC	_example_strchr
_example_strchr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	str_strchr = -20
; Line 67
	mov	ax,120
	push	ax
	lea	ax,WORD PTR [bp-20]	;str_strchr
	push	ax
	call	_strchr
; Line 68
	mov	sp,bp
	pop	bp
	ret	

_example_strchr	ENDP
; Line 70
	PUBLIC	_example_strcmp
_example_strcmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__chkstk
;	str1_strcmp = -16
;	str2_strcmp = -32
; Line 73
	lea	ax,WORD PTR [bp-32]	;str2_strcmp
	push	ax
	lea	ax,WORD PTR [bp-16]	;str1_strcmp
	push	ax
	call	_strcmp
; Line 74
	mov	sp,bp
	pop	bp
	ret	

_example_strcmp	ENDP
; Line 76
	PUBLIC	_example_strcmpi
_example_strcmpi	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__chkstk
;	str1_strcmpi = -16
;	str2_strcmpi = -32
; Line 79
	lea	ax,WORD PTR [bp-32]	;str2_strcmpi
	push	ax
	lea	ax,WORD PTR [bp-16]	;str1_strcmpi
	push	ax
	call	_strcmpi
; Line 80
	mov	sp,bp
	pop	bp
	ret	

_example_strcmpi	ENDP
; Line 82
	PUBLIC	_example_stricmp
_example_stricmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__chkstk
;	str1_stricmp = -16
;	str2_stricmp = -32
; Line 85
	lea	ax,WORD PTR [bp-32]	;str2_stricmp
	push	ax
	lea	ax,WORD PTR [bp-16]	;str1_stricmp
	push	ax
	call	_stricmp
; Line 86
	mov	sp,bp
	pop	bp
	ret	

_example_stricmp	ENDP
; Line 88
	PUBLIC	_example_strcpy
_example_strcpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__chkstk
;	src_strcpy = -50
;	dest_strcpy = -30
; Line 91
	lea	ax,WORD PTR [bp-50]	;src_strcpy
	push	ax
	lea	ax,WORD PTR [bp-30]	;dest_strcpy
	push	ax
	call	_strcpy
; Line 92
	mov	sp,bp
	pop	bp
	ret	

_example_strcpy	ENDP
; Line 94
	PUBLIC	_example_strcspn
_example_strcspn	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__chkstk
;	reject_strcspn = -28
;	str_strcspn = -16
; Line 97
	lea	ax,WORD PTR [bp-28]	;reject_strcspn
	push	ax
	lea	ax,WORD PTR [bp-16]	;str_strcspn
	push	ax
	call	_strcspn
; Line 98
	mov	sp,bp
	pop	bp
	ret	

_example_strcspn	ENDP
; Line 100
	PUBLIC	_example_strdup
_example_strdup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__chkstk
;	str_strdup = -30
; Line 102
	lea	ax,WORD PTR [bp-30]	;str_strdup
	push	ax
	call	_strdup
; Line 103
	mov	sp,bp
	pop	bp
	ret	

_example_strdup	ENDP
; Line 105
	PUBLIC	_example__strerror
_example__strerror	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 106
	sub	ax,ax
	push	ax
	call	__strerror
	add	sp,2
; Line 107
	ret	
	nop	

_example__strerror	ENDP
; Line 109
	PUBLIC	_example_strerror
_example_strerror	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 110
	mov	ax,2
	push	ax
	call	_strerror
	add	sp,2
; Line 111
	ret	

_example_strerror	ENDP
; Line 113
	PUBLIC	_example_strlen
_example_strlen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	str_strlen = -20
; Line 115
	lea	ax,WORD PTR [bp-20]	;str_strlen
	push	ax
	call	_strlen
; Line 116
	mov	sp,bp
	pop	bp
	ret	

_example_strlen	ENDP
; Line 118
	PUBLIC	_example_strlwr
_example_strlwr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	str_strlwr = -20
; Line 120
	lea	ax,WORD PTR [bp-20]	;str_strlwr
	push	ax
	call	_strlwr
; Line 121
	mov	sp,bp
	pop	bp
	ret	

_example_strlwr	ENDP
; Line 123
	PUBLIC	_example_strncat
_example_strncat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,70
	call	__chkstk
;	dest_strncat = -50
;	src_strncat = -70
; Line 128
	mov	ax,9
	push	ax
	lea	ax,WORD PTR [bp-70]	;src_strncat
	push	ax
	lea	ax,WORD PTR [bp-50]	;dest_strncat
	push	ax
	call	_strncat
; Line 129
	mov	sp,bp
	pop	bp
	ret	

_example_strncat	ENDP
; Line 131
	PUBLIC	_example_strncmp
_example_strncmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__chkstk
;	str1_strncmp = -20
;	str2_strncmp = -40
; Line 134
	mov	ax,13
	push	ax
	lea	ax,WORD PTR [bp-40]	;str2_strncmp
	push	ax
	lea	ax,WORD PTR [bp-20]	;str1_strncmp
	push	ax
	call	_strncmp
; Line 135
	mov	sp,bp
	pop	bp
	ret	

_example_strncmp	ENDP
; Line 137
	PUBLIC	_example_strnicmp
_example_strnicmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__chkstk
;	str1_strnicmp = -20
;	str2_strnicmp = -40
; Line 140
	mov	ax,13
	push	ax
	lea	ax,WORD PTR [bp-40]	;str2_strnicmp
	push	ax
	lea	ax,WORD PTR [bp-20]	;str1_strnicmp
	push	ax
	call	_strnicmp
; Line 141
	mov	sp,bp
	pop	bp
	ret	

_example_strnicmp	ENDP
; Line 143
	PUBLIC	_example_strncpy
_example_strncpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,46
	call	__chkstk
;	src_strncpy = -46
;	dest_strncpy = -16
; Line 146
	mov	ax,14
	push	ax
	lea	ax,WORD PTR [bp-46]	;src_strncpy
	push	ax
	lea	ax,WORD PTR [bp-16]	;dest_strncpy
	push	ax
	call	_strncpy
; Line 148
	mov	sp,bp
	pop	bp
	ret	

_example_strncpy	ENDP
; Line 150
	PUBLIC	_example_strnset
_example_strnset	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	str_strnset = -20
; Line 152
	mov	ax,5
	push	ax
	mov	ax,42
	push	ax
	lea	ax,WORD PTR [bp-20]	;str_strnset
	push	ax
	call	_strnset
; Line 153
	mov	sp,bp
	pop	bp
	ret	

_example_strnset	ENDP
; Line 155
	PUBLIC	_example_strpbrk
_example_strpbrk	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__chkstk
;	str_strpbrk = -26
;	accept_strpbrk = -38
; Line 158
	lea	ax,WORD PTR [bp-38]	;accept_strpbrk
	push	ax
	lea	ax,WORD PTR [bp-26]	;str_strpbrk
	push	ax
	call	_strpbrk
; Line 159
	mov	sp,bp
	pop	bp
	ret	

_example_strpbrk	ENDP
; Line 161
	PUBLIC	_example_strrchr
_example_strrchr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__chkstk
;	str_strrchr = -30
; Line 163
	mov	ax,111
	push	ax
	lea	ax,WORD PTR [bp-30]	;str_strrchr
	push	ax
	call	_strrchr
; Line 164
	mov	sp,bp
	pop	bp
	ret	

_example_strrchr	ENDP
; Line 166
	PUBLIC	_example_strrev
_example_strrev	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__chkstk
;	str_strrev = -26
; Line 168
	lea	ax,WORD PTR [bp-26]	;str_strrev
	push	ax
	call	_strrev
; Line 169
	mov	sp,bp
	pop	bp
	ret	

_example_strrev	ENDP
; Line 171
	PUBLIC	_example_strset
_example_strset	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__chkstk
;	str_strset = -20
; Line 173
	mov	ax,35
	push	ax
	lea	ax,WORD PTR [bp-20]	;str_strset
	push	ax
	call	_strset
; Line 174
	mov	sp,bp
	pop	bp
	ret	

_example_strset	ENDP
; Line 176
	PUBLIC	_example_strspn
_example_strspn	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__chkstk
;	str_strspn = -16
;	accept_strspn = -28
; Line 179
	lea	ax,WORD PTR [bp-28]	;accept_strspn
	push	ax
	lea	ax,WORD PTR [bp-16]	;str_strspn
	push	ax
	call	_strspn
; Line 180
	mov	sp,bp
	pop	bp
	ret	

_example_strspn	ENDP
; Line 182
	PUBLIC	_example_strstr
_example_strstr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__chkstk
;	haystack_strstr = -50
;	needle_strstr = -10
; Line 185
	lea	ax,WORD PTR [bp-10]	;needle_strstr
	push	ax
	lea	ax,WORD PTR [bp-50]	;haystack_strstr
	push	ax
	call	_strstr
; Line 186
	mov	sp,bp
	pop	bp
	ret	

_example_strstr	ENDP
; Line 188
	PUBLIC	_example_strtok
_example_strtok	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__chkstk
;	str_strtok = -26
;	delim_strtok = -28
; Line 191
	lea	ax,WORD PTR [bp-28]	;delim_strtok
	push	ax
	lea	ax,WORD PTR [bp-26]	;str_strtok
	push	ax
	call	_strtok
; Line 192
	mov	sp,bp
	pop	bp
	ret	

_example_strtok	ENDP
; Line 194
	PUBLIC	_example_strupr
_example_strupr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__chkstk
;	str_strupr = -26
; Line 196
	lea	ax,WORD PTR [bp-26]	;str_strupr
	push	ax
	call	_strupr
; Line 197
	mov	sp,bp
	pop	bp
	ret	

_example_strupr	ENDP
; Line 200
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 201
	call	_example_memccpy
; Line 202
	call	_example_memchr
; Line 203
	call	_example_memcmp
; Line 204
	call	_example_memicmp
; Line 205
	call	_example_memcpy
; Line 206
	call	_example_memmove
; Line 207
	call	_example_memset
; Line 208
	call	_example_movedata
; Line 209
	call	_example_strcat
; Line 210
	call	_example_strchr
; Line 211
	call	_example_strcmp
; Line 212
	call	_example_strcmpi
; Line 213
	call	_example_stricmp
; Line 214
	call	_example_strcpy
; Line 215
	call	_example_strcspn
; Line 216
	call	_example_strdup
; Line 217
	call	_example__strerror
; Line 218
	call	_example_strerror
; Line 219
	call	_example_strlen
; Line 220
	call	_example_strlwr
; Line 221
	call	_example_strncat
; Line 222
	call	_example_strncmp
; Line 223
	call	_example_strnicmp
; Line 224
	call	_example_strncpy
; Line 225
	call	_example_strnset
; Line 226
	call	_example_strpbrk
; Line 227
	call	_example_strrchr
; Line 228
	call	_example_strrev
; Line 229
	call	_example_strset
; Line 230
	call	_example_strspn
; Line 231
	call	_example_strstr
; Line 232
	call	_example_strtok
; Line 233
	call	_example_strupr
; Line 235
	sub	ax,ax
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
