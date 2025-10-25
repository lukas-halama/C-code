#include <stdio.h>

int area_1;
int area_2;
int area_final;


int main (){

	
	printf("enter the first number\n");
	//stores first integer into variable area_1
	scanf("%d", &area_1);
	
	printf("enter the second number\n");
	//stores the second integer into variable area_2
	scanf("%d", &area_2);
	
	//formula for the area calculation
	area_final = area_1 * area_2;	

	//prints out the result value
	printf("obsah prvni cislo a druhe cislo je roven  %d\n", area_final);

	return 0;
	
}
