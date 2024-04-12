len_cal:
	push ebx
	mov ebx, eax

next_char:
	cmp byte [eax], 0
	jz end_loop
	inc eax
	jmp next_char
	
end_lo:
	


print:
	push edx
	push ecx
	push ebx
	push eax
	call len_cal
