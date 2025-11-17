global ft_strlen

section .text
ft_strlen:
	mov rcx, 0 ; counter to 0
	loop_debut:
		cmp byte [rdi + rcx], 0 ; compare str + i to 0
		je end ; if (str[i] == 0) -> jump to end
		inc rcx ; else increment counter
		jmp loop_debut ; and jump back to loop_debut
	end:
		mov rax, rcx ; move size (in rcx) to return register (rax)
		ret ; return
