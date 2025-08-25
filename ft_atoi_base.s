global ft_atoi_base

section .rodata
    INVALID_CHARS: db "+- ", 9, 10, 11, 12 ,13, 0 ; oblige de mettre la valeur ascii, marchait pas sans
    WHITESPACE: db " ", 9, 10, 11, 12 ,13, 0 ; oblige de mettre la valeur ascii, marchait pas sans

section .text
ft_atoi_base:

; rdi = str a convertir en int
; rsi = base de rdi

	mov rcx, 0 ; compteur a 0
	call check_base
	cmp rax, 0
	je return

conversion:

	mov rcx, 0
;	call .skip_whitespace

	; skip whitespace
	; skip sign (and store 1 or -1)

	; loop str, each time check if in base
	; num = num * size(base) + x    ; x found if (c == base[x]) return x

	mov rax, 1 ; to delete,

return:
	ret



;.skip_whitespace:
;	lea r8, [rel WHITESPACE]
;	
;	mov rax, 1
;	mov rdx, 0 ; 2e compteur pour inc WHITESPACE
;	whitespace_loop:
;		cmp [r8 + rdx], 0
;		ret
;		cmp [r8 + rdx]
		


; Check base (small, duplicate, invalid char)

check_base:
	cmp byte [rsi + rcx], 0
	je end_check_base

	lea r8, [rel INVALID_CHARS]
	mov rdx, 0 ; 2e compteur
	; Check for duplicate
	loop:
		cmp rdx, rcx
		je invalid_loop
		mov al, [rsi + rcx] ; Deplace dans un registre car on ne peut pas comparer 2 addr memoires
		cmp al, [rsi + rdx]
		je error_base
		
		inc rdx
		jmp loop

	; check for invalid char
	invalid_loop:
		mov rdx, 0
		loop_char :
			cmp byte [r8 + rdx], 0
			je end_loop
			cmp   al, [r8 + rdx]
   			je    error_base
    		inc   rdx
   			jmp  loop_char

	end_loop:
		inc rcx
		jmp check_base

; check for base size
end_check_base:
	cmp rcx, 2
	jl error_base ; (jump if less) rcx < 2
	mov rax, 1
	ret

error_base:
	mov rax, 0 ; return 0 if error
	ret
