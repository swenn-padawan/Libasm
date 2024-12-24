section .bss
	buffer resb 1024

section .text
    global _start

_start:
	mov rax, 0
	mov rdi, 0
	lea rsi, [buffer]
	mov rdx, 1024
	syscall
	call ft_strlen
	mov rax, 60
	xor rdi, rdi
	syscall

ft_strlen:
	xor rax, rax
.loop:
	cmp byte [rsi + rax], 0
	je .end
	inc rax
	jmp .loop
.end:
	mov rax, 1
	mov rdi, 1
	mov rax, rdi
	syscall
	ret

