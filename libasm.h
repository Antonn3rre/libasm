#ifndef LIBASM_H
#define LIBASM_H

#include "errno.h"
#include "stdio.h"

size_t ft_strlen(char *);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

// BONUS

typedef struct s_list {
  void *data;
  struct s_list *next;
} t_list;

int ft_atoi_base(char *str, char *base);
int ft_list_size(t_list *lst);
void ft_list_push_front(t_list **, t_list *);

#endif // !LIBASM_H
