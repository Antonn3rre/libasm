global	ft_strdup
extern	ft_strlen
extern	ft_strcpy
extern	malloc
extern __errno_location

ft_strdup:

	call ft_strlen
	inc	rax ; +1 pour \0
	
	push rdi ; push *s sur stack pour utiliser + tard
	mov rdi, rax ; met la longueur en 1er arg pour malloc

	call malloc wrt ..plt

	cmp rax, 0 ; verif si rax == NULL
	je error ; si oui envoyer a error

	mov rdi, rax ; met pointeur char *src
	pop rsi ; met *s dans rsi pour appel strcpy
	call ft_strcpy
	ret

error:
	mov r8, rax ; rax contient le retour de malloc, on le met de cote car
				; __erno location (son pointeur) sera stocke dans rax
	neg r8
	call __errno_location wrt ..plt
	mov [rax], r8 ; on stocke le code erreur dans errno [] specifie de le stocker dans l'addr stockee dans rax
	mov rax, 0
	ret
