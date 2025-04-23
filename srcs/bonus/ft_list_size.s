global ft_list_size

;rdi = lst
ft_list_size:
	push	rbp				;
	mov		rbp, rsp		;stackframe

	xor		rax, rax		;inialise rax
.loop:
	cmp		qword [rdi], 0  ; verifie si le node est NULL (fin)
	je		.end			; si c'est le cas on ret
	inc		rax				; increment
	add		rdi, 16			; deplace au prochain node (ca marche pas)
	jmp		.loop			; recommence

.end:
	pop		rbp				; restore la stack frame
	ret						; retourne rax
	
