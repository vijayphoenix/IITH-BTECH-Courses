class Main inherits IO {
	x : Bool <- True;	--case sensitive keyword
   main(): SELF_TYPE {
   		if x then out_string("True\n")
   		else out_string("False\n")
   		fi
   };
};
