.text
.global _main

_main:
    push rbp
    mov rbp, rsp
    mov eax, 1
    mov ebx, 2
    add eax, ebx
    pop rbp
    ret