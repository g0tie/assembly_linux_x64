%include './mylibs/strings.asm'

SECTION .data
	digit db 0

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

	push rax

	mov rax, digit
	call _write

	pop rax

	ret


exit:
	mov rax, 60
	xor rdi, rdi
	syscall


