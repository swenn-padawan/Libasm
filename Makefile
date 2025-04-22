#------------------------------------------------------------------------------#
#																			   #
#------------------------------------------------------------------------------#

LIBNAME		:=	libasm.a

NASM		:=	nasm -f

NASMFLAGS	:=	elf64

SRCS_DIR	:=	srcs

OBJS_DIR	:=	.build

SRCS		:=	ft_strlen.s		\
				ft_strcpy.s 	\
				ft_strcmp.s 	\
				ft_strdup.s		\
				ft_read.s 		\
				ft_write.s 		\


SRCS		:=	$(addprefix $(SRCS_DIR)/, $(SRCS))

OBJS		:=	$(addprefix $(OBJS_DIR)/, $(SRCS:%.s=%.o))

DIR_UP		=	mkdir -p $(@D)

RM			:=	rm -rf

#------------------------------------------------------------------------------#

BONUS_DIR	:= $(SRCS_DIR)/bonus

SRCS_BONUS	:=	ft_list_push_front.s	\

SRCS_BONUS	:=	$(addprefix $(BONUS_DIR)/, $(SRCS_BONUS))

OBJS_BONUS	:=	$(addprefix $(OBJS_DIR)/, $(SRCS_BONUS:%.s=%.o))


#------------------------------------------------------------------------------#

CC			:= cc

NAME		:= libtester

TEST_SRC	:= libtest.c \

TEST_OBJS	:= $(addprefix $(OBJS_DIR),/ $(TEST_SRCS:%.o=%.s))

CFLAGS		:= -Wall -Werror -Wextra -lbsd

IFLAGS		:= -I ./include

#------------------------------------------------------------------------------#

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	@ar rc $(LIBNAME) $^
	@echo " $(GREEN)$(BOLD)$(ITALIC)■$(RESET)  building	$(GREEN)$(BOLD)$(ITALIC)$(LIBNAME)$(RESET)"

bonus: $(OBJS) $(OBJS_BONUS)
	@ar rc $(LIBNAME) $^

$(OBJS_DIR)/%.o: %.s
	@$(DIR_UP)
	@$(NASM) $(NASMFLAGS) $^ -o $@
	@echo " $(CYAN)$(BOLD)$(ITALIC)■$(RESET)  compiling	$(GRAY)$(BOLD)$(ITALIC)$<$(RESET)"

tester: all bonus
	@$(CC) $(CFLAGS) $(IFLAGS) $(TEST_SRC) $(LIBNAME) -o $(NAME)
	@echo " $(CYAN)$(BOLD)$(ITALIC)■$(RESET)  compiling	$(GRAY)$(BOLD)$(ITALIC)$(NAME)$(RESET)"

clean:
	@$(RM) $(OBJS_DIR)
	@echo " $(RED)$(BOLD)$(ITALIC)■$(RESET)  cleaned	$(RED)$(BOLD)$(ITALIC)$(OBJS_DIR)$(RESET)"

fclean: clean
	@$(RM) $(LIBNAME)
	@$(RM) $(NAME)
	@echo " $(RED)$(BOLD)$(ITALIC)■$(RESET)  cleaned	$(RED)$(BOLD)$(ITALIC)$(LIBNAME)$(RESET)"

re: fclean all

#------------------------------------------------------------------------------#

BLACK		=	\033[30m
RED			=	\033[31m
GREEN		=	\033[32m
YELLOW		=	\033[33m
BLUE		=	\033[34m
MAGENTA		=	\033[35m
CYAN		=	\033[36m
WHITE		=	\033[37m
GRAY		=	\033[90m

BOLD		=	\033[1m
ITALIC		=	\033[3m

RESET		=	\033[0m
LINE_CLR	=	\33[2K\r

