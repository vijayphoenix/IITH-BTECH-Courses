%define parse.error verbose
%{
	extern int yylex();
	void yyerror(const char*s);
%}
%start S
%%
    S   :
        ;
%%

void yyerror(const  char *s){
	exit(1);
}

int main(){
	yyparse();
	return 0;
}
