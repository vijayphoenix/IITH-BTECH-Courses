.main:
	mov r0, 17
.start:
	mov r1,1
	cmp r0,2
	beq .return
	mov r2,2
loop:mod r3,r0,r2
	cmp r3,0
	beq .not_a_prime
	add r2,r2,1
	mul r4,r2,r2
	cmp r4,r0
	bgt .return
	b loop
.not_a_prime:
	mov r1,0
.return:
	.print r1
