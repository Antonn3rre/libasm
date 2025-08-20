#include "stdio.h"
#include "errno.h"

int ft_strlen( char * );
char *ft_strcpy(char *, char *);
int	ft_strcmp(char *, char *);
ssize_t ft_write(int fd, const void *buf, size_t count);

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

// ft_write
	printf("\nTest erreur (fd invalide):\n");
    errno = 0; // reset
    long int ret = ft_write(42, "Hello\n", 6);
    printf("ret = %zd, errno = %d\n", ret, errno);
    perror("perror");

	printf("\nTest erreur (str NULL):\n");
    errno = 0; // reset
   	ret = ft_write(1, NULL, 6);
    printf("ret = %zd, errno = %d\n", ret, errno);
    perror("perror");

	printf("\nTest ok:\n");
    errno = 0; // reset
   	ret = ft_write(1, "Test\n", 5);
    printf("ret = %zd, errno = %d\n", ret, errno);
    perror("perror");
	return (0);
}
