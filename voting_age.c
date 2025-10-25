#include <stdio.h>

int age;





int main(){
	
	printf("enter your age\n");
		
	scanf("%d", &age);

	int condition1 = age < 18;
	int condition2 = age > 18;
	int condition3 = age == 0;
	

	if (condition1) {
	
	printf("you cant vote yet\n");




	} else if (condition2){

	printf("you can vote\n");

	} else if (condition3){
		printf("you werent born yet");
	}else {
	printf("you are 18 and can vote\n");

	}
	return 0;
}
