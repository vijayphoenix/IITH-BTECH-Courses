bool check_palindrome(char s[], int len){
    if(len == 0 || len == 1) return true;
    for(int i = 0;i <= len/2;i++)
        if(s[i] != s[len-i-1])return false;
    return true;
}