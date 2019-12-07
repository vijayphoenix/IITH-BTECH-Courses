-- Self in attributes
class A {
    self : Int;
};

-- Self in Formals
class B {
    f1(self : Int) : Int {
        0
    };
};

-- Self in assign expression 
class C {
    c : D;
    f2() : Int {
        {
            self <- c;
            0;
        }
    };
};

-- Self in let expression 
class D {
    f3() : Int {
        let x : Int, self : String in {
             x <- 1;
             x;
        }
    };
};

-- Self in case expression 
class E {
    f : C;
    f4() : Int {
        case f of
            id1 : C => 0;
            self : C => 1;
        esac
    };
};

class Main {
    main() : Int {
        0
    };
};


