SECTION .data
	increment dw 0x1000,0

SECTION .text
global _start

_start:
	;get current program brk
	mov rax, 12
	xor rdi, rdi
	syscall

	mov rbx, rax

	add rbx, [increment] ;increment is a pointer adresse so with crochet it means i want the value at adress increment and not i want to add the increment (which is a pointer adress) to rbx
	
	mov rax, 12
	mov rdi, rbx
	syscall

	jmp exit
	
exit:
	mov rax, 60
	xor rdi, rdi
	syscall
	
