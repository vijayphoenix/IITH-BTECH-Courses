.main:
	mov r0,0
	mov r4,0
	mov r5,0
	mov r6,0
	.loop1:
		mov r3,0
		mov r1,1
	  	.loop2:
			mul r4,r1,r1
			mul r4,r4,r1
			cmp r4,r0
			bgt .break2
			mov r2,1
			.loop3:
				cmp r2,r1
				bgt .break3
				mul r5,r2,r2
				mul r5,r5,r2
				add r6,r4,r5
				cmp r6,r0
				beq .if
				b .afterif
				.if:
					add r3,r3,1
					cmp r3,2
					beq .break1
				.afterif:
					add r2,r2,1
					b .loop3
			.break3:
				add r1,r1,1	
				b .loop2
		.break2:
		   	add r0,r0,1
		   	b .loop1
	.break1:
		.print r0
