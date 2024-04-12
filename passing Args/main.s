%include "external_file.s"

section .text
	global _start

_start:
	pop ecx

next_Arg:
	cmp ecx, 0
	jz noMoreArg
	pop eax
	call Print
	dec ecx
	jmp next_Arg
noMoreArg:
	call quit
