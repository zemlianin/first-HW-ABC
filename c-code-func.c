void Task(int *array, int *size, int *B)
{
    int j;
    int current = 0;
    for (j = 0; j < *size; ++j)
    {
        if (array[j] > 0)
        {
            B[current] = j;
            ++current;
        }
    }
}