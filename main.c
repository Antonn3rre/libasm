#include "stdio.h"

int ft_strlen( char * );
char *ft_strcpy(char *, char *);
int	ft_strcmp(char *, char *);

int main() {

// ft_strlen
	printf("Longueur : %d\n", ft_strlen("C'est un test"));

// ft_strcpy
	char dest[10];
	char src[] = "Bonjour";

	char *pt = ft_strcpy(dest, src);
	printf("src = %s et dest = %s et pt = %s\n", src, dest, pt);

// ft_strcmp

	char s1[] = "Bonjour";
	char s2[] = "Bomjour";
	printf("Diff s1 et s2 = %d\n", ft_strcmp(s1, s2));
	printf("Diff s1 et s1 = %d\n", ft_strcmp(s1, s1));

	return (0);
}
