global main
extern puts
extern printf
extern atoi

section .data
	badArgMsg db 'Require 2 arguments', 0Ah, 0
	negExpMsg db 'Exponent cant be negative', 0Ah, 0
	answer db '%d', 0Ah, 0

section .text

main:

	push r12
	push r13
	push r14

	cmp rdi, 3 ; argv (ici 2 argument + le nom du prog)
	jne error1 ;si pas le nb d'arguments requis ou + msg d'errreur

	mov r12, rsi ; argv copié dans rsi argv[x, y]


	mov rdi, [r12+16] ; rdi = argv [2]
	call atoi ; argv[2] to integer
	cmp eax, 0 ; si 0 renvoie erreur, nbr dt être positif
	jl error2
	mov r13d, eax ; r13d (32bits) = résultat (argv[2] en integer)


	mov rdi, [r12+8] ; rdi = argv[1]
	call atoi ; argv[1] to integer
	mov r14d, eax ;r14d (32bits) = integer argv[1]

	mov eax, 1

	
check: ;loop multiplie 1 par un le nombre par lui même (pour simuler les puissances) en commençant d'abord pas 1 car eax vaut 1 au début
	test r13d, r13d
	jz gotit
	
	imul eax, r14d
	dec r13d
	
	jmp check

gotit:
	mov rdi, answer
	movsxd rsi, eax
	
	xor rax, rax
	call printf
	
	jmp done


error1:
	mov edi, badArgMsg
	call puts
	jmp done

error2:
	mov edi, negExpMsg
	call puts
	
done:
	pop r14
	pop r13
	pop r12
	ret

	
