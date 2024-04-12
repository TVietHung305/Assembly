len_cal:
        push ebx
        mov ebx, eax

next_char:
        cmp byte [eax], 0
        jz end_loop
        inc eax
        jmp next_char

end_loop:
        sub eax, ebx
        pop ebx
        ret

print:
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

        pop ebx
        pop ecx
        pop edx
        ret

quit:
        mov ebx, 0
        mov eax, 1
        int 0x80
        ret
