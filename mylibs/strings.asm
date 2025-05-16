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
	mov [rsi + rax - 1], byte 0

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
