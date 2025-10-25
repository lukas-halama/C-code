#include <stdio.h>


float num1;
float num2;


int main(){




	printf("enter a decimal number  \n");
	//stores the users decimal value to the variable num1
	scanf(" %f", &num1);

	printf("enter a decimal number  \n");
	//stores the users decimal value to the variable num2	
	
	scanf(" %f", &num2);
	
	float sum = num1 + num2;


	//prints out the final value
	printf("the sum of these two numbers is %f\n ", sum);




	return 0;	
}
