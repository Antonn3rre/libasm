global ft_list_size

;typedef struct s_list {
;	void *data;   -> 8 octets
;	struct s_list *next; -> 8 octets
;} t_list;

section .text
ft_list_size:

; rdi t_list *lst
	mov rcx, 0
	loop_list:
		cmp rdi, 0
		je end_loop

		;mov rax, [rdi] ;  pour acceder a data

		mov rdi, [rdi + 8] ; skip to the next node
		inc rcx
		jmp loop_list
	end_loop:
		mov rax, rcx
		ret
