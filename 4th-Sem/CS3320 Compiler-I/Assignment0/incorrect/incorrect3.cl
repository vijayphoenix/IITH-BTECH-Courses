class Main inherits IO {
	x : Int <- 1;
   main(): SELF_TYPE {{
   		- x<- x*1; --One dash is missing
		out_int(x);
   }};
};
