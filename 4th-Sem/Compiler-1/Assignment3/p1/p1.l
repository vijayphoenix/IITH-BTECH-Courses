%option noyywrap

%{
  #include <stdio.h>
  #define YY_DECL int yylex()
  #include "y.tab.h"

%}

NEWLINE			"\n"
WHITESPACE 		[[:blank:]]
INDEX			[0-9]+"."
PIECES			[KQRBN]
PROMOTE         [a-h][1-8][ ]*[-x][ ]*[a-h][1-8][ ]*[=][ ]*[QRBN]
MOVE			[a-h][1-8][ ]*[-x][ ]*[a-h][1-8]

%%

{NEWLINE}	
{WHITESPACE}+
{PIECES}
{PROMOTE}			{ yylval=strdup(yytext); return T_PROMOTE; }
{MOVE}				{ yylval=strdup(yytext); return T_MOVE; }
{INDEX}

%%
