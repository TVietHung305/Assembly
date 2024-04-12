%include "external_file.s"

section .text
	global _start

_start:
	mov ebx, 10
	mov eax, 5
	add eax, ebx
	call printWLineFeed
	
	call quit
