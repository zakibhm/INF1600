#include <stdio.h>
#include<stdint.h>

extern int32_t pi_approx_entiere(int32_t a);

int main(void) {
	int32_t iteration = 10;

	int32_t pi = pi_approx_entiere(iteration);
	printf("L'approxmiation de la valeur de pi entiere apres %d itérations = %d\n",iteration,pi);
	return 0;
}
