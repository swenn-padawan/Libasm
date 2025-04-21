#include <stdlib.h>
#include <stdio.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *a, char *b);
char	*ft_strdup(char *s);

int main(int argc, char **argv, char **envp){
	/*
	printf("len of 123456789 is : %lu\n", ft_strlen("123456789"));

	char	buffer[10] = {0};

	ft_strcpy(buffer, "123456789");

	printf("buffer = [%s], len = %lu\n", buffer, ft_strlen(buffer));

	printf("strcmp between 123456789 et 123456789 = %d\n", ft_strcmp("123456789", "123456789"));
	printf("strcmp between 123456789 et 123456789 = %d\n", ft_strcmp("12345678", "123456789"));
	printf("strcmp between 123456789 et 123456789 = %d\n", ft_strcmp("123456789", "12345678"));
*/
	char	*test = ft_strdup("ahaha la sigsegv :)\n");

	printf("%s", test);
	free(test);
}
