%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
char pos[9][9]; // Chess board
%}

%define api.value.type {char*}
%token T_MOVE T_PROMOTE

%start game

%%

/* Game is set of normal moves, capture moves and promote moves */
game:	
	%empty
	| game promote
	| game move
;

/* When any normal move or capture move occurs execute the following */
move: T_MOVE			{
							int i1,i2,f1,f2;
							i2=$1[0]-'a'+1;
							i1=$1[1]-'0';
							f2=$1[3]-'a'+1;
							f1=$1[4]-'0';
							pos[f1][f2]=pos[i1][i2];
							pos[i1][i2]=' ';
						}
;
/* When a pawn is promoted execute the following */
promote: T_PROMOTE		{
							int i1,i2,f1,f2;
							i2=$1[0]-'a'+1;
							i1=$1[1]-'0';
							f2=$1[3]-'a'+1;
							f1=$1[4]-'0';
							pos[f1][f2]=$1[6];
							pos[i1][i2]=' ';
						}
;

%%

int main() {

/* Making chess board */
	for(int i=0;i<9;i++)
		for(int j=0;j<9;j++)
			pos[i][j]=' ';
	for(int i=1;i<9;i++)pos[i][0]=('0'+i);
	for(int i=1;i<9;i++)pos[0][i]=('a'-1+i);
	for(int i=1;i<9;i++)pos[7][i]=pos[2][i]='P';
	pos[1][1]='R';pos[1][2]='N';pos[1][3]='B';pos[1][4]='Q';pos[1][5]='K';pos[1][6]='B';pos[1][7]='N';pos[1][8]='R';
	pos[8][1]='R';pos[8][2]='N';pos[8][3]='B';pos[8][4]='Q';pos[8][5]='K';pos[8][6]='B';pos[8][7]='N';pos[8][8]='R';
    
    yyparse();

/* Display final chess board */
	for(int i=0;i<9;i++){
		for(int j=0;j<9;j++)
			printf("%c\t",pos[i][j]);
		printf("\n\n");	
	}
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}
