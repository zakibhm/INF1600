#include <stdio.h>
#include<stdint.h>

extern float pi_approx_flottante();

int main(void) {
	float pi = pi_approx_flottante();
	printf("L'approxmiation de la valeur de pi entiere apres 50 itérations = %f\n",pi);
	return 0;
}
