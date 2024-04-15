; run in terminal: curl http://localhost:9001

%include "external_file.s"

section .data
        response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 1>
        res_len         equ     $-response
section .bss
        buff resb 255,

section .text
        global _start

_start:
        xor eax, eax
        xor ebx, ebx
        xor edi, edi
        xor esi, esi

_socket:
        push byte 6     ;IPPROTO TCP
        push byte 1     ;SOCK_STREAM (IPv4)
        push byte 2     ;PF_INET
        mov ecx, esp
        mov ebx, 1
        mov eax, 102
        int 0x80

_bind:
        mov edi, eax            ;the socket's return value

        ;create server address

        push dword 0x00000000   ;IP_ADDRESS
        push word 0x2923        ;PORT
        push word 2             ;AF_INET


        mov ecx, esp            ;sockaddr_args(AF_INET, PORT,IP_ADDRESS)

        push byte 16            ;sizeof(struct sockaddr)
        push ecx                ;pointer to struct address
        push edi                ;socket_object 

        mov ecx, esp 
        mov ebx, 2
        mov eax, 102
        int 0x80
listen:
        push byte 1             ;only 1 listen queue
        push edi                ;socket_object
        mov ecx, esp
        mov ebx, 4
        mov eax, 102
        int 0x80

_accept:
        push byte 0             ;addr len argument
        push byte 0             ;addr argument
        push edi
        mov ecx, esp
        mov ebx, 5
        mov eax, 102
        int 0x80
_fork:
        mov esi, eax
        mov eax, 2
        int 0x80

        cmp eax, 0
        jz _read

        jmp _accept
_read:
        mov edx, 255
        mov ecx, buff
        mov ebx, esi
        mov eax, 3
        int 0x80

        mov eax, buff
        call print_char
_write:
        mov edx, res_len
        mov ecx, response
        mov ebx, esi
        mov eax, 4
        int 0x80
_close:
    mov     ebx, esi            
    mov     eax, 6              
    int     80h 
_exit:
        call quit
