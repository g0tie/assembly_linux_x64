global add_four_floats

section .text

add_four_floats:
	movdqa xmm0, [rdi]
	movdqa xmm1, [rsi]
	
	addps xmm0, xmm1
	movdqa [rdi], xmm0

	ret
