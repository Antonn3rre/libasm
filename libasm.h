#ifndef LIBASM_H
#define LIBASM_H

#include "errno.h"
#include "stdio.h"

int ft_strlen(char *);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);

#endif // !LIBASM_H
