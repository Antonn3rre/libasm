global ft_strlen

section .text
ft_strlen:
	mov rcx, 0;
	loop_debut:
		cmp byte [rdi + rcx], 0
		je end
		inc rcx
		jmp loop_debut
	end:
		mov rax, rcx;
		ret;
