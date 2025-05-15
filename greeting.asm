SECTION .data
	prompt db 'Insert name:',0
	greeting db 'Hello, '

SECTION .bss
	name resb 32

SECTION .text
	global _start

	_start:
		call putPrompt
		call readName
	
	slen:
		push rbx
		mov rbx, rax
		
	.nextchar:
		cmp byte [eax],0
		jz .finished
		inc rax
		jmp nextchar

	.finished
		sub rax, rbx
		pop rbx

		ret

	putPrompt:
		mov rax, prompt
		call _write
	readName:
		mov rcx, name
		call _read
	_read:
		push rcx
		mov rax, 0
		mov rdi, 0
		mov rsi, rcx
		mov rdx, 32
		pop rcx
		syscall

		ret

	putGreeting:

		

	putName:

	_write:
		push rax
		call slen
		
		mov rdi, 1
		mov rdx, rax
		pop rax

		mov rsi, rax
		mov rax, 1

		syscall
		
		ret

	exit:
		mov rax, 60
		xor rdi, rdi
		syscall
