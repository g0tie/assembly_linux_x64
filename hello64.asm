SECTION .data
msg2 db 'Hello World',0xA                            
SECTION .bss

                                                     SECTION .text
global _start
                                                     _start:
        mov rax, 1
        mov rsi,msg2
        mov rdi,1
        mov rdx,12                                           
	syscall                                              
	mov rax,60
        xor rdi,rdi
        syscall
