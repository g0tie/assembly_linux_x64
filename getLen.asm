%include './mylibs/strings.asm'

SECTION .data
	msg2 db 'Hello',0

SECTION .text
global _start

_start:
	mov rsi, msg2
	call getLen
	
	
	mov rax, 1
	mov rdi, 1
	mov rdx,rcx
	syscall

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
	ret


exit:
	mov rax, 60
	xor rdi, rdi
	syscall
