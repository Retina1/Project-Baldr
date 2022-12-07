.thumb

push    {r4-r5}
//// Chapter based exp negation
ldr     r1,=#0x202BCF0//chapter struct
ldrb    r1,[r1,#0x0E]//Ch ID offset
cmp     r1,#0x05
beq     NegateExp
cmp     r1,#0x0B
beq     NegateExp
cmp     r1,#0x11
beq     NegateExp
cmp     r1,#0x1B
beq     NegateExp
cmp     r1,#0x23
beq     NegateExp

//// Anticheesebyte Wexp Negation

push    {r2}//holds anticheesebyte
ldr     r1,=#0x203A4EC
add     r1,#0x4A
ldrb    r3,[r1]//r1 has character struct of attacker, gets held item ID
mov 	r2,#0x24
mul     r3,r2
ldr 	r2,=#0x8809B10//Item Table
add     r3,r2
pop     {r2}
ldrb 	r3,[r3,#0x7]//r3 now holds item type
cmp     r3,#0x4
beq     Staffing

//// Attacking

ldr     r1,=#0x203A4EC//attacker struct
ldrb    r3,[r1,#0x0B]//get allegiance
mov     r1,#0x40 //Check if enemy or npc
and     r1,r3
cmp     r1,#0x40
beq		CheckDefender
mov     r1,#0x80 //Check if enemy or npc
and     r1,r3
cmp     r1,#0x80 
beq     CheckDefender
ldr     r1,=#0x203A4EC//If we got here, attacker is ally and not staffing    
mov     r5,r1
ldrb    r1,[r1,#0x13]//get foe current hp
cmp     r1,#0x0
beq     End //if foe hp is 0, give wexp since it's a killing hit
ldr     r1,=#0x203A56C  
ldrb    r1,[r1,r2]//get foe anticheesebyte
cmp     r1,#0x5
beq     NegateExp
b       End

CheckDefender:
ldr     r1,=#0x203A56C//If we got here, attacker is not ally    
ldrb    r3,[r1,#0x0B]//get defender allegiance
mov     r1,#0x40 //Check if enemy or npc
and     r1,r3
cmp     r1,#0x40
beq		NegateExp
mov     r1,#0x80 //Check if enemy or npc
and     r1,r3
cmp     r1,#0x80 
beq     NegateExp
ldr     r1,=#0x203A56C//If we got here, defender is ally and not staffing    
mov     r5,r1
ldrb    r1,[r1,#0x13]//get foe current hp
cmp     r1,#0x0
beq     End
ldr     r1,=#0x203A4EC    
ldrb    r1,[r1,r2]//get foe anticheesebyte
cmp     r1,#0x5
beq     NegateExp
b       End

////

Staffing:
ldr     r1,=#0x203A4EC//Get staffer struct
ldr     r1,[r1]//r0 now contains staff user rom address
push 	{r0-r2}
ldrb    r0,[r1,#0x4]//r0 now contains staff user character ID
ldr     r1,=#0x0801829D//ram char data finder
mov     r14,r1
.short 	0xF800 //r0 now holds the staffer ram char data
mov     r3,r0
pop     {r0-r2}
ldrb    r1,[r3,r2]//get anticheesebyte
cmp     r1,#0x1F
bne     End
//now we check if staff is affected by anticheese
ldr     r1,=#0x203A4EC//Get staffer struct

add 	r1,#0x48
ldrh    r0,[r1]
lsl 	r0,#0x18
lsr		r0,#0x18//r0 contains staff ID
cmp 	r0,#0x4B//Heal
beq		NegateExp
cmp 	r0,#0x4C//Mend
beq 	NegateExp
cmp 	r0,#0x4D//Recover
beq 	NegateExp
cmp 	r0,#0x68//Bolster
beq 	NegateExp
cmp 	r0,#0x8E//Embolden
beq 	NegateExp
b 		End



NegateExp:
cmp     r0,#0xFB
beq     End
mov     r0,#0x0
End:
mov     r1,r7
add     r1,#0x7B
ldrb    r1,[r1]
lsl     r1,r1,#0x18	
asr     r1,r1,#0x18
cmp     r1,#0x00
beq     Skip
cmp     r0,#0xFB//251
beq     TransCheck
b       NotIphys
TransCheck:
mov     r1,r7
ldr     r1,[r1]
ldrb    r1,[r1,#0x04]
cmp     r1,#0x04//roiel
beq     Trans
cmp     r1,#0x01//Beryl
beq     Trans
cmp     r1,#0x16//Rae
beq     Trans
cmp     r1,#0x24//Carsten
beq     Trans
cmp     r1,#0x3D//Ash
beq     Trans
cmp     r1,#0x2B//Feen
beq     Trans
cmp     r1,#0xEF//Scrooz
beq     Trans
mov     r0,#0x00
b       Skip
Trans:
NotIphys:
mov     r1,#0x01
Skip:
mul     r0,r1
//cmp     r0,#0x02
//beq     Wpn
////cmp     r0,#0x03
////beq     Mag
//b       Finish
//Wpn:
////if number is uneven, add 1, if number is even and divisible by 6, add 1, else add 2
////r5 has unit gaining wxp struct
//mov     r1,#0x50
//ldrb    r2,[r5,r1]//item type
//mov     r1,#0x28
//add     r1,r2
//ldrb    r2,[r5,r1]//wexp
//mov     r4,r2
//mov     r1,#0x01
//and     r2,r1
//cmp     r2,r1
//beq     Sub1
//mov     r5,r0//store wexp gain
//mov     r1,#0x06
//mov     r0,r4
//ldr     r2,=#0x080D1994//Modulo function
//mov     r14,r1
//.short 	0xF800 //r0 now holds r0 mod r1
//cmp     r0,#0x00
//mov     r0,r5
//beq     Sub1
//b       Finish
////Mag:
//////if number is uneven, sub 1
//Sub1:
//sub     r0,#0x01
Finish:
pop     {r4-r5}

ldr     r1,=#0x802C149
bx      r1
