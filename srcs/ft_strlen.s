; size_t	ft_strlen(char *str)
;	rdi = str
global	ft_strlen
ft_strlen:
	xor		rax, rax
	test	rdi, rdi
	je		.end
	mov		rax, rdi
.loop:
	cmp		byte [rax], 0
	je		.end
	add		rax, 1
	jmp		.loop
.end:
	sub		rax, rdi
	ret

