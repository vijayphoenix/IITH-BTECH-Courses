%option noyywrap

%{
  #include <stdio.h>
  #include <string>
  #define YY_DECL int yylex()
  #include "y.tab.h"

%}

/* INT is any number */
INT				[[:digit:]]+
/*Identifier is any variable name or type name*/
IDENTIFIER  	[_[:alpha:]][[:alnum:]_]*
NEWLINE			"\n"
WHITESPACE 		[[:blank:]]
/* Comparision operators*/
COMP_OP			"=="|">"|"<"|"<="|">="|"!="
/*Assigment operator*/
ASSIGN			"="
COLON			":"

 /* Iterate till end of line */
SINGLE_LINE_COMMENT "#".*

%%

{SINGLE_LINE_COMMENT}
{NEWLINE}
{WHITESPACE}+

(?i:if)			    return IF;
(?i:else)		    return ELSE;

{ASSIGN}		    return ASSIGN;

INIT				return INIT;
Delay				return DELAY;
Select				return SELECT;
readInt				return READINT;
{COLON}				return COLON;
{COMP_OP}		    { yylval = yytext; return COMP_OP; }
{INT}          		{ yylval = yytext; return INT; }
{IDENTIFIER}		{ yylval = yytext; return IDENTIFIER; }

%%
