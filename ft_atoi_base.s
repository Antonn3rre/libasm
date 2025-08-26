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
	push rax ; put aside the base size

conversion:

	mov rcx, 0
	call skip_whitespace
	cmp rax, 0
	je return_pop

	call skip_sign
	cmp rax, 0
	je return_pop

	pop rbx ; get the base size back
	push rax ; put aside 1 ou -1 pour le signe

	call convert_str
	; loop str, each time check if in base
	; num = num * size(base) + x    ; x found if (c == base[x]) return x

	pop rdx
	imul rax, rdx

return:
	ret

return_pop:
	pop rbx
	ret

; actual conversion
; rdi: str
; rcx: counter (at the first char)
; rbx: base size
convert_str:
	mov rax, 0 ; to store the converted number
	mov r9, 0

	navigate_str:
		cmp byte [rdi + rcx], 0
		je convert_str_done ; return if end of str

		mov rdx, 0 ; 2nd counter to navigate the base
		mov r9b, [rdi + rcx]
		navigate_loop:
			cmp	byte [rsi + rdx], 0
			je convert_str_done ; return if char not in base
			cmp r9b, [rsi + rdx]
			je in_base
			inc rdx
			jmp navigate_loop

		in_base:
			;	rax = rax * size_base + rdx
			imul rax, rbx
			add rax, rdx
			inc rcx
			jmp navigate_str
		
		convert_str_done:
			ret

; skip sign
; rdi: str
; rcx: str counter (already passed through the withespace)
skip_sign:
	mov al, 0 ; to store the sign
	sign_loop:
		cmp byte [rdi + rcx], 0
		je error_base ; return error if already at the end of str

		; + ASCII 43
		; - ASCII 45
		cmp byte [rdi + rcx], 43
		je plus_sign
		cmp byte [rdi + rcx], 45
		je minus_sign
		jmp end_sign
	
	plus_sign:
		inc al
		inc rcx
		jmp sign_loop
	minus_sign:
		dec al
		inc rcx
		jmp sign_loop
	end_sign:
		cmp al, 0
		jl minus
		mov rax, 1
		ret
	minus:
		mov rax, -1
		ret

; Skip withespace at the beginnning of str
; rdi : str
; rcx : str counter (0 at the beginning)
skip_whitespace:
	lea r8, [rel WHITESPACE]
	
	mov rax, 1
	str_loop:
		cmp byte [rdi + rcx], 0
		je error_base ; return error if already at the end of str

		mov rdx, 0 ; 2e compteur pour inc WHITESPACE
		mov al, [rdi + rcx]
		whitespace_loop:
			cmp byte [r8 + rdx], 0
			je not_a_whitespace
			cmp al, [r8 + rdx]
			je next_char
			inc rdx
			jmp whitespace_loop
		next_char:
			inc rcx
			jmp str_loop
	not_a_whitespace:
		ret


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
	mov rax, rcx
	ret

error_base:
	mov rax, 0 ; return 0 if error
	ret
