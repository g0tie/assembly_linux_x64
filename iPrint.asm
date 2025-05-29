%include './mylibs/strings.asm'

SECTION .data
	lb db 0xA

SECTION .bss
	intBuffer resb 30

%macro exit 0
	mov rax, 60
	xor rdi, rdi
	syscall
%endmacro


SECTION .text
	global _start

_start:
	mov rax, 1232
	call iPrint
	
	exit


iPrint:
	mov r15, intBuffer
	mov ebx, 10

	.extractDigits:
		xor rdx,rdx
		div rbx
		
		add rdx, 48
		mov [r15], dl
		
		inc r15
		
		test rax, rax
		jz .printDigits
		jmp .extractDigits


	.printDigits:
		dec r15
		
		mov rax, 1
		mov rdi, 1
		mov rsi, r15
		mov rdx, 1
		syscall

		cmp r15, intBuffer
		jge .printDigits
		jmp .done

	.done:
		mov rax, 1
		mov rdi, 1
		mov rsi, lb
		mov rdx, 1
		syscall
		ret
