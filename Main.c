#include <stdio.h>
#include <time.h>

extern void Task(int* A,int* size,int *B);
extern void Rand(char* arg, int size, int range, int* A);

int main(int argc, char* argv[]) {
    FILE *input, *output;
    int A[100];
    int B[100];
    int size, i, j, command, range, sizeN, sumTime = 0;
    char param_of_random;
    //input = fopen("tests.txt","r");
   // tests = fopen("tests.txt","r");
    printf("%s","input size\n");
    scanf("%d",&size);
    printf("%s","input command: \n 1 - read from file \n 2 - read from console\n 3 - Random\n 0 - Testing");
    scanf("%d",&command);
    if(command == 1) {
    	input = fopen("tests.txt","r");
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
    if(command == 0) {
	sizeN = size;   
 	input = fopen("tests.txt","r");	
 	output = fopen("times.txt", "w");
    	for(i = 0; i < 10; i++) {
    		for( j = 0; j < size; j++){
    			fscanf(input,"%d",&A[i]);
    		}
    		clock_t begin = clock();   
    		Task(A,&sizeN,B);
    		clock_t end = clock();
    		fprintf(output,"%d",(int)(end- begin));
    		sumTime += (int)(end- begin);
    		fprintf(output,"%s","\n");
   	}
   	printf("%s","Sum of Time in ms: ");
   	printf("%d",sumTime);
   	return 0;
    }  
    Task(A,&size,B);
    
    output = fopen("output.txt", "w");
    printf("%s","output command: \n 1 - write B to file \n 2 - write B to console\n");
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
