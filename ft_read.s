global ft_read
extern __errno_location

section .text
ft_read:
	mov rax, 0 ; syscall 0 for read
	syscall
	test rax, rax ; -> update flags, if rax == 0 -> zero flag = 1 , rax < 0 -> sign flag = 1, rax > 0 -> nothing
	js error ; jump if carry flag is set

	; return value of read already in rax
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
