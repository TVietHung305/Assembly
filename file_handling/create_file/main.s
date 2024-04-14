%include "external_file.s"

section .data
	pathname	db	'res.txt', 0h

section .text
	global _start

_start:
	mov ecx, 0777
	mov ebx, pathname
	mov eax, 8
	int 0x80
	call quit
