/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcurtido <jcurtido@student.42barcelon      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/14 16:23:05 by jcurtido          #+#    #+#             */
/*   Updated: 2024/10/18 13:29:04 by jcurtido         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <stddef.h>
# include "libft/libft.h"

int		ft_printf(char const *format, ...);
int		split_check_variables(char c, va_list args);
// Utils
size_t	is_var(char c);
// Base parser
char	*ft_itoa_base(long nb, char c);
// Writers
size_t	split_putchr(char c);
size_t	split_putstr(char *str);
size_t	split_putnbr(int n);
size_t	split_putptr(void *ptr);
size_t	split_putunbr_hex(unsigned int n, char c);
size_t	split_putpct(void);

#endif
