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
		r = getline(&buffer, &size, stdin);  // 重点：getline(), 当buffer = NULL，size不指定大小时，自动分配内存大小。
						     //      其内存只分配一次，重复使用。如下次用，不够，自动realloc(), 增大内存，但还是同一块内存，
(//下面的if，可不需要
		if (buffer == NULL) { 
			perror("Unable to allocate buffer\n");
			exit(EXIT_FAILURE); //EXIT_SUCCESS	
		}
		
		if (r > max) {
			max = r;
			max_size = size;
			max_buffer = (char *)realloc(max_buffer, max_size);  // 重点： Function realloc(), max_buffer = NULL, max_size不指定大小时，
									     //       按max_size随机值。
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
