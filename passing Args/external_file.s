len_cal:
	push ebx
	mov ebx, eax

loop:
	cmp byte [eax], 0
	jz end_loop
	inc eax
	jmp loop

end_loop:
	sub eax,ebx
	pop ebx
	ret

printF:
	push edx
	push ecx
	push ebx
	push eax
	call len_cal

	mov edx, eax
	pop eax

	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 0x80

	pop edx
	pop ecx
	pop edx
	ret
 
Print:
	call printF
	push eax
	mov eax, 0Ah
	push eax
	mov eax, esp
	call printF
	pop eax
	pop eax
	ret


quit:
	mov ebx, 0
	mov eax, 1
	int 0x80
	ret
