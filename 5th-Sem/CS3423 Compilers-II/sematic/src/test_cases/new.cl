class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    a : A <- new A;
    b : B <- new B;
    c : A <- new B;
    d : Object <- new Int;
    e : String <- new String;
    f : Object <- new Object;
};


class Main {
    main() : Int {
        0
    };
};
