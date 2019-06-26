@CS17BTECH11050
.main:
	movu r0,59999
	b .calc_and_print

.factorian:
	cmp r3, 0
	beq .return_factorian
	mod r4,r3,10
	mov r5,1
	.factorial:
		cmp r4,0
		beq .break
		mul r5,r5,r4
		sub r4,r4,1
		b .factorial
	.break:
		div r3,r3,10
		add r6,r6,r5
		b .factorian
.return_factorian:
	cmp r6, r0
	beq .equal_factorian
	mov r1, 0
	ret
.equal_factorian:
	mov r1,1
	ret
.dudeney:
	cmp r3,0
	beq .return_dudeney
	mod r4,r3,10
	add r5,r5,r4
	div r3,r3,10
	b .dudeney
.return_dudeney:
	mul r6,r6,r5
	mul r6,r6,r5
	mul r6,r6,r5
	cmp r6,r0
	beq .equal_dudeney
	mov r2,0
	ret
.equal_dudeney:
	mov r2,1
	ret

.calc_and_print:
	mov r3,r0
	mov r6,0	// stores the sum of (digit)!
	call .factorian
	mov r3,r0
	mov r5,0	// stores the sum of digits
	mov r6,1	// stores cube of sum of digits
	call .dudeney
	.print r1
	.print r2
