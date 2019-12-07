class Main inherits IO {
	i : Int <-5;
	t : Int <-5;

	flag: Bool <- true;

	mod(a:Int ,b:Int):Int{
    	a-(a/b)*b
    };

    check_prime(n : Int) : Bool {
    	if(n<=1) then flag<-false
    	else if n<=3 then true
    	else if(mod(n,2)=0) then false
    	else if mod(n,3)=0 then false
    	else {
    		while(i*i<=n) loop{
    			if mod(n,i)=0 then flag<-false
    			else if mod(n,i+2)=0 then flag<-false
    			else t <- t+1
    			fi fi;
    			i <- i+6;
    		}
    		pool;
    		flag;
    	}
    	fi fi fi fi
    };

    
    main() : Object {
	{
	    out_string("****PRIME CHECKER****\n");
	    out_string("Enter a number\n");
	    if check_prime(in_int())
	    	then out_string("\nIt is Prime\n")
	    else out_string("\nIt is not a Prime\n")
	    fi;
	}
    };
};
