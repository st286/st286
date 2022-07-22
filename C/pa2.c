#include <apue.h>

int hstrlen(char *s){
	int i = 0;
	while(*s++ != '\0')
		i++;
	
	s -= i + 1;

	*s = 'A';
	puts(s);
	return i;
}

int main(){
	char s[5] = "first";
	puts(s);
	printf("%d\n", hstrlen(s));


//	for (int i=0; i < 10; i++)
//		s[i] = 'A' + i;
}
