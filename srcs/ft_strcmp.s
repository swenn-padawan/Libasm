;int	ft_strcmp(char *a, char *b)
;rdi = a
;rsi = b

global ft_strcmp
ft_strcmp:
	mov		rax, 0
	test	rdi, rdi
	je		.end
	test	rsi, rsi
	je		.end
.loop:
	movzx	eax, byte [rdi]
	movzx	ebx, byte [rsi]
	sub		rax, rbx
	cmp		rax, 0
	jne		.end
	cmp		bl, 0
	je		.end
	inc		rdi
	inc		rsi
	jmp		.loop
.end:
	ret
