class Main inherits IO {
	Str: String <- "Hello, World.\n"; --Identifier begins with capital letter
   main(): SELF_TYPE {
		out_string(Str)
   };
};
