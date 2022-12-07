.thumb

push    {r14}//r0 contains unspent item halfword.
			 //r1 comtains Unbreakability type byte
			 //r5 has current unit battle struct if attacking
			 //r4 has current unit battle struct if staffing

///

lsl 	r2,r0,#0x18
lsr	 	r2,#0x18 // r2 now holds the item ID
mov     r3,#0x24
mul     r2,r3 //r2 now holds the offset of the item in item table
ldr     r3,=#0x8809B10//Item Table
add     r2,r3
ldrb 	r2,[r2,#0x7]//r2 now holds item type
cmp     r2,#0x3
bls     WeaponCharCheck//0 is swords, 1 is lances, 2 is axes, 3 is bows
cmp     r2,#0x4
beq     StaffCharCheck//4 is staves
cmp     r2,#0x7
bls     WeaponCharCheck//5 is light, 6 is anima, 7 is dark
cmp     r2,#0xB
beq     WeaponCharCheck//0xB is monster/dragonstone
cmp     r2,#0x11
beq 	WeaponCharCheck//0x11 is dragonstone
b 		ItemCharCheck//Anything not checked so far is not a weapon
///
StaffCharCheck:
ldrb    r2,[r4,#0x0B]
mov     r3,#0x40 //Check if enemy
and     r2,r3
cmp     r2,#0x0
beq     StaffCharCheckNPC//not enemy, check if NPC
b		toEnd //skips durability depletion if unit is enemy

StaffCharCheckNPC:       
ldrb    r2,[r4,#0x0B]
mov     r3,#0x80 //Check if NPC
and     r2,r3
cmp     r2,#0x0
beq 	Breakable
b 		toEnd


WeaponCharCheck:
ldrb    r2,[r5,#0x0B]
mov     r3,#0x40 //Check if enemy
and     r2,r3
cmp     r2,#0x0
beq     WeaponCheckNPC//not enemy, check if NPC
b		toEnd //skips durability depletion if unit is enemy

WeaponCheckNPC:       
ldrb    r2,[r5,#0x0B]
mov     r3,#0x80 //Check if NPC
and     r2,r3
cmp     r2,#0x0
beq 	Breakable
b 		toEnd

ItemCharCheck:
cmp     r1,#0x0
bne     Breakable//if byte is 0, all items are breakable regardless of team
ldrb    r2,[r5,#0x0B]
mov     r3,#0x40 //Check if enemy
and     r2,r3
cmp     r2,#0x0
beq     ItemCheckNPC
b		toEnd

ItemCheckNPC:
ldrb    r2,[r5,#0x0B]
mov     r3,#0x80 //Check if NPC
and     r2,r3
cmp     r2,#0x0
beq 	Breakable
b 		toEnd

Breakable:  
mov     r2,r0             //-----------
mov     r1,#0xFF          //
and     r1,r2             //this is all vanilla code
lsl     r0,r1,#0x3        //
add     r0,r0,r1          //
lsl     r0,r0,#0x2        //-----------
ldr     r1,=#0x8016AFB
bx      r1

toEnd:             
pop     {r1}       
bx      r1         