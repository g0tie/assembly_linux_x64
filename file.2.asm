%include './mylibs/common_macros.asm'

SECTION .data
	filename db 'file.txt', 0

SECTION .bss
	fd resd 1
	buffer resq 16

SECTION .text
	global _start

_start:
	mov rax, 2
	mov rdi, filename
	mov rsi, 0
	mov rdx, 0o0
	syscall

	mov [fd], rax

	mov rax, 0
	mov edi, [fd]
	mov rsi, buffer
	mov rdx, 128
	syscall

	push rax
	mov rax, 1
	mov rdi, 1
	mov rsi, buffer
	pop rdx
	syscall


	mov rax, 3
	mov rdi, [fd]
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
	
