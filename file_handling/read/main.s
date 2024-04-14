%include "external_file.s"

section .data
	filename	db	'result.txt', 0h
	msg		db	'Happy to see u', 0Ah, 0h
	msg_len		equ	$-msg

section .bss
	fileBuff	resb	255,

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

	mov ecx, 0
	mov ebx, filename
	mov eax, 5
	int 0x80

	mov edx, msg_len
	mov ecx, fileBuff
	mov ebx, eax
	mov eax, 3
	int 0x80

	mov eax, fileBuff
	call print_char
	call quit
