class Main inherits IO {
	str: String <- "Hello,
	 World.\n"; --Unterminated string constant. It can be avoid with a backslash
   main(): SELF_TYPE {
		out_string(str)
   };
};
