global	ft_strdup
extern	ft_strlen
extern	ft_strcpy
extern	malloc
extern __errno_location

ft_strdup:

	call ft_strlen
	inc	rax ; +1 for \0
	
	push rdi ; push *s on stack to use later
	mov rdi, rax ; str length as 1st arg for malloc

	call malloc wrt ..plt ; call malloc with procedure linkage table

	cmp rax, 0 ; verif if rax == NULL
	je error ; if true -> error

	mov rdi, rax ; put pointeur char *src
	pop rsi ; put *s in rsi to call strcpy
	call ft_strcpy
	ret

error:
	mov r8, rax ; rax contains write return value, we put it aside bc
				; __erno location (its pointeur) will be put in rax
	neg r8

	call __errno_location wrt ..plt
	; means : vall __errno_location with reference to the Procedure linkage table
	; useful to avoid recompilation if a library changes -> dynamic linking

	mov [rax], r8 ; store error code in errno
				  ; [] specifies to store it in the addr stored in rax
	mov rax, -1 ; return value = -1
	ret
