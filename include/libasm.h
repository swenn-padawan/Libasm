#ifndef LIBASM_H
# define LIBASM_H

# include <stdlib.h>
# include <stdio.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *a, char *b);
char	*ft_strdup(char *s);
size_t	ft_read(int fd, char *buffer, size_t len);

#endif
