#include "tester.h"

#define ASCII_TABLE "01234567890!@#$%^&*()_+-=abcdefhgijklmnopqrstuvwxyzABCDEFHIJKLMNOPQRSTUVWXYZ"

char	*generate_string(size_t size){
	char	*str;

	str = malloc(size * sizeof(char));
	if (!str) return NULL;
	for (size_t i = 0; i < size; i++){
		str[i] = ASCII_TABLE[rand() % sizeof(ASCII_TABLE)];
	}
	return (str);
}
