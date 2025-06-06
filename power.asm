global main
extern puts
extern printf
extern atoi


section .text

main:

	push r12
	push r13
	push r14

	cmp rdi, 3
	jne error1

	mov r12, rsi


	mov rdi, [r12+16]
	call atoi

	cmp eax, 0
	jl error2
	mov r13d, eax




