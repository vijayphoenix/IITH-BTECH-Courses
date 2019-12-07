class SimpleExprTests inherits IO {
    a : Int <- 4;
    b : Bool;
    c : Object;
    e : Int;
    f : Object;

    testAll(x : Int, y : Int, z : Int) : Int {
        {
            self@IO.out_int(x);
            self@IO.out_string(" ");
            self@IO.out_int(y);
            a <- x + y;
            self@IO.out_int(a);
            a <- x - y;
            self@IO.out_int(a);
            a <- x * y;
            self@IO.out_int(a);
            a <- x / y;
            self@IO.out_int(a);
            a <- ~x;
            self@IO.out_int(a);
            a <- if x < y then x else y fi;
            if a = x
            then self@IO.out_string("then triggered\n")
            else self@IO.out_string("else triggered\n")
            fi;
            if x<=y
            then self@IO.out_string("then 1 triggeredl\n")
            else self@IO.out_string("else 1 triggered\n")
            fi;
            if x = y
            then self@IO.out_string("then equal triggered\n")
            else self@IO.out_string("else equal triggered\n")
            fi;
            self@IO.out_int(x);
            self@IO.out_string("\n");
            a <- 1;
            c <- while a <= x loop {
                self@IO.out_int(a);
                self@IO.out_string(" ");
                a <- a + 1;
            } pool;
            isvoid a;
            self@IO.out_int(x);
            self@IO.out_string(" ");
            self@IO.out_int(y);
            self@IO.out_string(" ");
            self@IO.out_int(z);
            a <- if x <= y then {
                if x <= z then x else z fi;
            }
            else {
                if y <=z then y else z fi;
            }
            fi;
            self@IO.out_int(a);
            b <- true;
            if b
            then self@IO.out_string("then bool triggered\n")
            else self@IO.out_string("else bool triggered\n")
            fi;
            if not b
            then self@IO.out_string("then and not triggered\n")
            else self@IO.out_string("else and not triggered\n")
            fi;
            0;
        }   
    };


    
};

class Main {
    e : SimpleExprTests <- new SimpleExprTests;
    main() : Int {
        {
            e@SimpleExprTests.testAll(3,4,1);
            e@SimpleExprTests.testAll(2,2,5);
            e@SimpleExprTests.testAll(4,0,9);
        }
    };
};