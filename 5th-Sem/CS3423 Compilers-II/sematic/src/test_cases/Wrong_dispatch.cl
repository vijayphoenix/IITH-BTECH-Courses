class A {
    a : Int;
    f() : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f() : Int {
        0
    };
};

class C {
    b : B;
    f2(x : Int, y : String) : B {
        b
    };
    f3() : Int {
        let c : A in
        {
            c <- f2(0,"A");
            c <- f4();
            c <- f2("A");
            c <- f2("A",0);
            0;
        }
    };
};

class D {
    a : A;
    c : C;
    f4() : Int {
        {
            a <- c.f2(0,"A");
            c <- a.f2();
            a <- c.f2("A");
            a <- c.f2("A",0);
            0;
        }
    };
};

class E {
    a : B <- new B;
    b : Int;
    c : Int;
    f1() : Int{
        {
            b <- a@A.f();
            c <- a@B.f();
            c <- a@C.f3();
            c <- a@K.f();
            c <- a@A.f(0);
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
