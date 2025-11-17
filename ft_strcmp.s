global ft_strcmp

; rdi = s1
; rsi = s2

; al : 8 bits (1 byte) register
; eax, ebx: 32 bits registers, used for arithmetics

; movzx : MOve with zero extend

section .text
ft_strcmp:
	mov rcx, 0 ; init counter
	mov rax, 0 ;
	loop_debut:
		mov al, [rdi + rcx] ; store s1[i] in register (to cmp)
		mov bl, [rsi + rcx] ; store s2[i] in register (to cmp)

		cmp al, 0 ; if s1[i] = 0
		jz end
		cmp bl, 0 ; if s2[i] = 0
		jz end

		cmp al, bl ; cmp s1[i] & s2[i]
		jne end  ; if cmp false -> different -> end

		inc rcx ; else increment counter
		jmp loop_debut ; and jump back to loop_debut
	end:
		movzx eax, al ; move s1[i]
		movzx ebx, bl ; move s2[i]
		sub eax, ebx ; s1[i] - s2[i] -> result stored in rax
		ret;
