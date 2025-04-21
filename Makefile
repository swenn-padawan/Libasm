#------------------------------------------------------------------------------#
#																			   #
#------------------------------------------------------------------------------#

NAME		:=	libasm.a

NASM		:=	nasm -f

NASMFLAGS	:=	elf64

SRCS_DIR	:=	srcs

OBJS_DIR	:=	.build

SRCS		:=	strlen.s	\
				strcpy.s 	\
				strcmp.s 	\
				strdup.s	\

SRCS		:=	$(addprefix $(SRCS_DIR)/, $(SRCS))

OBJS		:=	$(addprefix $(OBJS_DIR)/, $(SRCS:%.s=%.o))

DIR_UP		=	mkdir -p $(@D)

RM			:=	rm -rf

#------------------------------------------------------------------------------#

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $^

$(OBJS_DIR)/%.o: %.s
	@$(DIR_UP)
	@$(NASM) $(NASMFLAGS) $^ -o $@

clean:
	@$(RM) $(OBJS_DIR)

fclean: clean
	@$(RM) $(NAME)

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

