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
		size_t	size = rand() % MAX_SIZE;
		str = malloc(size * sizeof(char) + 1);
		if (!str){
			printf("%sSomething went wrong when executing malloc\n%s", RED, RESET);
			return (false);
		}
		int bytes = read(fd, str, size);
		if (bytes == -1){
			printf("%sSomething went wrong when executing read\n%s", RED, RESET);
			free(str);
			return (false);
		}
		str[size] = '\0';
		if (ft_strlen(str) == strlen(str))
			TEST_OK("strlen: test[%d], len: %zu", i, size);
		else
			TEST_KO("strlen: test[%d], len: %zu", i, size);
		free(str);
		str = NULL;
	}
	close(fd);
	return (true);
}

bool	libtest_strcmp(void)
{
	char	*first;
	char	*second;
	size_t	size_f;
	size_t	size_s;

	for (int i = 0; i < MAX_TESTS / 2; i++){
		size_s = rand() % MAX_SIZE;
		size_f = rand() % MAX_SIZE;
		first = generate_string(size_f);
		second = generate_string(size_s);
		if (ft_strcmp(first, second) == strcmp(first, second))
			TEST_OK("strcmp: test[%d], first_len: %zu | second_len: %zu", i, size_f, size_s);
		else
			TEST_KO("strcmp: test[%d], first_len: %zu | second_len: %zu", i, size_f, size_s);
	}
	//TODO: Beautiful print: https://en.wikipedia.org/wiki/Box-drawing_characters 

	for (int i = 0; i < MAX_TESTS / 2; i++){
		size_s = rand() % MAX_SIZE;
		first = generate_string(size_s);
		second = generate_string(size_s);
		if (ft_strcmp(first, second) == strcmp(first, second))
			TEST_OK("strcmp: test[%d], len: %zu", i, size_s);
		else
			TEST_OK("strcmp: test[%d], len: %zu", i, size_s);
	}
	return true;
}


int	main(){
	if (libtest_strlen() == false)
		return (1);
	if (libtest_strcmp() == false)
		return (1);

}
