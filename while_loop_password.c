#include <stdio.h>

int password = 1234;
int guess;

int main(){
		
	while(guess != password) {
	printf("guess password \n");
	scanf("%d", &guess);

	if (guess != password) {

	printf("wrong try again \n");

	}
	}
	if (guess = password) {

	printf("the pasword is correct \n");
	}



	return 0;
}		

