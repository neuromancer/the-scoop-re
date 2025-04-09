;	Static Name Aliases
;
	TITLE   CODE.C
	NAME    CODE

	.8087
CODE_TEXT	SEGMENT  WORD PUBLIC 'CODE'
CODE_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME  CS: CODE_TEXT, DS: DGROUP, SS: DGROUP
EXTRN	__acrtused:ABS
EXTRN	_exit:FAR
EXTRN	__chkstk:FAR
EXTRN	_access:FAR
EXTRN	_chmod:FAR
EXTRN	_chsize:FAR
EXTRN	_close:FAR
EXTRN	_creat:FAR
EXTRN	_dup:FAR
EXTRN	_dup2:FAR
EXTRN	_eof:FAR
EXTRN	_filelength:FAR
EXTRN	_isatty:FAR
EXTRN	_locking:FAR
EXTRN	_lseek:FAR
EXTRN	_mktemp:FAR
EXTRN	_open:FAR
EXTRN	_read:FAR
EXTRN	_remove:FAR
EXTRN	_rename:FAR
EXTRN	_setmode:FAR
EXTRN	_sopen:FAR
EXTRN	_tell:FAR
EXTRN	_umask:FAR
EXTRN	_write:FAR
EXTRN	_abort:FAR
COMM FAR	_array1:	BYTE:	 1024
COMM FAR	_array2:	BYTE:	 1024
CONST      SEGMENT
$SG150	DB	'dummy.txt',  00H
$SG153	DB	'dummy.txt',  00H
$SG160	DB	'newfile.txt',  00H
$SG184	DB	'somefile.txt',  00H
	ORG	$+1
$SG193	DB	'newname.txt',  00H
$SG194	DB	'oldname.txt',  00H
$SG199	DB	'sharedfile.txt',  00H
CONST      ENDS
CODE_TEXT      SEGMENT
	ASSUME	CS: CODE_TEXT
; Line 14
	PUBLIC	_example_access
_example_access	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 15
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG150
	push	ds
	push	ax
	call	FAR PTR _access
	add	sp,6
; Line 16
	ret	

_example_access	ENDP
; Line 18
	PUBLIC	_example_chmod
_example_chmod	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 19
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG153
	push	ds
	push	ax
	call	FAR PTR _chmod
	add	sp,6
; Line 20
	ret	

_example_chmod	ENDP
; Line 22
	PUBLIC	_example_chsize
_example_chsize	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 23
	mov	ax,1024
	cwd	
	push	dx
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _chsize
	add	sp,6
; Line 24
	ret	

_example_chsize	ENDP
; Line 26
	PUBLIC	_example_close
_example_close	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 27
	mov	ax,1
	push	ax
	call	FAR PTR _close
	add	sp,2
; Line 28
	ret	

_example_close	ENDP
; Line 30
	PUBLIC	_example_creat
_example_creat	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 31
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG160
	push	ds
	push	ax
	call	FAR PTR _creat
	add	sp,6
; Line 32
	ret	

_example_creat	ENDP
; Line 34
	PUBLIC	_example_dup
_example_dup	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 35
	mov	ax,1
	push	ax
	call	FAR PTR _dup
	add	sp,2
; Line 36
	ret	

_example_dup	ENDP
; Line 38
	PUBLIC	_example_dup2
_example_dup2	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 39
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _dup2
	add	sp,4
; Line 40
	ret	

_example_dup2	ENDP
; Line 42
	PUBLIC	_example_eof
_example_eof	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 43
	mov	ax,1
	push	ax
	call	FAR PTR _eof
	add	sp,2
; Line 44
	ret	

_example_eof	ENDP
; Line 46
	PUBLIC	_example_exit
_example_exit	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 47
	mov	ax,1
	push	ax
	call	FAR PTR _exit
	add	sp,2
; Line 48
	ret	

_example_exit	ENDP
; Line 50
	PUBLIC	_example_abort
_example_abort	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 51
	call	FAR PTR _abort
; Line 52
	ret	
	nop	

_example_abort	ENDP
; Line 54
	PUBLIC	_example_filelength
_example_filelength	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 55
	mov	ax,1
	push	ax
	call	FAR PTR _filelength
	add	sp,2
; Line 56
	ret	

_example_filelength	ENDP
; Line 58
	PUBLIC	_example_isatty
_example_isatty	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 59
	mov	ax,1
	push	ax
	call	FAR PTR _isatty
	add	sp,2
; Line 60
	ret	

_example_isatty	ENDP
; Line 62
	PUBLIC	_example_locking
_example_locking	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 63
	mov	ax,1024
	cwd	
	push	dx
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _locking
	add	sp,8
; Line 64
	ret	
	nop	

_example_locking	ENDP
; Line 66
	PUBLIC	_example_lseek
_example_lseek	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 67
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _lseek
	add	sp,8
; Line 68
	ret	
	nop	

_example_lseek	ENDP
; Line 70
	PUBLIC	_example_mktemp
_example_mktemp	PROC FAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	FAR PTR __chkstk
;	templat = -10
; Line 72
	lea	ax,WORD PTR [bp-10]	;templat
	push	ss
	push	ax
	call	FAR PTR _mktemp
; Line 73
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_mktemp	ENDP
; Line 75
	PUBLIC	_example_open
_example_open	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 76
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG184
	push	ds
	push	ax
	call	FAR PTR _open
	add	sp,6
; Line 77
	ret	

_example_open	ENDP
; Line 79
	PUBLIC	_example_read
_example_read	PROC FAR
	push	bp
	mov	bp,sp
	mov	ax,100
	call	FAR PTR __chkstk
;	buffer = -100
; Line 81
	mov	ax,100
	push	ax
	lea	ax,WORD PTR [bp-100]	;buffer
	push	ss
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _read
; Line 82
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_read	ENDP
; Line 84
	PUBLIC	_example_remove
_example_remove	PROC FAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	FAR PTR __chkstk
;	filename = -4
; Line 85
	mov	WORD PTR [bp-4],22136	;filename
	mov	WORD PTR [bp-2],4660
; Line 86
	mov	ax,22136
	mov	dx,4660
	push	dx
	push	ax
	call	FAR PTR _remove
; Line 87
	mov	sp,bp
	pop	bp
	ret	

_example_remove	ENDP
; Line 89
	PUBLIC	_example_rename
_example_rename	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 90
	mov	ax,OFFSET DGROUP:$SG193
	push	ds
	push	ax
	mov	ax,OFFSET DGROUP:$SG194
	push	ds
	push	ax
	call	FAR PTR _rename
	add	sp,8
; Line 91
	ret	

_example_rename	ENDP
; Line 93
	PUBLIC	_example_setmode
_example_setmode	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 94
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _setmode
	add	sp,4
; Line 95
	ret	
	nop	

_example_setmode	ENDP
; Line 97
	PUBLIC	_example_sopen
_example_sopen	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 98
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG199
	push	ds
	push	ax
	call	FAR PTR _sopen
	add	sp,8
; Line 99
	ret	
	nop	

_example_sopen	ENDP
; Line 101
	PUBLIC	_example_tell
_example_tell	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 102
	mov	ax,1
	push	ax
	call	FAR PTR _tell
	add	sp,2
; Line 103
	ret	

_example_tell	ENDP
; Line 105
	PUBLIC	_example_umask
_example_umask	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 106
	sub	ax,ax
	push	ax
	call	FAR PTR _umask
	add	sp,2
; Line 107
	ret	
	nop	

_example_umask	ENDP
; Line 109
	PUBLIC	_example_write
_example_write	PROC FAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	FAR PTR __chkstk
;	buffer = -10
; Line 111
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [bp-10]	;buffer
	push	ss
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _write
; Line 112
	mov	sp,bp
	pop	bp
	ret	
	nop	

_example_write	ENDP
; Line 114
	PUBLIC	_main
_main	PROC FAR
	xor	ax,ax
	call	FAR PTR __chkstk
; Line 115
	push	cs
	call	_example_access
; Line 116
	push	cs
	call	_example_chmod
; Line 117
	push	cs
	call	_example_chsize
; Line 118
	push	cs
	call	_example_close
; Line 119
	push	cs
	call	_example_creat
; Line 120
	push	cs
	call	_example_dup
; Line 121
	push	cs
	call	_example_dup2
; Line 122
	push	cs
	call	_example_eof
; Line 123
	push	cs
	call	_example_filelength
; Line 124
	push	cs
	call	_example_isatty
; Line 125
	push	cs
	call	_example_locking
; Line 126
	push	cs
	call	_example_lseek
; Line 127
	push	cs
	call	_example_mktemp
; Line 128
	push	cs
	call	_example_open
; Line 129
	push	cs
	call	_example_read
; Line 130
	push	cs
	call	_example_remove
; Line 131
	push	cs
	call	_example_rename
; Line 132
	push	cs
	call	_example_setmode
; Line 133
	push	cs
	call	_example_sopen
; Line 134
	push	cs
	call	_example_tell
; Line 135
	push	cs
	call	_example_umask
; Line 136
	push	cs
	call	_example_write
; Line 137
	push	cs
	call	_example_exit
; Line 138
	push	cs
	call	_example_abort
; Line 139
	sub	ax,ax
	ret	

_main	ENDP
CODE_TEXT	ENDS
END
