%include "atoi.s"


section .text
	global _start

_start:
	pop ecx		;ecx holds the number of args
	pop edx		;edx holds the program names
	sub ecx, 1
	mov edx, 0

nextArgs:
	cmp ecx, 0h
	jz noMoreArgs
	pop eax
	call atoi
	add edx, eax
	dec ecx
	jmp nextArgs

noMoreArgs:
	mov eax, edx		;mov data result into eax
	call printWLineFeed
	call quit
