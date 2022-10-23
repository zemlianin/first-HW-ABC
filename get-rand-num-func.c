#include <stdlib.h>

void Rand(char *arg, int size, int range, int *A)
{
	srand(range);
	int n = 0, i;
	n = atoi(arg);
	for (i = 0; i < size; i++)
	{
		A[i] = rand() % range - range / 2;
	}
}