global ft_strcpy

section .text
ft_strcpy:
	mov rcx, 0; init compteur
	loop_debut:
		mov al, byte [rsi + rcx] ; oblige de passer par un registre tmp
		mov [rdi + rcx], al
		cmp byte [rsi + rcx], 0 ; si fini on arrete
		je end
		inc rcx ; sinon on inc le compteur
		jmp loop_debut
	end:
		mov rax, rdi;
		ret;
