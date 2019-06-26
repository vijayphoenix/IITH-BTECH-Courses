.main:
	mov r0, 5
	mov r1, 1
	mov r2, 1
	.loop:
		cmp r2, r0
		bgt .break
		mul r1, r1, r2
		add r2, r2, 1
		b .loop  
	.break:
		.print r1