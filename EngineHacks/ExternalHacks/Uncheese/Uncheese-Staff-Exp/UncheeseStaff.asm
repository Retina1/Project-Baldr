.thumb
//r0 contains anticheesebyte
push {r5}

mov     r5,r0//r5 has anticheesebyte
ldr     r0,[r4]//r0 now contains staff user rom address
ldrb    r0,[r0,#0x4]//r0 now contains staff user character ID
push 	{r2} // r2 contains the staff exp, I won't bother trying to find it again
ldr     r1,=#0x0801829D//ram char data finder
mov     r14,r1
.short 	0xF800 //r0 now holds the staffer ram char data
mov     r3,r0
add 	r3,r5//Unused charstruct byte offset
pop     {r2,r5}
////
// Check if staffer is promoted

ldr     r0,[r4]
ldr     r1,[r4,#0x4]
ldr     r0,[r0,#0x28]
ldr     r1,[r1,#0x28]
orr     r0,r1
mov     r1,#0x80
lsl     r1,r1,#0x1
and     r0,r1

//r2 contains staff exp, r4 attacker pointer, r5 defender pointer

cmp     r0,#0x0 // if unit is not promoted, skip promoted penalty
beq     CalculateXPCut
lsr     r0,r2,#0x1F
add     r0,r2,r0
asr     r2,r0,#0x1

CalculateXPCut: //Check staff used by caster


mov 	r0,r4
add 	r0,#0x48
ldrh    r0,[r0]
lsl 	r0,#0x18
lsr		r0,#0x18//r0 contains staff ID

// The following list contains all the staves that will be checked for spam usage
// The branches correspond to the common staves item ID, heal mend and recover.

//// No Exp Gaidens
ldr     r4,=#0x202BCF0//chapter struct
ldrb    r4,[r4,#0x0E]//Ch ID offset
cmp     r4,#0x05
beq     NegateExpWexp
cmp     r4,#0x0B
beq     NegateExpWexp
cmp     r4,#0x11
beq     NegateExpWexp
cmp     r4,#0x1B
beq     NegateExpWexp
cmp     r4,#0x23
beq     NegateExpWexp



cmp 	r0,#0x4B//Heal
beq		CutXPCheck
cmp 	r0,#0x4C//Mend
beq 	CutXPCheck
cmp 	r0,#0x4D//Recover
beq 	CutXPCheck
cmp 	r0,#0x68//Bolster
beq 	CutXPCheck
cmp 	r0,#0x8E//Embolden
beq 	CutXPCheck
b 		NormalXP

CutXPCheck:

mov     r4,r3//need the address to store later
ldrb    r3,[r3]//r3 now contains staff uses by caster
cmp     r3,#0x10// if less than 10, we need to initialize in value 0x10
bhs 	Continue //To account for enemy recruitable staffers, 0x1 to 0x5 are used
				 //exclusively by enemies to check for combat rounds.
				 //0x10 onwards is used for counting staves on players.
				 //if a recruitable has combat rounds,
				 //this branch being false will reset it
mov     r3,#0x10
strb    r3,[r4]//store the new value

Continue:
mov     r1,#0x0 // r1 will hold the value to divide by
cmp		r3,#0x1A
blo GoToNormalXP//0x10,11,12,13,14,15,16,17,18,19
beq CutToEightyPercent//0x1A
cmp		r3,#0x1B	
beq CutToSixtyPercent
cmp		r3,#0x1C	
beq CutToFourtyPercent
cmp		r3,#0x1D	
beq CutToTwentyPercent
cmp		r3,#0x1E	
beq NegateExp
cmp		r3,#0x1F	
beq NegateExpWexp
mov		r3,#0x10//if you got this far, value was invalid and will be reset
b GoToNormalXP

//XP cutting is performed here
NegateExp:
ldrb    r3,[r4]//load the old staff usage
add 	r3,#0x1
strb    r3,[r4]//store the updated staff usage
NegateExpWexp:
mov     r2,#0x0
b 		NormalXP

CutToEightyPercent:
add     r1,#0x14
CutToSixtyPercent:
add     r1,#0x14
CutToFourtyPercent:
add     r1,#0x14
CutToTwentyPercent:
add     r1,#0x14//20
mul     r1,r2//multiply percent by xp
mov     r0,r1
mov     r1,#0x64//100
ldr 	r2,=#0x80D18FD//Thumb function for divisions, r0 is number to divide, r1 is the number to divide by
mov     r14,r2
.short 	0xF800 //r0 now holds the divided exp
mov     r2,r0

GoToNormalXP:
ldrb    r3,[r4]//load the old staff usage
add 	r3,#0x1
strb    r3,[r4]//store the updated staff usage
NormalXP:
cmp     r2,#0x64
ble     LowerThan100
mov     r2,#0x64
LowerThan100:
mov     r0,r2
pop     {r4}
pop     {r1}
bx      r1
