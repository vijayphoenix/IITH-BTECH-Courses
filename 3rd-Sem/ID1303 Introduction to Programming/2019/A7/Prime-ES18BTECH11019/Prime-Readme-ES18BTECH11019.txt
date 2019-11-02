1. Open the terminal and go to the respective file directory
2. Type, "gcc Prime-ES18BTECH11019.c -lm" and click enter (The math functions in math.h have implementations in libm.so (or libm.a for static linking), and libm is not linked in by default. There are historical reasons for this libm/libc split, none of them very convincing.)
3. Type ./a.out
4. Enter the value of the input number
5. Get the respective value of sum of prime digits or error message.