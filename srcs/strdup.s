global	ft_strdup
extern	ft_strlen
extern	ft_strcpy
extern	malloc

; char	*strdup(char *str)
;	rdi = str

ft_strdup:
	push	rbp
	call	ft_strlen
	mov		rbx, rdi
	lea		rdi, [rax + 1]
	call	malloc
	test	rax, rax
	je		.end
	mov		rdi, rax
	mov		rsi, rbx
	call	ft_strcpy
.end:
	pop	rbp
	ret

