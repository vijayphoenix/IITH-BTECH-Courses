#include <bits/stdc++.h>
using namespace std;
int main(){
    int t;
    cin >> t;
    for(int a0 = 0; a0 < t; a0++){
        int initial=1;
        string s;
        cin >> s;
        stack < char > st;
        for(int i=0 ; i < s.length() ; i++){
            if(s[i]=='('||s[i]=='{'||s[i]=='['){
                st.push(s[i]);
                continue;
            }
            if(st.empty()) {
                initial=0;
                break;
            }
            if(s[i] == ')' && st.top() == '(') st.pop();
            else if(s[i] == ']' && st.top() == '[') st.pop();
            else if(s[i] == '}' && st.top() == '{') st.pop();
            else {
                initial=0;
                break;
            }
        }
        if(initial && st.empty()) printf("YES\n");
        else printf("NO\n");
    }
    return 0;
}
