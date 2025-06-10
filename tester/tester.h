#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <stdbool.h>
#include <fcntl.h>
#include <time.h>

#define MAX_TESTS 100
#define MAX_SIZE 100

# define	BOLD(X)				"\033[1m" X "\033[22m"
# define 	ITALIC(X)			"\033[3m" X "\033[23m"
# define	RESET				"\033[0m"
# define	RED					"\033[31m"
# define	GREEN				"\033[32m"
# define	YELLOW				"\033[33m"
# define	BLUE				"\033[34m"
# define	MAGENTA				"\033[35m"
# define	CYAN				"\033[36m"
# define	GRAY				"\033[90m"
# define 	COLOR(C, X)			C X RESET

# define _PRINT_FORMAT(c, t, msg, ...)	printf(BOLD(COLOR(c,"%8s")) " > " msg "\n", t, ##__VA_ARGS__)
# define TEST_OK(msg, ...)			_PRINT_FORMAT(GREEN,	    "OK:", msg, ##__VA_ARGS__)
# define TEST_KO(msg, ...)			_PRINT_FORMAT(RED,	    "KO:", msg, ##__VA_ARGS__)

/*--------libasm functions--------*/

size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dst, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

/*--------tester functions--------*/
char	*generate_string(size_t size);
