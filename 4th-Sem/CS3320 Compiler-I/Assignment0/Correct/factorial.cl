class Main inherits IO {
	input: Int <- 0;
    factorial(x : Int) : Int {
    	if(x=0) then 1
    	else x*factorial(x-1)
    	fi
    };

    main() : Object {
	{
	    out_string("   ****Factorial of a number****\n");
	    out_string("Enter a number in the range [0,12]\n");
	    input <- in_int();
	    out_string("Factorial = ");
	  	out_int(factorial(input));
	    out_string("\n");
	}
    };
};
