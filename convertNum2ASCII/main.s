%include "external_file.s"

section .text
	global _start

_start:
	mov ecx, 0

nextNum:
	inc ecx
	mov eax, ecx
	call printWLineFeed
	cmp ecx, 10
	jne nextNum

	call quit
