p2:
	lex p2.l
	yacc -d p2.y
	g++ -o p2.out lex.yy.c y.tab.c -lfl
	
clean:
	rm *.yy.c ||:
	rm *.tab.* ||:
	rm *.out ||: