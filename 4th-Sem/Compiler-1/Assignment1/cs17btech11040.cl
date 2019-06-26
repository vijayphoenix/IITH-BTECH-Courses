-- This is a implementation of Data Structure List
class List {
    head: String;       --Head of List
    tail_list: List;    --It is a List consisting of all elements except the head of the current List

    empty(): Bool {     --Tests if List is empty 
        isvoid tail_list
    };

    head(): String {    --Return head of List
        head
    };

    tail(): List {      
        tail_list
    };

    init(s: String, rest: List): List{{
        head <- s;
        tail_list <-rest;
        self;
    }};

    push_front(s : String) : List {     --Adds a new element to the head of the List
        (new List).init(s, self)
    };
};

class StackComm inherits IO {

    command(l: List,input: String): List{   --Executes a function corresponding to the input giving by user
        if input="e" then execute(l) 
        else if input="d" then {
            display(l);
            l;
        }
        else l.push_front(input)
        fi
        fi
    };

    display(l: List) : Object{              --Prints the contents of the List
        if l.empty() then out_string("")
        else {
            out_string(l.head());
            out_string("\n");
            display(l.tail());
        }
        fi
    };

    sum(l: List): List{                     --Takes the top two elements of the list and adds the result back to the list 
        let x1 : Int <- new A2I.a2i(l.head()), x2 :Int <- new A2I.a2i(l.tail().head()) in
            (new List).init(new A2I.i2a(x1+x2),l.tail().tail())
    };

    swap(l: List): List{                    -- Swaps the top two elements of the list
        let x1 : String <- l.head(), x2 :String <- l.tail().head() in 
            new List.init(x2, new List.init(x1, l.tail().tail()))
    };

    execute(l: List): List{
        if l.empty() then l
        else if l.head()="+" then sum(l.tail())
        else if l.head()="s" then swap(l.tail())
        else l
        fi fi fi
    };

};

class Main inherits IO {
    list : List <-new List;
    stackCommand : StackComm <- new StackComm;      --Class of commands
    input : String <-"";
    main() : Object {{
        out_string(">");
        input <-in_string();
        while(not input="x") loop{
            list <- stackCommand.command(list,input);
            out_string(">");
            input <- in_string();
        }
        pool;
    }};
};