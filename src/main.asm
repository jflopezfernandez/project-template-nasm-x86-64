
    global _start

;     section .data
; message: db 'Hello, world!', 0x0A
; len: equ $-message
; newline_character: db 0x0A

    section .bss
input_buffer: resb 512

    section .text
;-----------------------------------------------------------------------------
;                               Exit
;-----------------------------------------------------------------------------
;
;   Function: 
;
;       exit
;
;   Description:
;
;       This function takes a single argument via the RDI register. This
;       argument is the exit code of the program, and is not modified or
;       changed in any way. It is very important for this reason that the
;       caller not forget to actually set the return value, as an error
;       code may be returned by accident otherwise.
;
;-----------------------------------------------------------------------------
exit:
    mov rax, SYSCALL_EXIT
    syscall

print_newline:
    mov rax, SYSCALL_WRITE
    mov rdi, STDOUT
    mov rsi, 0x0A
    mov rdx, 1
    syscall
    ret

_start:
    mov rax, SYSCALL_READ
    mov rdi, STDIN
    mov rsi, input_buffer
    mov rdx, 512
    syscall

    mov rax, SYSCALL_WRITE
    mov rdi, STDOUT
    mov rsi, input_buffer
    mov rdx, 512
    syscall

    call print_newline

    mov rax, SYSCALL_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
