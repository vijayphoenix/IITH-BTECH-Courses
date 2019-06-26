class Main inherits IO {
	input: Int <- 0;
	i: Int;
    pattern(x : Int) : Object {
		while 0<x loop{
			i <-x;
			while 0<i loop{
				out_string("*");
				i <- i-1;
			}
			pool;
			x <- x-1;
			out_string("\n");
		}
		pool
    };

    main() : Object {
	{
	    out_string("   ****Pattern****\n");
	    out_string("Enter a number\n");
 		input <- in_int();
	  	pattern(input);
    }};
};
