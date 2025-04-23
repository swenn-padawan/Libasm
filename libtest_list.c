#include <stdio.h>
typedef struct	s_list
{
	void			*data;
	struct	s_list	*next;
}	t_list;

void	ft_list_push_front(t_list **head, void *data);
int		ft_list_size(t_list *lst);

int main()
{
	t_list	*lst;

	ft_list_push_front(&lst, (void *)8);
	ft_list_push_front(&lst, (void *)7);
	ft_list_push_front(&lst, (void *)6);
	ft_list_push_front(&lst, (void *)5);
	ft_list_push_front(&lst, (void *)4);

	printf("list size = %d\n", ft_list_size(lst));

}
