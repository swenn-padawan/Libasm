extern	__errno_location

%define	SYS_WRITE	1	

global ft_write
ft_write:
	test	rsi, rsi
	je		.null
	mov		rax, SYS_WRITE
	syscall
	test	rax, rax
	jl		.fail
	ret
.null:
	mov		rax, -22
.fail:
	neg		rax
	mov		rdi, rax
	call	__errno_location
	mov		[rax], rdi
	mov		rax, -1
	ret	
