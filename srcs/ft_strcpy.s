; char	*ft_strcpy(char *dst, const char *src)
;	rdi = dst
;	rsi = src
global	ft_strcpy
ft_strcpy:
	mov		rax, rdi
	test	rdi, rdi
	je		.end
	test	rsi, rsi
	je		.end
.loop:
	cmp		byte [rsi], 0
	je		.end
	movzx	ebx, byte [rsi]
	mov		byte [rdi], bl
	inc		rdi
	inc		rsi
	jmp		.loop
.end:
	mov		byte [rdi], 0
	ret

