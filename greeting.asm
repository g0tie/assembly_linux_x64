SECTION .data
	prompt db 'Insert name:',0
	greeting db 'Hello, '

SECTION .bss
	name resb 32

SECTION .text
	global _start

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
		mov rbx, 32
		mov rcx, name
		call _read
	_read:
		push rcx
		push rbx

		mov rax, 0
		mov rdi, 0
		mov rsi, rcx
		mov rdx, rbx

		pop rbx
		pop rcx

		syscall

		ret

	putGreeting:
		mov rax, greeting
		call _write

	putName:
		mov rax, name
		call _write


	exit:
		mov rax, 60
		xor rdi, rdi
		syscall
