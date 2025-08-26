NAME = libasm

NAME_LIB = libasm.a
BONUS_NAME_LIB = libasm.a

SRCS = ft_strcmp.s \
	   ft_strcpy.s \
	   ft_strlen.s \
	   ft_write.s \
	   ft_read.s \
	   ft_strdup.s

OBJS = $(SRCS:.s=.o)

BONUS_SRCS = ft_atoi_base.s

BONUS_OBJS = $(BONUS_SRCS:.s=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g3

all: $(NAME)

$(NAME): $(NAME_LIB)
	$(CC) $(CFLAGS) main.c $(NAME_LIB) -o $(NAME)

bonus: $(BONUS_NAME_LIB)
	$(CC) $(CFLAGS) main_bonus.c $(BONUS_NAME_LIB) -o $(NAME)
	
NASM = nasm

NASMFLAGS = -f elf64

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME_LIB): $(OBJS)
	ar rcs $(NAME_LIB) $(OBJS)

$(BONUS_NAME_LIB): $(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME_LIB) $(OBJS) $(BONUS_OBJS)

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME) $(NAME_LIB) $(BONUS_NAME_LIB)

re: fclean all

.PHONY: all clean fclean re
