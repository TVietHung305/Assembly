%include "external_file.s"

section .data
	pathname	db	'/bin/echo', 0h
	arg1		db	'Have a good day :v', 0h
	arguments	dd	pathname
			dd	arg1
			dd	0h
	env		dd	0h

section .text
	global _start

_start:
	mov edx, env
	mov ecx, arguments
	mov ebx, pathname
	mov eax, 11
	int 0x80
	call quit
