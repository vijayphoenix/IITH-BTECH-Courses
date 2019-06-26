.main: 
mov r0, 371
mov r1,0   
mov r2,r0
mov r5,0
b check


loop:
mod r3,r2,10
mul r4,r3, r3
mul r4,r4,r3
add  r5, r5,	r4
div r2,r2,0x 00     0A
b check


check:
cmp r2, 0
bgt loop
beq end


end:
cmp r5,r0
beq return
b final

return:mov r1,1

final:.print r1

			
   
      

