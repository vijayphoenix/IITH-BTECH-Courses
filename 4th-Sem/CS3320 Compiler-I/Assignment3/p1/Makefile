p1:
	lex p1.l
	yacc -d p1.y
	g++ -o p1.out lex.yy.c y.tab.c -lfl
	
clean:
	rm *.yy.c ||:
	rm *.tab.* ||:
	rm *.out ||: