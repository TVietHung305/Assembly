section .text
	global main

printMsg:
	mov ecx, msg
	mov edx, msg_len
	mov eax, 4
	mov ebx, 1
	int 0x80
	ret

main:
	call printMsg

section .data
	msg db "Hello world!", 10
	msg_len equ $-msg
