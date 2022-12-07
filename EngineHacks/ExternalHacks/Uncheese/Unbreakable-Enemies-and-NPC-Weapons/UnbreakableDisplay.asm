.thumb

ldr     r2,[r7,#0xC]//r1 has unbreakability type,
                    //r2 has charstruct, r5 has item halfword
ldrb    r0,[r2,#0xB]//get allegiance pointer
mov     r3,#0x40//is enemy
and     r0,r3
cmp     r0,#0x0
bne     ShowDashes
ldrb    r0,[r2,#0xB]
mov     r3,#0x80//is NPC
and     r0,r3
cmp     r0,#0x0
bne     ShowDashes
b 	  Continue

ShowDashes:// if unit is not player. this will make their stuff display --

cmp     r1,#0x0//check unbreakability type to see if we need to check for staves and items
beq     Unbreakable
lsl 	r0,r5,#0x19
lsr	    r0,#0x19 // r0 now holds the item ID
mov 	r3,#0x24
mul     r0,r3
ldr 	r3,=#0x8809B10//Item Table
add     r0,r3
ldrb    r0,[r0,#0x7]//r0 holds weapon type
cmp     r0,#0x3
bls     Unbreakable//0 is swords, 1 is lances, 2 is axes, 3 is bows
cmp     r0,#0x4
beq     Continue//4 is staves
cmp     r0,#0x7
bls     Unbreakable//5 is light, 6 is anima, 7 is dark
cmp     r0,#0xB
beq     Unbreakable//0xB is monster/dragonstone
cmp     r0,#0x11
beq 	Unbreakable//0x11 is dragonstone
b 		Continue//Anything not checked so far is not a weapon

Unbreakable:

lsl 	r5,#0x18
lsr	    r5,#0x18 // r5 now holds the item ID
ldr     r0,=#0xFF00
add     r5,r0

Continue:

ldr     r0,[r2,#0xC]
mov     r1,#0x80
lsl     r1,r1,#0x5
and     r0,r1
ldr     r3,=#0x080874CF
bx      r3