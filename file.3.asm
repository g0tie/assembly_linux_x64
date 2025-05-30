%include './mylibs/common_macros.asm'

SECTION .data
	filename db 'file.txt', 0
	text db 'I love Zaina', 10, 0 

SECTION .bss
	fd resd 1

SECTION .text
	global _start

_start:
	mov eax, 2
	mov rdi, filename
	mov rsi, 64 | 1024 | 2
	mov rdx, 0o664
	syscall
	mov [fd], eax

	mov edi, [fd]
	mov rsi, text
	call getLen
	mov eax, 1
	mov rdx, rcx
	syscall	

	mov rax, 3
	mov rdi, [fd]
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
	

getLen:
	xor rcx, rcx
	.loop:
		mov al, [rsi + rcx ]
		test al, al
		
		jz .done
		inc rcx
		jmp .loop

	.done:
		ret
