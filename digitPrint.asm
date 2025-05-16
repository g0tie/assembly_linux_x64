%include './mylibs/strings.asm'

SECTION .data
	digit db 0, 0Ah

;SECTION .bss


SECTION .text
global _start

_start:
	mov rax, 5
	call printDigit
	jmp exit

printDigit:

	add rax, 48
	mov [digit], al
	mov byte [digit + 1], 0
	
	push rax

	mov rax, digit
	call _write

	pop rax

	ret


exit:
	mov rax, 60
	xor rdi, rdi
	syscall


