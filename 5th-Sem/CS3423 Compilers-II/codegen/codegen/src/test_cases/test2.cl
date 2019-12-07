class A {
    a : Int;
    f1() : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f1() : Int {
        1
    };
};

class E inherits A {
    c : Int;
};

class F inherits A {
    f : Int;
};

class C {
    a : Int;
    a2:Int;
    b : Bool;
    c : String;
    e : B;
    f : B <- new B;
    g : IO <- new IO;
    h : A <- new B;
    i : A <- new A;
    j : A;
    k : F <- new F;
    l : A <- new F;

    testAll() : Object {
        {
            g@IO.out_string("Int : ");
            g@IO.out_int(a);
            g@IO.out_string("\nString : ");
            g@IO.out_string(c);
            g@IO.out_string("\nBool : ");
            g@IO.out_string("Int : ");
            g@IO.out_int(1);
            g@IO.out_string("\nString : ");
            g@IO.out_string("Done");
            g@IO.out_string("\nBool : ");
            if true then
                g@IO.out_string("true")
            else
                g@IO.out_string("false")
            fi;
            if b then g@IO.out_string("True") else g@IO.out_string("False") fi;
            if isvoid e then
                g@IO.out_string("Object is void")
            else
                g@IO.out_string("Object is not void")
            fi;
            g@IO.out_string("\nOther class with new, here class B : ");
            if isvoid f then
                g@IO.out_string("Object is void")
            else
                g@IO.out_string("Object is not void")
            fi;
            a<-0;
            while a < 10 loop {
                a2 <- 0;
                while a2 <= a loop {
                    g@IO.out_string("*");
                    a2 <- a2 + 1;
                }
                pool;
                g@IO.out_string("\n");
                a <- a + 1;
            }
            pool;
            g@IO.out_int(f@B.f1());
            g@IO.out_int(f@A.f1());
            g@IO.out_int(h@A.f1());
            g@IO.out_int(i@A.f1());
            g@IO.out_int(l@A.f1());
            g@IO.out_int(k@A.f1());
            e@B.f1();
        }
    };

    
};

class Main {
    c : C <- new C;
    a : A;
    main() : Int {
        {
            c@C.testAll();
            0;
        }
    };
};