NAME = libasm

NAME_LIB = libasm.a

SRCS = ft_strcmp.s \
	   ft_strcpy.s \
	   ft_strlen.s \
	   ft_write.s

OBJS = $(SRCS:.s=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(NAME_LIB)
	echo "Commande NAME"
	$(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

NASM = nasm

NASMFLAGS = -f elf64

%.o: %.s
	echo "Commande .o .s"
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME_LIB): $(OBJS)
	echo "Commande LIB"
	ar rcs $(NAME_LIB) $(OBJS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) $(NAME_LIB)

re: fclean all

.PHONY: all clean fclean re
