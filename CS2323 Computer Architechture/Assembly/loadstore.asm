.main:
mov r0, 1234
mov r1, 0
st r0, 0x    4		 d  4 [r1]
mov r2, 0xc  35
st r2, 0x f5 5 b[r2]
ld r14, 0x4d4[r1]
ld r15, 0xf55b[r2]
.print sp, ra