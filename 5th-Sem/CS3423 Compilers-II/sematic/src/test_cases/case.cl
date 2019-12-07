(* Rules for case *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C inherits B {
    c : Int;
};

class D {
    a : A;
    b : B;
    c : C;
    d : Int;
    f() : Object {
        {
            case d of 
                a : String => "A";
                b : Bool => 1;
                c : Object => d;
            esac;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
