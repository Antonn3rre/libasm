global ft_write
extern __errno_location

section .text
ft_write:
	clc ;  clear carry flag
	mov rax, 1 ; syscall 1 pour write
	syscall
	jc error ; jump if carry flag is set

	mov rax, rdx
	ret

error:
	mov r8, rax ; rax contient le retour de write, on le met de cote car
				; __erno location (son pointeur) sera stocke dans rax
	neg r8

	call __errno_location wrt ..plt

	mov [rax], r8 ; on stocke le code erreur dans errno [] specifie de le stocker dans l'addr stockee dans rax
	mov rax, -1
	ret

; rdi = fd
; rsi = buf
; rdx  = count
