.factorial:
	cmp r0, 1
	bgt .continue
	
	mov r1, 1
	ret
	
	.continue:
		sub sp, sp, 8
		st r0, [sp]
		st ra, 4[sp]
		sub r0, r0 , 1 
		call .factorial
		ld ra, 4[sp]
		ld r0 ,  [sp]
		add sp,sp, 8
		mul r1, r0,r1
		ret

.main:
	mov r0, 10
	call .factorial
	.print r1
