#include <stdio.h>
#include <inttypes.h>

double sum(double[], uint64_t);

int main() {

	double test[] = {4,2,3};

	printf("%20.7f\n", sum(test,3));
	
	return 0;
}
