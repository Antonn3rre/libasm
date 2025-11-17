global ft_strcpy

; rdi = dest
; rsi = src

section .text
ft_strcpy:
	mov rcx, 0 ; init counter
	loop_debut:
		mov al, byte [rsi + rcx] ; store src[i] value in tmp register
		mov [rdi + rcx], al ; store src[i] value (in al) in dest[i]
		cmp byte [rsi + rcx], 0 ; if enf of string, stop
		je end
		inc rcx ; else increment counter
		jmp loop_debut ; and jump back to loop_debut
	end:
		mov rax, rdi ; return value = dest
		ret ;
