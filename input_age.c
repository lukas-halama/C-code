#include <stdio.h>

int input;

int main(){

	printf("zadej kolik let ti je  \n");

	scanf("%d", &input);
	
	int hodnota = input + 10;

	printf("za 10 let ti bude %d", hodnota);

	return 0;
}
