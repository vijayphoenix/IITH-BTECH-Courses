class A {
    a : Int;
    b : Int;
    f1() : Int {
        {
            while a < 2 
                loop 
                    b <- b + 1 
                pool;
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
