class Main inherits IO {
	input: Int <- 0;
	first: Int <- 0;
	second: Int <- 1;
	i: Int <- 2;
	temp : Int <- 0;
    fibonacci(x : Int) : Int {
    	if x=1 then 0
    	else if x=2 then 1
	    	else {
	    		while i<input loop{
	    			temp <- second;
	    			second <- second+first;
	    			first <-temp;
	    			i <- i+1;
	    		}
	    		pool;
	    		second;
	    		}
	    	fi
    	fi
    };

    main() : Object {
	{
	    out_string("   ****Fibonacci of a number****\n");
	    out_string("Fib1 = 0\nFib2 = 1\n");
	    out_string("Enter a number\n");
 		input <- in_int();
	    out_string("Fibonacci = ");
	  	out_int(fibonacci(input));
	    out_string("\n");
    }};
};
