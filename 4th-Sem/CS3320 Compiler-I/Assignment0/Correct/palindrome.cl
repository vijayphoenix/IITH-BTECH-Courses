class Main inherits IO {
    check_palindrome(s : String) : Bool {
	if(s.length() = 0) then true
	else if(s.length() = 1) then true
	else if(s.substr(s.length() - 1, 1) = s.substr(0, 1))
		then check_palindrome(s.substr(1, s.length() -2))
	else false
	fi 
	fi 
	fi
    };

    main() : Object {
	{
	    out_string("Enter a string\n");
	    if check_palindrome(in_string())
	    	then out_string("\nIt is aPalindrome\n")
	    else out_string("\nIt is not a palindrome\n")
	    fi;
	}
    };
};
