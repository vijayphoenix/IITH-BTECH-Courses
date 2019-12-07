class A {
    a : Int;
    f(x : Int, y : String) : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f(a : Int, b : String) : Int {
        1
    };
};

class C {
    b : B <- new B;
    f(x : Int, y : String) : Int {
        0
    };
};
class Main {
    main() : Int {
        0
    };
};
