%include "external_file.s"

section .data
	filename	db 	'res.txt', 0h
	msg		db	'Welcome to HellGate -,-',0Ah,0h
	msg_len		equ	$-msg
section .text
	global _start

_start:
	mov ecx, 0777
	mov ebx, filename
	mov eax, 8
	int 0x80

	mov edx, msg_len
	mov ecx, msg
	mov ebx, eax
	mov eax, 4
	int 0x80

	call quit
