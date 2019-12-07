%{
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <unordered_map>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
int n = 0; 
int k = 0;
std::unordered_map<int,std::string> m;
std::unordered_map<int,int> count;
std::unordered_map<int,int> win;
int *match;
int t =0;
%}

%define api.value.type {std::string}
%token PID PLAYERS MOVES DIGIT EQUALITY MOVE NEWLINE

%%

/*
start: start PLAYERS EQUALITY DIGIT MOVES EQUALITY DIGIT  {
														n = stoi($4);
														k = stoi($5);
														match = new int[n];
														std::cout<<"dsfsgfhgh1";
													}
	| start PID DIGIT EQUALITY MOVE 			{ m[stoi($3)] = $5;  std::cout<<"dsfsgfhgh"; }
	| start PID DIGIT							{ match[t] = stoi($3); count[t] = 0; }
	| %empty   {}
;
*/

start: initial move
;

initial: PLAYERS EQUALITY DIGIT MOVES EQUALITY DIGIT  {
														n = stoi($3);
														k = stoi($6);
														match = new int[n];
													}
;

move: move PID DIGIT							{ int  tmp = stoi($3); match[t] = tmp; count[tmp] = -1; win[tmp]=0; t++;}
	| move PID DIGIT EQUALITY MOVE				{ m[stoi($3)] = $5;}
	| %empty   {}
;
													
%%

int result(int j, int i){
	char c1 = m[match[j]][count[match[j]]];
	char c2 = m[match[i]][count[match[i]]];
	if(c1==c2)return -1;
	if(c1 == 'P'){
		if(c2 == 'R') return j;
		else return i;
	}
	if(c1 == 'R'){
		if(c2 == 'S') return j;
		else return i;
	}
	if(c1 == 'S') {
		if(c2 == 'P') return j;
		else return i;
	}
	return -1;
}

int main() {
    yyparse();
    int j = 0, i=1;
   	int tie =0;
    while(i<n){
    	std::cout<<"P"<<match[j]<<" X " << "P" << match[i]<<"\n";
    	bool flag =0;
    	while(!flag){
			count[match[j]]++;
			count[match[i]]++;
			count[match[i]]%=k;
			count[match[j]]%=k;
			int temp = result(j,i);
			if(temp==-1 && tie <=k){
				tie++;
		    	std::cout<<"P"<<match[j]<<"("<< m[match[j]][count[match[j]]]<<") X " << "P" << match[i] <<"("<<m[match[i]][count[match[i]]]<<")-->";
				std::cout<<"T\n";
			}
			else if(tie > k){
				if(win[match[j]] < win[match[i]]){
					std::cout<<"P"<<match[j]<<"("<< m[match[j]][count[match[j]]]<<") X " << "P" << match[i] <<"("<<m[match[i]][count[match[i]]]<<")-->P"<<count[i]<<"\n";
					std::cout<<"P"<<match[j]<<" X " << "P" << match[i] <<"-->P"<<match[i]<<"\n";
					flag =1;
					j = i; i++;	
				}
				else {
					std::cout<<"P"<<match[j]<<"("<< m[match[j]][count[match[j]]]<<") X " << "P" << match[i] <<"("<<m[match[i]][count[match[i]]]<<")-->P"<< match[j]<<"\n";
					std::cout<<"P"<<match[j]<<" X " << "P" << match[i] <<"-->P"<<match[j]<<"\n";
					flag =1;
					i++;
				}
			}
			else {
				std::cout<<"P"<<match[j]<<"("<< m[match[j]][count[match[j]]]<<") X " << "P" << match[i] <<"("<<m[match[i]][count[match[i]]]<<")-->P"<< match[temp]<<"\n";
				std::cout<<"P"<<match[j]<<" X " << "P" << match[i] <<"-->P"<<match[temp]<<"\n";
				flag =1;
				j = temp; i++;
			}
    	}
		std::cout<<"\n";
    }
    
    std::cout <<"P" << match[j]<<" is the winner of Rock, Paper, Scissors Competition held at Elan 2020, IITH.\n";
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}
