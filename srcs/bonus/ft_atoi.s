;atoi (piscine 42)
;skip whitespaces
;skip tout les -/+ et le nombre retourner est negatif si le nombre de - est pair ou impair
;prendre ensuite tout les caracteres de base10 et les convertir en int
;rdi = str
;int a mettre dans rax

.isdigit:
	cmp		byte[rdi], 0
	je		.end
	cmp		byte[rdi], '0'
	jl		.error
	cmp		byte[rdi], '9'
	jg		.error
	jmp		.mainloop

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
	cmp		byte[rdi], 0
	je		.end
	cmp		byte[rdi], '-' ;45
	je		.signcnt
	cmp		byte[rdi], '+' ;43
	je		.plusskip
.mainloop: ; a ce stade je suis sur le nombre
	jmp		.isdigit
	mov		rsi, rax
	mov		al, byte[rdi]
	mul		al, 10
	mov		ebx, byte[rdi + 1]
	sub		ebx, '0' ;32
	add		rax, ebx
	jmp		.mainloop
.convert:
	and		rsi, 1
	je		.end
	mul		rax, -1
	.end
	pop		rbp
	ret

.error:
	xor		rax, rax
	ret
.plusskip:
	inc	rdi
	jmp		.signloop
.signcnt:
	inc		rax
	inc		rdi
	jmp		.signloop

