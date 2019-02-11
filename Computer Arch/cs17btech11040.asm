//CS17BTECH11040
.main:
movu r0, 59999
movu r1, 0
movu r2, 0
mov r3, r0
movu r4, 0

@Start of factorion function
.factorion_loop:
mod r5, r3, 10
div r3, r3, 10
movu r6, 1   
movu r7, 1 		
@Register r7 stores the sum of factorials of digits

@Calculating factorial of each digit
.factorial:
cmp r7, r5
bgt .break_factorial
mul r6, r6, r7
add r7, r7, 1
b .factorial

.break_factorial:

add r4, r4, r6
cmp r3, 0
beq .break_factorion_loop
b .factorion_loop

.set_r1_equal_to_1:
mov r1,1
b .return_back

.break_factorion_loop:				
cmp r4, r0
@comparing values of both the registers

beq .set_r1_equal_to_1
.return_back:
.print r1
@Factorion function ends here

mov r3, r0
movu r6, 0
@Register r6 stores the sum of digits

@Start of dudeney function
.dudeney_loop:
mod r5, r3, 10
div r3, r3, 10
add r6, r6, r5
cmp r3, 0
beq .break_dudeney_loop
b .dudeney_loop

.set_r2_equal_to_1:
movu r2, 1
b .return


.break_dudeney_loop:

@Calculating the cube of sum of digits
mul r4, r6, r6
mul r4, r4, r6

@Comparing values of both registers
cmp r4, r0
beq .set_r2_equal_to_1
.return:
.print r2
