CC = gcc

SRCS_FILES = main.c pkdx_reading.c db_manipulation.c img.c

SRCS_PATH := 42_pkdx

OBJS_PATH := objs

SRCS	=	$(addprefix $(SRCS_PATH)/, $(SRCS_FILES))

OBJS_FILES = $(SRCS_FILES:%.c=%.o)

OBJS		=	$(addprefix $(OBJS_PATH)/, $(OBJS_FILES))

NAME = pokedex

RM = rm -rf

all: $(NAME)

$(OBJS_PATH)/%.o:$(SRCS_PATH)/%.c | $(OBJS_PATH)
	$(CC) -c $< -o $@

$(NAME):$(OBJS) | $(OBJS_PATH)
	$(CC) $(OBJS) -o $(NAME)

$(OBJS_PATH):
	mkdir -p $(OBJS_PATH)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all
