%include        "external_file.s"

section .data
        msg1    db      "Hello!",0Ah, 0h
        msg2    db      "Have a good day!", 0Ah, 0h

section .text
        global _start

_start:
        mov eax, msg1
        call print

        mov eax, msg2
        call print

        call quit
