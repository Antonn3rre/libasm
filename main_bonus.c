#include "fcntl.h"
#include "libasm.h"
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main() {

  // ft_strlen
  printf("\n\n--- Test ft_strlen ---\n\n");
  printf("[REAL] Longueur : %lu\n", strlen("C'est un test"));
  printf("[MINE] Longueur : %lu\n", ft_strlen("C'est un test"));
  printf("[REAL] Longueur : %lu\n", strlen(""));
  printf("[MINE] Longueur : %lu\n", ft_strlen(""));

  // ft_strcpy
  printf("\n\n--- Test ft_strcpy ---\n\n");
  char dest[10];
  char src[] = "Bonjour";

  char *pt = ft_strcpy(dest, src);
  printf("src = %s et dest = %s et pt = %s\n", src, dest, pt);

  // ft_strcmp

  printf("\n\n--- Test ft_strcmp ---\n\n");
  char s1[] = "Bonjour";
  char s2[] = "Bofjour";
  printf("[REAL] Diff \"Bonjour\" et \"Bofjour\" = %d\n", strcmp(s1, s2));
  printf("[MINE] Diff \"Bonjour\" et \"Bofjour\" = %d\n", ft_strcmp(s1, s2));
  printf("[REAL] Diff \"Bonjour\" et \"Bonjour\" = %d\n", strcmp(s1, s1));
  printf("[MINE] Diff \"Bonjour\" et \"Bonjour\" = %d\n", ft_strcmp(s1, s1));
  printf("[REAL] Diff \"Bonjour\" et \"Bon\" = %d\n", strcmp(s1, "Bon"));
  printf("[MINE] Diff \"Bonjour\" et \"Bon\" = %d\n", ft_strcmp(s1, "Bon"));

  // ft_write
  printf("\n\n--- Test ft_write ---\n\n");

  printf("\nError Test (invalid fd):\n");
  errno = 0; // reset
  long int ret = write(42, "Hello\n", 6);
  printf("[REAL] ret = %zd, errno = %d\n", ret, errno);
  perror("perror");

  errno = 0; // reset
  ret = ft_write(42, "Hello\n", 6);
  printf("[MINE] ret = %zd, errno = %d\n", ret, errno);
  perror("perror");

  // DELETE ?
  printf("\nError Test (NULL str):\n");
  printf("[REAL] Does not compile with NULL str\n");

  errno = 0; // reset
  ret = ft_write(1, NULL, 6);
  printf("[MINE] ret = %zd, errno = %d\n", ret, errno);
  perror("perror");

  printf("\nTest STDOUT:\n");
  errno = 0; // reset
  ret = write(1, "Test\n", 5);
  printf("[REAL] ret = %zd, errno = %d\n", ret, errno);
  perror("perror");

  errno = 0; // reset
  ret = ft_write(1, "Test\n", 5);
  printf("[MINE] ret = %zd, errno = %d\n", ret, errno);
  perror("perror");

  // ft_read
  char buf[1000];
  printf("\n\n--- Test ft_read ---\n\n");

  int fd = open("test.txt", O_RDONLY);
  if (fd < 0) {
    printf("Erreur open fd");
    return (-1);
  }
  ret = ft_read(fd, buf, 10);
  if (ret)
    buf[ret] = 0;
  printf("Read 10 char dans un fichier de +10 : \nBuf = %s\nRet = %ld\n", buf,
         ret);

  close(fd);
  fd = open("test.txt", O_RDONLY);
  if (fd < 0) {
    printf("Erreur open fd");
    return (-1);
  }

  ret = ft_read(fd, buf, 100);
  if (ret)
    buf[ret] = 0;
  printf("Read 100 char dans un fichier de -100 : \nBuf = %s\nRet = %ld\n", buf,
         ret);

  printf("READ: fd invalide\n");
  errno = 0; // reset
  ret = ft_read(5, buf, 100);
  if (ret)
    buf[ret] = 0;
  printf("Buf = %s\nRet = %ld, errno = %d\n", buf, ret, errno);

  // ft_strdup
  printf("\n\n--- ft_strdup ---\n\n");

  char *s = strdup("Test de strdup");
  if (!s)
    printf("[REAL] Error, errno = %d\n", errno);
  else {
    printf("[REAL] Sucess, str = %s\n", s);
    free(s);
  }

  s = ft_strdup("Test de strdup");
  if (!s)
    printf("[MINE] Error, errno = %d\n", errno);
  else {
    printf("[MINE] Sucess, str = %s\n", s);
    free(s);
  }

  s = strdup("");
  if (!s)
    printf("[REAL] Error, errno = %d\n", errno);
  else {
    printf("[REAL] Sucess, str = %s\n", s);
    free(s);
  }
  s = ft_strdup("");
  if (!s)
    printf("[MINE] Error, errno = %d\n", errno);
  else {
    printf("[MINE] Sucess, str = %s\n", s);
    free(s);
  }

  // BONUS

  printf("\n\n--- ft_atoi_base ---\n\n");
  printf("Small base = %d\n", ft_atoi_base("1234", "0"));
  printf("Empty base = %d\n", ft_atoi_base("1234", ""));
  printf("Duplicate in base = %d\n", ft_atoi_base("1234", "01234567089"));
  printf("Minus in base = %d\n", ft_atoi_base("1234", "01234567-89"));
  printf("Plus in base = %d\n", ft_atoi_base("1234", "0123456789+"));
  printf("Space in base = %d\n", ft_atoi_base("1234", "01234 56789"));
  printf("Whitespace in base = %d\n", ft_atoi_base("1234", "01234\t56789"));
  printf("All whitespace in str = %d\n", ft_atoi_base("\t\n ", "0123456789"));
  printf("1234 base 10 = %d\n", ft_atoi_base("  -+--12", "0123456789"));

  return (0);
}
