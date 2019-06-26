class List {

   empty() : Bool {
      true
   };

   head()  : Int {{
      abort();
      0;
   }};

   tail()  : List {{
      abort(); self;
   }};

   push_front(i : Int) : List {
      (new Edit_list).init(i, self)
   };
};

class Edit_list inherits List {

   front : Int;
   tail_list : List;

   empty() : Bool {
      false
   };

   head()  : Int {
      front
   };

   tail()  : List {
      tail_list
   };

   init(i : Int, rest : List) : List {{
      front <- i;
      tail_list <- rest;
      self;
   }};
};

class Main inherits IO {
   list : List;
   input: Int <-1;
   temp: Int;
   flag: Bool<-true;
   print_list(l : List) : Object {
      if l.empty() then out_string("\n")
      else{
         out_int(l.head());
			out_string(" ");
			print_list(l.tail());
		}
      fi
   };

   main() : Object {{
      out_string("***Implementation of data structure List****\n");
      out_string("Enter no of elements in list\n");
      input <-in_int();
      out_string("Enter numbers\n");
      while(0<input) loop{
         temp <-in_int();
         if flag = true then{
            list <-new List.push_front(temp);
            flag<-false;
         }
         else list <- list.push_front(temp)
         fi;
         input <-input-1;
      }
      pool;
      out_string("Your List is \n");
      print_list(list);
      }};
};