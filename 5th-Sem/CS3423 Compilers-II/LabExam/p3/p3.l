%option noyywrap

%{
  #include <stdio.h>
  #include <string>
  #define YY_DECL int yylex()
  #include "y.tab.h"

%}

PLAYERS			N
MOVES 			K
PID				P
DIGIT			[0-9]+
EQUALITY		==
MOVE			[PSR]*
NEWLINE			"\n"
WHITESPACE 		[[:blank:]]

%%

{PID}				{ yylval=strdup(yytext); return PID;}
{PLAYERS}			{ return PLAYERS; }
{MOVES}				{ return MOVES; }
{MOVE}				{ yylval=strdup(yytext); return MOVE; }
{DIGIT}				{ yylval=strdup(yytext); return DIGIT;}
{EQUALITY}			{ return EQUALITY; }
{NEWLINE}			
{WHITESPACE}+

%%

