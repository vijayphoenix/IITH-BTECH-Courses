#include<stdio.h>
#include<string.h>

int main(){
	int flag=1;
	char s[1000];
	printf("Enter a word\n");
	int len;
	if(scanf("%s",s)==EOF)len=0;//Assuming string of length zero is a palindrome
	else len=strlen(s);
	for (int i = 0; i < len/2; ++i){
		if (s[i]!=s[len-i-1]){
			flag=0;
			break;
		}
	}
	if(flag==1){
		printf("It is a palindrome\n");
	}
	else printf("Not a palindrome\n");
	return 0;
}