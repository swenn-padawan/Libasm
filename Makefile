# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stetrel <stetrel@42angouleme.fr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/24 11:00:14 by stetrel           #+#    #+#              #
#    Updated: 2024/12/24 11:22:37 by stetrel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:= ft_strlen

SRC		:= ft_strlen_asm.s

OBJ		:= ft_strlen.o

CC		:= nasm

FLAGS	:= -f elf64 -g -F dwarf

LINK	:= ld -o

MAKEFLAGS	+= --no-print-directory

#RULES
all: $(NAME)

$(NAME): $(OBJ)
	@$(LINK) $(NAME) $(OBJ)
	@echo "$(GREEN)$(NAME) Compiled"

$(OBJ): $(SRC)
	@$(CC) $(FLAGS) $(SRC) -o $(OBJ)

clean:
	@$(RM) $(OBJ)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re

#COLORS
GREEN = \033[30;45m

