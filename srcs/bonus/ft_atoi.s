;atoi (piscine 42)
;skip whitespaces
;skip tout les -/+ et le nombre retourner est negatif si le nombre de - est pair ou impair
;prendre ensuite tout les caracteres de base10 et les convertir en int
;rdi = str
;int a mettre dans rax

global ft_atoi
ft_atoi:
	push	rbp
	mov		rbp, rsp
.spaceloop:
	cmp		byte[rdi], 0
	je		.end
	cmp		byte[rdi], 32 ;(TODO) comparer tout les isspace)
	inc		rdi
	jmp		.spaceloop ; pas de else...
.signloop:
	cmp		byte[rdi], 45 ; '-'
	je		.signcnt
	cmp		byte[rdi], 43 ; '+'
	incr	rdi
	jmp		.signloop ; same...
.mainloop:
	


	pop		rbp

.end
	ret

.signcnt:
	incr	rax
