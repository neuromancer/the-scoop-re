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
EXTRN	__dos_setdate:NEAR
EXTRN	__dos_setdrive:NEAR
EXTRN	__dos_setfileattr:NEAR
EXTRN	__dos_setftime:NEAR
EXTRN	__dos_settime:NEAR
EXTRN	_printf:NEAR
EXTRN	__dos_read:NEAR
EXTRN	__dos_write:NEAR
EXTRN	_chdir:NEAR
EXTRN	_mkdir:NEAR
EXTRN	_rmdir:NEAR
EXTRN	__chkstk:NEAR
EXTRN	_strcpy:NEAR
EXTRN	__dos_allocmem:NEAR
EXTRN	__dos_close:NEAR
EXTRN	__dos_creat:NEAR
EXTRN	__dos_creatnew:NEAR
EXTRN	__dos_findfirst:NEAR
EXTRN	__dos_findnext:NEAR
EXTRN	__dos_freemem:NEAR
EXTRN	__dos_getdate:NEAR
EXTRN	__dos_getdrive:NEAR
EXTRN	__dos_getdiskfree:NEAR
EXTRN	_lseek:NEAR
EXTRN	__dos_getfileattr:NEAR
EXTRN	__dos_getftime:NEAR
EXTRN	__dos_gettime:NEAR
EXTRN	__dos_keep:NEAR
EXTRN	__dos_open:NEAR
EXTRN	__dos_setblock:NEAR
CONST      SEGMENT
$SG394	DB	'--- Simplified DOS API Calls (Compile Check - Fixed) ---',  0aH
	DB	00H
$SG395	DB	0aH, '--- Finished Simple DOS API Examples (Fixed) ---',  0aH
	DB	00H
	ORG	$+1
$SG398	DB	'* example_dos_open',  0aH,  00H
$SG399	DB	'DUMMY.FIL',  00H
$SG402	DB	'* example_dos_close',  0aH,  00H
	ORG	$+1
$SG405	DB	'* example_dos_creat',  0aH,  00H
	ORG	$+1
$SG406	DB	'DUMMY.NEW',  00H
$SG409	DB	'* example_dos_creatnew',  0aH,  00H
$SG410	DB	'DUMMY.NWR',  00H
$SG416	DB	'* example_dos_read',  0aH,  00H
$SG422	DB	'* example_dos_write',  0aH,  00H
	ORG	$+1
$SG423	DB	'TestData',  00H
	ORG	$+1
$SG426	DB	'* example_dos_findfirst',  0aH,  00H
	ORG	$+1
$SG427	DB	'*.*',  00H
$SG430	DB	'* example_dos_findnext',  0aH,  00H
$SG433	DB	'* example_dos_getfileattr',  0aH,  00H
	ORG	$+1
$SG434	DB	'DUMMY.ATR',  00H
$SG437	DB	'* example_dos_setfileattr',  0aH,  00H
	ORG	$+1
$SG438	DB	'DUMMY.ATR',  00H
$SG442	DB	'* example_dos_getdiskfree',  0aH,  00H
	ORG	$+1
$SG445	DB	'* example_dos_getdate',  0aH,  00H
	ORG	$+1
$SG448	DB	'* example_dos_setdate',  0aH,  00H
	ORG	$+1
$SG451	DB	'* example_dos_gettime',  0aH,  00H
	ORG	$+1
$SG454	DB	'* example_dos_settime',  0aH,  00H
	ORG	$+1
$SG458	DB	'* example_dos_allocmem',  0aH,  00H
$SG461	DB	'* example_dos_freemem',  0aH,  00H
	ORG	$+1
$SG466	DB	'* example_dos_setblock',  0aH,  00H
$SG469	DB	'* example_dos_getdrive',  0aH,  00H
$SG473	DB	'* example_dos_setdrive',  0aH,  00H
$SG476	DB	'* example_dos_chdir',  0aH,  00H
	ORG	$+1
$SG477	DB	'\DOS',  00H
	ORG	$+1
$SG480	DB	'* example_dos_mkdir',  0aH,  00H
	ORG	$+1
$SG481	DB	'NEWDIR',  00H
	ORG	$+1
$SG484	DB	'* example_dos_rmdir',  0aH,  00H
	ORG	$+1
$SG485	DB	'OLDDIR',  00H
	ORG	$+1
$SG489	DB	'* example_dos_keep',  0aH,  00H
$SG490	DB	'  (If _dos_keep executed, this line wouldn''t print)',  0aH,  00H
	ORG	$+1
$SG495	DB	'* example_dos_getftime',  0aH,  00H
$SG500	DB	'* example_dos_setftime',  0aH,  00H
$SG505	DB	'* example_dos_lseek',  0aH,  00H
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 55
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__chkstk
; Line 56
	mov	ax,OFFSET DGROUP:$SG394
	push	ax
	call	_printf
	add	sp,2
; Line 58
	call	_example_dos_open
; Line 59
	call	_example_dos_close
; Line 60
	call	_example_dos_creat
; Line 61
	call	_example_dos_creatnew
; Line 62
	call	_example_dos_read
; Line 63
	call	_example_dos_write
; Line 64
	call	_example_dos_findfirst
; Line 65
	call	_example_dos_findnext
; Line 66
	call	_example_dos_getfileattr
; Line 67
	call	_example_dos_setfileattr
; Line 68
	call	_example_dos_getdiskfree
; Line 69
	call	_example_dos_getdate
; Line 70
	call	_example_dos_setdate
; Line 71
	call	_example_dos_gettime
; Line 72
	call	_example_dos_settime
; Line 73
	call	_example_dos_allocmem
; Line 74
	call	_example_dos_freemem
; Line 75
	call	_example_dos_setblock
; Line 76
	call	_example_dos_getdrive
; Line 77
	call	_example_dos_setdrive
; Line 78
	call	_example_dos_chdir
; Line 79
	call	_example_dos_mkdir
; Line 80
	call	_example_dos_rmdir
; Line 81
	call	_example_dos_keep
; Line 82
	call	_example_dos_getftime
; Line 83
	call	_example_dos_setftime
; Line 84
	call	_example_dos_lseek
; Line 86
	mov	ax,OFFSET DGROUP:$SG395
	push	ax
	call	_printf
	add	sp,2
; Line 87
	sub	ax,ax
	ret	
	nop	

_main	ENDP
; Line 92
	PUBLIC	_example_dos_open
_example_dos_open	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_handle_out = -2
; Line 94
	mov	ax,OFFSET DGROUP:$SG398
	push	ax
	call	_printf
	add	sp,2
; Line 96
	lea	ax,WORD PTR [bp-2]	;dummy_handle_out
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG399
	push	ax
	call	__dos_open
; Line 97
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dos_open	ENDP
; Line 99
	PUBLIC	_example_dos_close
_example_dos_close	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_handle_in = -2
; Line 100
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 101
	mov	ax,OFFSET DGROUP:$SG402
	push	ax
	call	_printf
	add	sp,2
; Line 102
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	__dos_close
; Line 103
	mov	sp,bp
	pop	bp
	ret	

_example_dos_close	ENDP
; Line 105
	PUBLIC	_example_dos_creat
_example_dos_creat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_handle_out = -2
; Line 107
	mov	ax,OFFSET DGROUP:$SG405
	push	ax
	call	_printf
	add	sp,2
; Line 109
	lea	ax,WORD PTR [bp-2]	;dummy_handle_out
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG406
	push	ax
	call	__dos_creat
; Line 110
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dos_creat	ENDP
; Line 112
	PUBLIC	_example_dos_creatnew
_example_dos_creatnew	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_handle_out = -2
; Line 114
	mov	ax,OFFSET DGROUP:$SG409
	push	ax
	call	_printf
	add	sp,2
; Line 116
	lea	ax,WORD PTR [bp-2]	;dummy_handle_out
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG410
	push	ax
	call	__dos_creatnew
; Line 117
	mov	sp,bp
	pop	bp
	ret	

_example_dos_creatnew	ENDP
; Line 119
	PUBLIC	_example_dos_read
_example_dos_read	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	dummy_handle_in = -2
;	dummy_buffer = -14
;	dummy_bytes_to_read = -4
;	dummy_bytes_read_out = -16
; Line 120
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 122
	mov	WORD PTR [bp-4],10	;dummy_bytes_to_read
; Line 124
	mov	ax,OFFSET DGROUP:$SG416
	push	ax
	call	_printf
	add	sp,2
; Line 125
	lea	ax,WORD PTR [bp-16]	;dummy_bytes_read_out
	push	ax
	push	WORD PTR [bp-4]	;dummy_bytes_to_read
	lea	ax,WORD PTR [bp-14]	;dummy_buffer
	push	ss
	push	ax
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	__dos_read
; Line 126
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dos_read	ENDP
; Line 128
	PUBLIC	_example_dos_write
_example_dos_write	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__chkstk
;	dummy_handle_in = -2
;	dummy_buffer = -14
;	dummy_bytes_to_write = -4
;	dummy_bytes_written_out = -16
; Line 129
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 132
	mov	WORD PTR [bp-4],8	;dummy_bytes_to_write
; Line 134
	mov	ax,OFFSET DGROUP:$SG422
	push	ax
	call	_printf
	add	sp,2
; Line 135
	mov	ax,OFFSET DGROUP:$SG423
	push	ax
	lea	ax,WORD PTR [bp-14]	;dummy_buffer
	push	ax
	call	_strcpy
	add	sp,4
; Line 136
	lea	ax,WORD PTR [bp-16]	;dummy_bytes_written_out
	push	ax
	push	WORD PTR [bp-4]	;dummy_bytes_to_write
	lea	ax,WORD PTR [bp-14]	;dummy_buffer
	push	ss
	push	ax
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	__dos_write
; Line 137
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dos_write	ENDP
; Line 139
	PUBLIC	_example_dos_findfirst
_example_dos_findfirst	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__chkstk
;	dummy_fileinfo = -44
; Line 142
	mov	ax,OFFSET DGROUP:$SG426
	push	ax
	call	_printf
	add	sp,2
; Line 144
	lea	ax,WORD PTR [bp-44]	;dummy_fileinfo
	push	ax
	mov	ax,17
	push	ax
	mov	ax,OFFSET DGROUP:$SG427
	push	ax
	call	__dos_findfirst
; Line 145
	mov	sp,bp
	pop	bp
	ret	

_example_dos_findfirst	ENDP
; Line 147
	PUBLIC	_example_dos_findnext
_example_dos_findnext	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__chkstk
;	dummy_fileinfo = -44
; Line 150
	mov	ax,OFFSET DGROUP:$SG430
	push	ax
	call	_printf
	add	sp,2
; Line 151
	lea	ax,WORD PTR [bp-44]	;dummy_fileinfo
	push	ax
	call	__dos_findnext
; Line 152
	mov	sp,bp
	pop	bp
	ret	

_example_dos_findnext	ENDP
; Line 154
	PUBLIC	_example_dos_getfileattr
_example_dos_getfileattr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_attribute_out = -2
; Line 156
	mov	ax,OFFSET DGROUP:$SG433
	push	ax
	call	_printf
	add	sp,2
; Line 157
	lea	ax,WORD PTR [bp-2]	;dummy_attribute_out
	push	ax
	mov	ax,OFFSET DGROUP:$SG434
	push	ax
	call	__dos_getfileattr
; Line 158
	mov	sp,bp
	pop	bp
	ret	

_example_dos_getfileattr	ENDP
; Line 160
	PUBLIC	_example_dos_setfileattr
_example_dos_setfileattr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_attribute_in = -2
; Line 161
	mov	WORD PTR [bp-2],32	;dummy_attribute_in
; Line 162
	mov	ax,OFFSET DGROUP:$SG437
	push	ax
	call	_printf
	add	sp,2
; Line 163
	push	WORD PTR [bp-2]	;dummy_attribute_in
	mov	ax,OFFSET DGROUP:$SG438
	push	ax
	call	__dos_setfileattr
; Line 164
	mov	sp,bp
	pop	bp
	ret	

_example_dos_setfileattr	ENDP
; Line 166
	PUBLIC	_example_dos_getdiskfree
_example_dos_getdiskfree	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	dummy_drive = -10
;	dummy_diskinfo = -8
; Line 167
	mov	WORD PTR [bp-10],0	;dummy_drive
; Line 170
	mov	ax,OFFSET DGROUP:$SG442
	push	ax
	call	_printf
	add	sp,2
; Line 171
	lea	ax,WORD PTR [bp-8]	;dummy_diskinfo
	push	ax
	push	WORD PTR [bp-10]	;dummy_drive
	call	__dos_getdiskfree
; Line 172
	mov	sp,bp
	pop	bp
	ret	

_example_dos_getdiskfree	ENDP
; Line 174
	PUBLIC	_example_dos_getdate
_example_dos_getdate	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_dateinfo = -6
; Line 177
	mov	ax,OFFSET DGROUP:$SG445
	push	ax
	call	_printf
	add	sp,2
; Line 178
	lea	ax,WORD PTR [bp-6]	;dummy_dateinfo
	push	ax
	call	__dos_getdate
; Line 179
	mov	sp,bp
	pop	bp
	ret	

_example_dos_getdate	ENDP
; Line 181
	PUBLIC	_example_dos_setdate
_example_dos_setdate	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_dateinfo = -6
; Line 184
	mov	ax,OFFSET DGROUP:$SG448
	push	ax
	call	_printf
	add	sp,2
; Line 185
	mov	WORD PTR [bp-4],1999
; Line 186
	mov	BYTE PTR [bp-5],12
; Line 187
	mov	BYTE PTR [bp-6],31	;dummy_dateinfo
; Line 189
	lea	ax,WORD PTR [bp-6]	;dummy_dateinfo
	push	ax
	call	__dos_setdate
; Line 190
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_dos_setdate	ENDP
; Line 192
	PUBLIC	_example_dos_gettime
_example_dos_gettime	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_timeinfo = -4
; Line 195
	mov	ax,OFFSET DGROUP:$SG451
	push	ax
	call	_printf
	add	sp,2
; Line 196
	lea	ax,WORD PTR [bp-4]	;dummy_timeinfo
	push	ax
	call	__dos_gettime
; Line 197
	mov	sp,bp
	pop	bp
	ret	

_example_dos_gettime	ENDP
; Line 199
	PUBLIC	_example_dos_settime
_example_dos_settime	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_timeinfo = -4
; Line 202
	mov	ax,OFFSET DGROUP:$SG454
	push	ax
	call	_printf
	add	sp,2
; Line 203
	mov	BYTE PTR [bp-4],10	;dummy_timeinfo
; Line 204
	mov	BYTE PTR [bp-3],30
; Line 205
	mov	BYTE PTR [bp-2],0
; Line 206
	mov	BYTE PTR [bp-1],0
; Line 207
	lea	ax,WORD PTR [bp-4]	;dummy_timeinfo
	push	ax
	call	__dos_settime
; Line 208
	mov	sp,bp
	pop	bp
	ret	

_example_dos_settime	ENDP
; Line 210
	PUBLIC	_example_dos_allocmem
_example_dos_allocmem	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_size_paras = -4
;	dummy_segment_out = -2
; Line 211
	mov	WORD PTR [bp-4],64	;dummy_size_paras
; Line 213
	mov	ax,OFFSET DGROUP:$SG458
	push	ax
	call	_printf
	add	sp,2
; Line 214
	lea	ax,WORD PTR [bp-2]	;dummy_segment_out
	push	ax
	push	WORD PTR [bp-4]	;dummy_size_paras
	call	__dos_allocmem
; Line 215
	mov	sp,bp
	pop	bp
	ret	

_example_dos_allocmem	ENDP
; Line 217
	PUBLIC	_example_dos_freemem
_example_dos_freemem	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_segment_in = -2
; Line 218
	mov	WORD PTR [bp-2],4096	;dummy_segment_in
; Line 219
	mov	ax,OFFSET DGROUP:$SG461
	push	ax
	call	_printf
	add	sp,2
; Line 220
	push	WORD PTR [bp-2]	;dummy_segment_in
	call	__dos_freemem
; Line 221
	mov	sp,bp
	pop	bp
	ret	

_example_dos_freemem	ENDP
; Line 223
	PUBLIC	_example_dos_setblock
_example_dos_setblock	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_new_size_paras = -4
;	dummy_segment_in = -2
;	dummy_max_available_out = -6
; Line 224
	mov	WORD PTR [bp-4],128	;dummy_new_size_paras
; Line 225
	mov	WORD PTR [bp-2],4096	;dummy_segment_in
; Line 227
	mov	ax,OFFSET DGROUP:$SG466
	push	ax
	call	_printf
	add	sp,2
; Line 228
	lea	ax,WORD PTR [bp-6]	;dummy_max_available_out
	push	ax
	push	WORD PTR [bp-2]	;dummy_segment_in
	push	WORD PTR [bp-4]	;dummy_new_size_paras
	call	__dos_setblock
; Line 229
	mov	sp,bp
	pop	bp
	ret	

_example_dos_setblock	ENDP
; Line 231
	PUBLIC	_example_dos_getdrive
_example_dos_getdrive	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__chkstk
;	dummy_drive_out = -2
; Line 233
	mov	ax,OFFSET DGROUP:$SG469
	push	ax
	call	_printf
	add	sp,2
; Line 234
	lea	ax,WORD PTR [bp-2]	;dummy_drive_out
	push	ax
	call	__dos_getdrive
; Line 235
	mov	sp,bp
	pop	bp
	ret	

_example_dos_getdrive	ENDP
; Line 237
	PUBLIC	_example_dos_setdrive
_example_dos_setdrive	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_drive_in = -4
;	dummy_total_drives_out = -2
; Line 238
	mov	WORD PTR [bp-4],3	;dummy_drive_in
; Line 240
	mov	ax,OFFSET DGROUP:$SG473
	push	ax
	call	_printf
	add	sp,2
; Line 241
	lea	ax,WORD PTR [bp-2]	;dummy_total_drives_out
	push	ax
	push	WORD PTR [bp-4]	;dummy_drive_in
	call	__dos_setdrive
; Line 242
	mov	sp,bp
	pop	bp
	ret	

_example_dos_setdrive	ENDP
; Line 244
	PUBLIC	_example_dos_chdir
_example_dos_chdir	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	dummy_path = -10
; Line 247
	mov	ax,OFFSET DGROUP:$SG476
	push	ax
	call	_printf
	add	sp,2
; Line 248
	mov	ax,OFFSET DGROUP:$SG477
	push	ax
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_strcpy
	add	sp,4
; Line 249
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_chdir
; Line 250
	mov	sp,bp
	pop	bp
	ret	

_example_dos_chdir	ENDP
; Line 252
	PUBLIC	_example_dos_mkdir
_example_dos_mkdir	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	dummy_path = -10
; Line 255
	mov	ax,OFFSET DGROUP:$SG480
	push	ax
	call	_printf
	add	sp,2
; Line 256
	mov	ax,OFFSET DGROUP:$SG481
	push	ax
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_strcpy
	add	sp,4
; Line 257
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_mkdir
; Line 258
	mov	sp,bp
	pop	bp
	ret	

_example_dos_mkdir	ENDP
; Line 260
	PUBLIC	_example_dos_rmdir
_example_dos_rmdir	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__chkstk
;	dummy_path = -10
; Line 263
	mov	ax,OFFSET DGROUP:$SG484
	push	ax
	call	_printf
	add	sp,2
; Line 264
	mov	ax,OFFSET DGROUP:$SG485
	push	ax
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_strcpy
	add	sp,4
; Line 265
	lea	ax,WORD PTR [bp-10]	;dummy_path
	push	ax
	call	_rmdir
; Line 266
	mov	sp,bp
	pop	bp
	ret	

_example_dos_rmdir	ENDP
; Line 268
	PUBLIC	_example_dos_keep
_example_dos_keep	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__chkstk
;	dummy_status = -2
;	dummy_memsize_paras = -4
; Line 269
	mov	WORD PTR [bp-2],0	;dummy_status
; Line 270
	mov	WORD PTR [bp-4],100	;dummy_memsize_paras
; Line 271
	mov	ax,OFFSET DGROUP:$SG489
	push	ax
	call	_printf
	add	sp,2
; Line 273
	push	WORD PTR [bp-4]	;dummy_memsize_paras
	push	WORD PTR [bp-2]	;dummy_status
	call	__dos_keep
	add	sp,4
; Line 274
	mov	ax,OFFSET DGROUP:$SG490
	push	ax
	call	_printf
; Line 275
	mov	sp,bp
	pop	bp
	ret	

_example_dos_keep	ENDP
; Line 277
	PUBLIC	_example_dos_getftime
_example_dos_getftime	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_handle_in = -2
;	dummy_date_out = -4
;	dummy_time_out = -6
; Line 278
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 281
	mov	ax,OFFSET DGROUP:$SG495
	push	ax
	call	_printf
	add	sp,2
; Line 282
	lea	ax,WORD PTR [bp-6]	;dummy_time_out
	push	ax
	lea	ax,WORD PTR [bp-4]	;dummy_date_out
	push	ax
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	__dos_getftime
; Line 283
	mov	sp,bp
	pop	bp
	ret	

_example_dos_getftime	ENDP
; Line 285
	PUBLIC	_example_dos_setftime
_example_dos_setftime	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__chkstk
;	dummy_handle_in = -2
;	dummy_date_in = -4
;	dummy_time_in = -6
; Line 286
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 287
	mov	WORD PTR [bp-4],7855	;dummy_date_in
; Line 288
	mov	WORD PTR [bp-6],29632	;dummy_time_in
; Line 289
	mov	ax,OFFSET DGROUP:$SG500
	push	ax
	call	_printf
	add	sp,2
; Line 290
	push	WORD PTR [bp-6]	;dummy_time_in
	push	WORD PTR [bp-4]	;dummy_date_in
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	__dos_setftime
; Line 291
	mov	sp,bp
	pop	bp
	ret	

_example_dos_setftime	ENDP
; Line 293
	PUBLIC	_example_dos_lseek
_example_dos_lseek	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__chkstk
;	dummy_handle_in = -2
;	dummy_offset = -6
;	dummy_origin = -8
; Line 294
	mov	WORD PTR [bp-2],1	;dummy_handle_in
; Line 295
	sub	ax,ax
	mov	WORD PTR [bp-4],ax
	mov	WORD PTR [bp-6],ax	;dummy_offset
; Line 296
	mov	WORD PTR [bp-8],ax	;dummy_origin
; Line 297
	mov	ax,OFFSET DGROUP:$SG505
	push	ax
	call	_printf
	add	sp,2
; Line 298
	push	WORD PTR [bp-8]	;dummy_origin
	push	WORD PTR [bp-4]
	push	WORD PTR [bp-6]	;dummy_offset
	push	WORD PTR [bp-2]	;dummy_handle_in
	call	_lseek
; Line 299
	mov	sp,bp
	pop	bp
	ret	

_example_dos_lseek	ENDP
_TEXT	ENDS
END
