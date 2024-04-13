atoi:
	push ebx
	push ecx
	push edx
	push esi
	mov esi, eax		;mov pointer to esi
	mov eax, 0
	mov ecx, 0
.loop:
	xor ebx, ebx 				;reset ebx to be 0
	mov bl, [esi + ecx]		;move a single byte into ebx resgister's lower half
	;checking 48 <= bl <= 57
	cmp bl, 48
	jl .finished
	cmp bl, 57
	jg .finished

	sub bl, 48				;convert to number
	add eax, ebx				;save in eax
	mov ebx, 10
	mul ebx
	inc ecx
	jmp .loop

.finished:
	cmp ecx, 0
	je .restore
	mov ebx, 10
	div ebx
.restore:
	pop esi
	pop edx
	pop ecx
	pop ebx 
	ret




;========================================
print:
        push eax
        push ecx
        push edx
        push esi
        mov ecx, 0

divideLoop:
        inc ecx                 ;count each byte to print
        mov edx, 0
        mov esi, 10
        idiv esi                ;eax = eax/esi
        add edx, 48             ;edx holds the reminder 
        push edx
        cmp eax, 0
        jnz divideLoop
printLoop:
        dec ecx
        mov eax, esp 
        call print_char
        pop eax
        cmp ecx, 0
        jnz printLoop

        pop esi
        pop edx
        pop ecx
        pop eax
        ret
;==================================
len:
        push ebx
        mov ebx, eax
nextChar:
        cmp byte [eax], 0
        jz end_loop
        inc eax
        jmp nextChar

end_loop:
        sub eax, ebx
        pop ebx
        ret

;==================================
print_char:
        push edx
        push ecx
        push ebx
        push eax
        call len

        mov edx, eax
        pop eax

        mov ecx, eax
        mov ebx, 1
        mov eax, 4
        int 0x80

        pop ebx
        pop ecx
        pop edx
        ret


;==================================
printWLineFeed:
        call print
        push eax
        mov eax, 0Ah
        push eax
        mov eax, esp
        call print_char
        pop eax
        pop eax
        ret


quit:
        mov ebx, 0
        mov eax, 1
        int 0x80
        ret
