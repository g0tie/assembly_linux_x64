%include './mylibs/common_macros.asm'

SECTION .data
	nline db 10 
	argc_str db 'Number of arguments are: ', 0
	argn_str db 'Argument number ', 0
	ending db ' is: ', 0

SECTION .bss
	digit resb 30
	argc resb 8

SECTION .text
	global _start

_start:
	pop rax
	mov [argc], rax
	printString argc_str 
	printDigit [argc]
	printNline

printArgs:
	xor rbx, rbx
	
	printArgsLoop:
		cmp rbx, [argc]
		jge printArgsDone
		inc rbx 
		
		printString argn_str
		printDigit rbx
		printString ending 
		
		pop r15
		printString r15
		printNline
		
		jmp printArgsLoop
	printArgsDone:
		exit 
		
