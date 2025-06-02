
SECTION .text
global main
extern puts

main:
	mov rdi, message
	call puts
	ret

message: 
	db "Hola, mundo"


