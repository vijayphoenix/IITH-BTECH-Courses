class A {
    a : Int;
};

class B {
    a : A;
    b : Int;
    f1() : Int {
        {
            ~a;
            ~b;
            0;
        }
    };
    f2() : Int {
        {
            not a;
            not b;
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
