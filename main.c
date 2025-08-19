#include "stdio.h"

int ft_strlen( char * );
char *ft_strcpy(char *, char *);

int main() {
//	printf("Longueur : %d\n", ft_strlen("C'est un test"));

	char dest[10];
	char src[] = "Bonjour";

	char *pt = ft_strcpy(dest, src);
	printf("src = %s et dest = %s et pt = %s\n", src, dest, pt);

	return (0);
}
