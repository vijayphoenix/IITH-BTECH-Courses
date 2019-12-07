class A {
    a : Int;
    f4() : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f4() : Int {
        1
    };
};

class C {
    b : B;
    f1(x : Int, y : String) : B {
        b
    };
    f2() : Int {
        let c : A in
        {
            c <- f1(1,"A");
            0;
        }
    };
};

class D {
    a : B <- new B;
    b : Int;
    c : Int;
    f5() : Int{
        {
            b <- a@A.f4();
            c <- a@B.f4();
            0;
        }
    };
};

class Main {
    main() : Int {
        1
    };
};
