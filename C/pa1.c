#include <apue.h>

int hstrleg(char *s){
	int i = 0;
	while (*s++ != '\0')
		i++;

	s -= i; 
	
	//*s = 'B';

	printf("s in before return is %s\n", s);

	*s = 'B';
	return i;
}

int main(){
	char *s = "AAAAA";

	printf("s is %d\n", hstrleg(s));

	printf("s after is %s\n", s);
}
