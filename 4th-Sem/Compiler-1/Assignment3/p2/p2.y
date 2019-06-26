%{
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

/* Defualt token type is now a string */
%define api.value.type {std::string}
%token IF ELSE ASSIGN INIT DELAY SELECT READINT COLON INT COMP_OP TYPE IDENTIFIER

%%

start:
	%empty											{ $$=""; }
	| grammer										{ std::cout<<"#include<stdio.h>\n#include<stdlib.h>\n#include<seven_segment.h>\nint main()\n{\n"+$1+"}\n"; }
;

/* A grammer is a set valid expressions */
grammer:
	%empty											{ $$=""; }
	| grammer expression							{ $$=$1+$2; }
;

/* A expression satisfies only one rule below */
expression:	
/* 
INIT can occur any number of times and anywhere in the program 
This is the source of some warnings like shift reduce conflict and reduce-reduce conflict
*/
	INIT grammer									{ $$="init();\nwhile(1)\n{\n"+$2+"}\n";}
	| SELECT COLON value							{ $$="select("+$3+");\n"; }
	| DELAY COLON value								{ $$="delay("+$3+");\n"; }
	| IDENTIFIER COLON IDENTIFIER					{ $$=$3+" "+$1+";\n"; }
	| IDENTIFIER ASSIGN value						{ $$=$1+" = "+$3+";\n"; }
	| vector										{ $$=$1; }
	| IF condition COLON vector ELSE COLON vector	{ $$="if("+$2+")\n{\n\t"+$4+"}\nelse\n{\n\t"+$7+"}\n"; }
	| IF condition COLON vector						{ $$="if("+$2+")\n{\n\t"+$4+"}\n"; }
;

/* Boolean condition*/
condition:
	value COMP_OP value								{ $$=$1+" "+$2+" "+$3; }
;

/* Value can be a number, function like readInt() or a variable(Identifier) */
value:
	INT												
	| READINT										{ $$="readInt()"; }
	| IDENTIFIER									
;
/*Seven segment display configuration*/
vector:
	INT INT INT INT INT INT INT INT					{ $$ ="write(strtol(\""+$1+$2+$3+$4+$5+$6+$7+$8+"\"));\n"; }
;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}
