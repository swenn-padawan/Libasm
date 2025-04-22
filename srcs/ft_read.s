extern	__errno_location

global ft_read
ft_read:
	xor		rax, rax
	syscall
	test	rax, rax
	jl		.fail
	ret
.fail:
	neg		rax
	mov		rdi, rax
	call	__errno_location
	mov		[rax], rdi
	mov		rax, -1
	ret	
