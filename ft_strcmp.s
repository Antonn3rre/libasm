global ft_strcmp

section .text
ft_strcmp:
	mov rcx, 0;
	mov rax, 0;
	loop_debut:
		mov al, [rdi + rcx] ; registre qui stocke 1 octet
		mov bl, [rsi + rcx]

		cmp al, 0
		jz end
		cmp bl, 0
		jz end

		cmp al, bl
		jne end  ; si cmp faux -> si differents

		inc rcx
		jmp loop_debut
	end:
		movzx eax, al  ; registre utilise pour arithmetique
		movzx ebx, bl
		sub eax, ebx
		ret;
