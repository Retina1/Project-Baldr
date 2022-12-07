.thumb
//				  r1 contains chip exp, r0 contains exp added on kills
//                r2 contains the anticheese charstruct byte
//                r4 has the battle struct of the xp gaining unit
//                r5 has the adversary's battle struct
//                r6 has ram pointer of attacker unit struct
//                r7 has ram pointer of defender unit struct
//				  if hit doesn't kill, we want to check the enemy
//				  charstruct to see if they've been struck before.
//                If they have, we divide according to the number.


ldr     r3,=#0x202BCF0//chapter struct
ldrb    r3,[r3,#0x0E]//Ch ID offset
cmp     r3,#0x05
beq     NullifyExp
cmp     r3,#0x0B
beq     NullifyExp
cmp     r3,#0x11
beq     NullifyExp
cmp     r3,#0x1B
beq     NullifyExp
cmp     r3,#0x23
beq     NullifyExp


ldrb    r3,[r5,#0x13]//r3 = adversary HP

cmp     r3,#0x0
ble     NormalExp// If foe HP (r3)>0, we want to check if enemy was struck before.

ldrb    r3,[r5,r2]//R3 now contains Anticheesebyte's value, which we use to
                  //identify how many times has the opponent been damaged. 
cmp     r3,#0x3
blo     ContinueExp//0,1,2 won't reduce EXP
beq		HalvedExp//3 halves it
cmp     r3,#0x4
beq     QuarterExp//4 halves it twice
cmp     r3,#0x5
beq     NullifyExp//5 negates it
mov     r3,#0x0//If you got this far, the value was broken so it'll reset
b ContinueExp
NullifyExp:
mov 	r0,#0x0
mov     r1,r0
ldr 	r3,=#0x0802C5A1
bx      r3
QuarterExp:
lsr     r1,#0x1 //divide by 2 followed by the next, making it 4
HalvedExp:
lsr     r1,#0x1 //divide by 2
ContinueExp:
push    {r4}
push    {r1-r3}
ldr     r3,=#0x3004E50
ldr     r4,[r3]
ldrb    r3,[r4,#0xB]
mov     r1,#0x40
and     r1,r3
cmp     r1,#0x40
beq     NotBlue 
mov     r1,#0x80
and     r1,r3
cmp     r1,#0x80
beq     NotBlue    
pop     {r1-r3}
pop     {r4}
add     r3,#0x1
strb    r3,[r7,r2]
b       NormalExp

NotBlue:
pop     {r1-r3}
add     r3,#0x1
strb    r3,[r4,r2]
pop     {r4}

NormalExp:
add     r1,r1,r0
str     r1,[sp]
cmp     r1,#0x64
ble     Jump
mov     r0,#0x64
str     r0,[sp]
Jump:
ldr 	r3,=#0x0802C599
bx 		r3