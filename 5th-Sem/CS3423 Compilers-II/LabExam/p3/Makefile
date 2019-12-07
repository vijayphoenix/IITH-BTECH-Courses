p3:
	lex p3.l
	yacc -d p3.y
	g++ -o p3.out lex.yy.c y.tab.c -lfl
	
clean:
	rm *.yy.c ||:
	rm *.tab.* ||:
	rm *.out ||:
