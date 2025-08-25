global ft_read
extern __errno_location

section .text
ft_read:
	mov rax, 0 ; syscall 0 pour read
	syscall
	test rax, rax
	js error ; jump if carry flag is set

	; return value of read already in rax
	ret

error:
	mov r8, rax ; rax contient le retour de write, on le met de cote car
				; __erno location (son pointeur) sera stocke dans rax
	neg r8
	call __errno_location wrt ..plt

	mov [rax], r8 ; on stocke le code erreur dans errno [] specifie de le stocker dans l'addr stockee dans rax
	mov rax, -1
	ret
