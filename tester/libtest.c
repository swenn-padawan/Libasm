#include "tester.h"

bool	libtest_strlen(void)
{
	int fd = open("/dev/urandom", O_RDONLY);
	char	*str = NULL;
	if (fd == -1){
		printf("%sSomething went wrong when opening /dev/urandom\n%s", RED, RESET);
		return (false);
	}
	srand(time(NULL));
	for (int i = 0; i < MAX_TESTS; i++){
		size_t	size = rand() % 1000;
		str = malloc(size * sizeof(char) + 1);
		if (!str){
			printf("%sSomething went wrong when executing malloc\n%s", RED, RESET);
			return (false);
		}
		int bytes = read(fd, str, size);
		if (bytes == -1){
			printf("%sSomething went wrong when executing read\n%s", RED, RESET);
			return (false);
		}
		str[size] = '\0';
		if (ft_strlen(str) == strlen(str))
			TEST_OK("strlen: test[%d], len: %zu", i, size);
		else
			TEST_KO("strlen: test[%d], len: %zu", i, size);
		free(str);
	}
	close(fd);
	return (true);
}

int	main(){
	if (libtest_strlen() == false)
		return (1);

}
