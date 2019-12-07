class A {
    a : Int;
};

class B {
    a : A;
    f() : Bool {
        let b : Int, c : String, d : Bool in {
            a;
            b;
            c;
            d;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
