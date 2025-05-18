%macro addnumbers 2
	mov rax, %1
	add rax, %2
	mov [result], rax
%endmacro

%macro exit 0
	mov rax, 60
	xor rdi, rdi
	syscall
%endmacro

SECTION .data
	num1 dq 5
	num2 dq 2
	result dq 0


SECTION .text
	global _start


_start:
	addnumbers num1, num2
	exit
