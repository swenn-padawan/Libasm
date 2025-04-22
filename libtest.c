#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dst, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

#define GREEN   "\x1b[32m"
#define RED     "\x1b[31m"
#define RESET   "\x1b[0m"
#define BOLD    "\x1b[1m"

int tests_total = 0;
int tests_passed = 0;

void print_result(int ok, const char *msg)
{
    tests_total++;
    if (ok)
    {
        tests_passed++;
        printf(GREEN "✅  %s\n" RESET, msg);
    }
    else
        printf(RED "❌  %s\n" RESET, msg);
}

void test_strlen(void)
{
    printf(BOLD "\n=== ft_strlen ===\n" RESET);
    const char *cases[] = {"", "a", "hello", "0123456789", NULL};
    for (int i = 0; cases[i]; i++)
    {
        size_t mine = ft_strlen(cases[i]);
        size_t real = strlen(cases[i]);
        char msg[256];
        snprintf(msg, sizeof(msg), "ft_strlen(\"%s\") = %zu | expected = %zu", cases[i], mine, real);
        print_result(mine == real, msg);
    }
}

void test_strcpy(void)
{
    printf(BOLD "\n=== ft_strcpy ===\n" RESET);
    const char *srcs[] = {"", "abc", "hello world", NULL};
    char dest[100];
    for (int i = 0; srcs[i]; i++)
    {
        memset(dest, 0xCC, sizeof(dest));
        char *res = ft_strcpy(dest, srcs[i]);
        char msg[256];
        snprintf(msg, sizeof(msg), "ft_strcpy(\"%s\") = \"%s\"", srcs[i], res);
        print_result(strcmp(res, srcs[i]) == 0, msg);
    }
}

void test_strcmp(void)
{
    printf(BOLD "\n=== ft_strcmp ===\n" RESET);
    struct { const char *a, *b; } cases[] = {
        {"", ""}, {"a", "a"}, {"abc", "abc"}, {"abc", "abd"}, {"abc", ""}, {"", "abc"}, {NULL, NULL}
    };
    for (int i = 0; cases[i].a; i++)
    {
        int mine = ft_strcmp(cases[i].a, cases[i].b);
        int real = strcmp(cases[i].a, cases[i].b);
        char msg[256];
        snprintf(msg, sizeof(msg), "ft_strcmp(\"%s\", \"%s\") = %d | expected = %d", cases[i].a, cases[i].b, mine, real);
        print_result((mine == 0 && real == 0) || (mine * real > 0), msg);
    }
}

/*void test_write(void)
{
    printf(BOLD "\n=== ft_write ===\n" RESET);
    errno = 0;
    ssize_t ret = ft_write(1, "ft_write: hello world!\n", 23);
    print_result(ret == 23, "ft_write stdout (23 bytes)");

    errno = 0;
    ret = ft_write(-1, "fail", 4);
    print_result(ret == -1 && errno != 0, "ft_write with bad fd");
}
*/
void test_read(void)
{
    printf(BOLD "\n=== ft_read ===\n" RESET);
    char buf[64];
    ssize_t ret;

    printf("Type \"test\" and hit enter: ");
    fflush(stdout);
    errno = 0;
    ret = ft_read(0, buf, 63);
    if (ret >= 0)
        buf[ret] = 0;

    print_result(ret > 0, "ft_read from stdin");

    errno = 0;
    ret = ft_read(-1, buf, 10);
    print_result(ret == -1 && errno != 0, "ft_read with bad fd");
}

void test_strdup(void)
{
    printf(BOLD "\n=== ft_strdup ===\n" RESET);
    const char *srcs[] = {"", "abc", "duplication!", NULL};
    for (int i = 0; srcs[i]; i++)
    {
        char *dup = ft_strdup(srcs[i]);
        char msg[256];
        snprintf(msg, sizeof(msg), "ft_strdup(\"%s\") = \"%s\"", srcs[i], dup);
        int ok = dup && strcmp(dup, srcs[i]) == 0;
        print_result(ok, msg);
        free(dup);
    }
}

int main(void)
{
    test_strlen();
    test_strcpy();
    test_strcmp();
  //  test_write();
test_read();
    test_strdup();

    printf(BOLD "\n=== Résultat final ===\n" RESET);
    printf("%s%d/%d tests passés%s\n",
           (tests_passed == tests_total ? GREEN : RED),
           tests_passed, tests_total, RESET);
    return 0;
}
