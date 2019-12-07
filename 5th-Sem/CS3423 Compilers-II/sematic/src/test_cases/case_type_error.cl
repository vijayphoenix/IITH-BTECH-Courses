class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    c : Int;
    d : A;
    f1() : Int {
        {
            case d of 
                c : A => c <- 1; 
                e : B => c <- 1;
            esac;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
