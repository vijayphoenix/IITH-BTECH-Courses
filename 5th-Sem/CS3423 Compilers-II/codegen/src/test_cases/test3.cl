class A {
	a : Int <- 1;
};

class B inherits A {
	b : Int;
};

class C inherits B {
	c : Int <- 3;
	i : IO <- new IO;
	o : Object <- new Object;
	s : String <- "Hello";

	testAll(s1 : String,s2 : String, c : Int,d:Int) : Int {
		{
			i@IO.out_string("Enter string : \n");
			s1 <- i@IO.in_string();
			i@IO.out_string(s1);
			i@IO.out_string("Enter int : \n");		
			c <- i@IO.in_int();
			i@IO.out_int(c);
			i@IO.out_string(s1);
			i@IO.out_string(s2);
			i@IO.out_int(c);
			i@IO.out_int(d);
			i@IO.out_int(s1@String.length());
			i@IO.out_int("something"@String.length());
			i@IO.out_string(s1@String.concat(s2));
			i@IO.out_string("something"@String.concat(s2));
			i@IO.out_string(s1@String.substr(c,d));
			i@IO.out_string("abort() : ");
			o@Object.abort();
			0;
		}
	};


};

class Main {
	c : C <- new C;
	main() : Int {
		{
			c@C.testAll("Testing ","String", 2, 3);
			0;
		}
	};
};