class Main inherits IO {
	input: Int <- 0;
    sum(x : Int) : Int {
    	(x*(x+1))/2
    };

    main() : Object {
	{
	    out_string("   ****Sum first n numbers****\n");
	    out_string("Enter a positive number\n");
	    input <- in_int();
	    out_string("Sum = ");
	  	out_int(sum(input));
	    out_string("\n");
	}
    };
};
