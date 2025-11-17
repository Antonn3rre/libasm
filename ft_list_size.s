global ft_list_size

;typedef struct s_list {
;	void *data;   -> 8 octets
;	struct s_list *next; -> 8 octets
;} t_list;

; int ft_list_size(t_list *begin_list)

section .text
ft_list_size:

; rdi t_list *begin_list
	mov rcx, 0 ; init counter
	loop_list:
		cmp rdi, 0 ; if end of list -> end
		je end_loop

		;mov rax, [rdi] ;  to access list data

		mov rdi, [rdi + 8] ; skip to the next node
		inc rcx
		jmp loop_list
	end_loop:
		mov rax, rcx ; length to rax (return register)
		ret
