#include <stdio.h>

extern void Task(int* A,int* size,int *B);
extern void Rand(char* arg, int size, int range, int* A);

int main(int argc, char* argv[]) {
    FILE *input, *output;
    int A[100];
    int B[100];
    int size, i, command, range;
    char param_of_random;
    input = fopen("input.txt","r");
    printf("%s","input size\n");
    scanf("%d",&size);
    printf("%s","input command: \n 1 - read from file \n 2 - read from console 3 - Random\n");
    scanf("%d",&command);
    if(command == 1) {
    	for(i = 0; i < size; i++) {
    		fscanf(input,"%d",&A[i]);
   	}
    }
    
    if(command == 2) {
    	for(i = 0; i < size; i++) {
    		scanf("%d",&A[i]);
   	}
    }
    
    if(command == 3) {
    	printf("%s","input range of numbers\n");	
    	scanf("%d",&range);
    	if(argc == 1) {
    		param_of_random = '0';
    	} else {
    		param_of_random = (*argv)[1];
    	}
    	Rand(&param_of_random, size, range, A);
    }
    
    Task(A,&size,B);
    output = fopen("output.txt", "w");
    printf("%s","output command: \n 1 - write to file \n 2 - write to console\n");
    scanf("%d",&command);
    
    if(command == 1) {
    	for(i = 0; i < size; i++) {
    		fprintf(output,"%d",B[i]);
   	}
    }
    
    if(command == 2) {
    	for(i = 0; i < size; i++) {
    		printf("%d",B[i]);
    	}
    }
    return 0;
}
