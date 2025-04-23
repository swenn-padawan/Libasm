global	ft_create_elem
extern	malloc

ft_create_elem:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16
	mov		[rbp - 8], rdi
	mov		rdi, 16
	call	malloc WRT ..plt
	test	rax, rax
	je		.end
	mov		rdi, [rbp - 8]
	mov		[rax], rdi
	mov		qword [rax + 8], 0
.end:
	add		rsp, 16
	pop		rbp
	ret


global	ft_list_push_front

ft_list_push_front:
	push	rbp
	mov		rbp, rsp

	push	rdi		; rbp - 8
	push	rsi		; rbp - 16
	
	cmp		qword [rbp - 8], 0	; if (!head) goto end
	je		.end

	mov		rdi, [rbp - 16]		; node = ft_create_elem(data)
	call	ft_create_elem
	test	rax, rax			; if (!node) goto end
	je		.end

	mov		rdi, [rbp - 8]		
	mov		rdi, [rdi]
	mov		qword [rax + 8], rdi		; node->next = *head
	mov		rdi, [rbp - 8]
	mov		[rdi], rax			; *head = node
.end:
	add		rsp, 16
	pop		rbp
	ret
