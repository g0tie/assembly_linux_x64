%macro printDigit 1
    mov rax, %1
    add rax, 48
    mov [digit], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 8
    syscall
%endmacro

%macro printNline 0
    mov rax, 1
    mov rdi, 1
    mov rsi, nline
    mov rdx, 1
    syscall
%endmacro

%macro printString 1
    mov rsi, %1
    xor rcx, rcx
    %%getLenLoop:
        mov al, [rsi + rcx]
        test al, al
        jz %%done
        inc rcx
        jmp %%getLenLoop
    %%done:
        mov rax, 1
        mov rdi, 1
        mov rsi, %1
        mov rdx, rcx
        syscall
%endmacro

%macro exit 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro
