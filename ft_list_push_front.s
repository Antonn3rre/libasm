global ft_list_push_front

;typedef struct s_list {
;	void *data;   -> 8 octets
;	struct s_list *next; -> 8 octets
;} t_list;

section .text
ft_list_push_front:

	cmp rdi, 0
	je return
	cmp rsi, 0
	je return

; rdi t_list **lst -> adress of first node
; rsi t_list *new
	
	mov rax, [rdi] ; rax = *lst (previous head)
	mov [rsi + 8], rax ; new->next = previous head
	mov [rdi], rsi ; *lst = new

return :
	ret
