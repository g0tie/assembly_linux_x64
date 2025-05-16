SECTION .data
	prompt db 'Insert name:',0
	greeting db 'Hello, '

SECTION .bss
	name resb 32

SECTION .text
	global _start

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
		call putGreeting
		call putName
	
	slen:
		push rbx
		mov rbx, rax
		
	.nextchar:
		cmp byte [rax],0
		jz .finished
		inc rax
		jmp .nextchar

	.finished:
		sub rax, rbx
		pop rbx

		ret

	putPrompt:
		mov rax, prompt
		call _write
		ret

	readName:
		mov rbx, 32
		mov rcx, name
		call _read
		ret


	putGreeting:
		mov rax, greeting
		call _write
		ret

	putName:
		mov rax, name
		call _write
		ret

	exit:
		mov rax, 60
		xor rdi, rdi
		syscall
