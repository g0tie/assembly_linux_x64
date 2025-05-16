%include './mylibs/strings.asm'

SECTION .data
	msg1 db 'Test',0

SECTION .bss


SECTION .text
global _start

_start:
	mov rsi, msg1
	call getLen
	jmp exit


getLen:
	xor rcx, rcx

.loop:
	mov al, [rsi + rcx]


	cmp al, 0
	jz .done

	inc rcx
	jmp .loop

.done:
	push rax
	mov rax, rcx
	add rax, 48

	call _write
	ret

exit:
	mov rax, 60
	xor rdi, rdi
	syscall


