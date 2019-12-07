%{
	#include"y.tab.h" 
%}

%%
.                                           ;
                                                
%%

int yywrap(void){
	return 1;
}

