//日期：2022-07-17
//从标准输入中，读取每一行。最后，在标准输出中，输出最长的行。
//用到标准库函数: getline(), realloc(), strcpy(), perror(), free().


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
	char *buffer = NULL;
	size_t size;
	int r;

	int max = 0;
	char *max_buffer = NULL;
	size_t max_size;

	printf("Type:\n");
	do {
		r = getline(&buffer, &size, stdin);

//下面的if，可不需要
		if (buffer == NULL) { 
			perror("Unable to allocate buffer\n");
			exit(EXIT_FAILURE); //EXIT_SUCCESS	
		}
		
		if (r > max) {
			max = r;
			max_buffer = (char *)realloc(max_buffer, max_size);
			strcpy(max_buffer, buffer);
		}
//	printf("You typed (%d): %s\n", r, buffer);
	} while (r != EOF);
	
	if (max > 0)
		printf("MAX-LINE: %d\n%s", max, max_buffer);
	else
		printf("NOT MAX-LINE\n");

	free(buffer);
	free(max_buffer);

	return 0;
}
