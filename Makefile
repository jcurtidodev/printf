# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcurtido <jcurtido@student.42barcelon      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/22 19:49:08 by jcurtido          #+#    #+#              #
#    Updated: 2024/10/22 19:49:50 by jcurtido         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Directories
LIBFT_DIR = libft

# Source files
LIBFT_SRC = $(LIBFT_DIR)/ft_atoi.c $(LIBFT_DIR)/ft_memchr.c $(LIBFT_DIR)/ft_strchr.c $(LIBFT_DIR)/ft_strrchr.c $(LIBFT_DIR)/ft_bzero.c $(LIBFT_DIR)/ft_memcmp.c $(LIBFT_DIR)/ft_strdup.c $(LIBFT_DIR)/ft_strtrim.c $(LIBFT_DIR)/ft_calloc.c $(LIBFT_DIR)/ft_memcpy.c $(LIBFT_DIR)/ft_striteri.c $(LIBFT_DIR)/ft_substr.c $(LIBFT_DIR)/ft_get_next_line.c $(LIBFT_DIR)/ft_memmove.c $(LIBFT_DIR)/ft_strjoin.c $(LIBFT_DIR)/ft_tolower.c $(LIBFT_DIR)/ft_isalnum.c $(LIBFT_DIR)/ft_memset.c $(LIBFT_DIR)/ft_strlcat.c $(LIBFT_DIR)/ft_toupper.c $(LIBFT_DIR)/ft_isalpha.c $(LIBFT_DIR)/ft_putchar_fd.c $(LIBFT_DIR)/ft_strlcpy.c $(LIBFT_DIR)/ft_isascii.c $(LIBFT_DIR)/ft_putendl_fd.c $(LIBFT_DIR)/ft_strlen.c $(LIBFT_DIR)/ft_isdigit.c $(LIBFT_DIR)/ft_putnbr_fd.c $(LIBFT_DIR)/ft_strmapi.c $(LIBFT_DIR)/ft_isprint.c $(LIBFT_DIR)/ft_putstr_fd.c $(LIBFT_DIR)/ft_strncmp.c $(LIBFT_DIR)/ft_itoa.c $(LIBFT_DIR)/ft_split.c $(LIBFT_DIR)/ft_strnstr.c
PRINTF_SRC = ft_printf.c ft_itoa_base.c ft_printf_utils.c ft_printf_writers.c

# Objects
LIBFT_OBJ = $(LIBFT_SRC:.c=.o)
PRINTF_OBJ = $(PRINTF_SRC:.c=.o)

# Variables
CC = cc
CFLAGS = -Wall -Wextra -Werror
AR = ar
ARFLAGS = rcs
NAME = libftprintf.a

# Targets
all: libft $(NAME)

# Build libft library
libft:
	$(MAKE) -C $(LIBFT_DIR)

# Build the static library (including both libft and printf objects)
$(NAME): $(LIBFT_OBJ) $(PRINTF_OBJ)
	$(AR) $(ARFLAGS) $@ $^

# Compile .c files to .o files
%.o: %.c Makefile ft_printf.h $(LIBFT_DIR)/Makefile $(LIBFT_DIR)/libft.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean objects and library
clean:
	$(MAKE) clean -C $(LIBFT_DIR)
	rm -f $(PRINTF_OBJ)

# Full clean, including the static library
fclean: clean
	$(MAKE) fclean -C $(LIBFT_DIR)
	rm -f $(NAME)

# Rebuild the project
re: fclean all
