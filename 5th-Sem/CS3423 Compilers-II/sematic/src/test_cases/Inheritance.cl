class A {
    a : Int;
    f(x : Int) : Int {
        a + x
    };
};

class B inherits A {
    b : Int;
    -- Overide parent class method f(Int) in child class B
    f(x : Int) : Int {
        b + a + x
    };
};

class Main {
    main() : Int {
        1
    };
};
