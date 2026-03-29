.thumb

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

@r0=char data ptr

.equ StealID, SkillTester+4
.equ StealPlusID, StealID+4
.equ AlsoUseCheckVanillaSteal, StealPlusID+4

push	{r0-r5,r14}
ldr		r4,=#0x03004E50
ldr   r4,[r4]
mov   r0,r4
ldr		r5,SkillTester
ldr		r1,StealID
mov		r14,r5
.short	0xF800
cmp		r0,#0
bne		RetTrue
mov		r0,r4
ldr		r1,StealPlusID
mov		r14,r5
.short	0xF800
cmp		r0,#0
bne		RetTrue

RetFlase:
b		GoBack

RetTrue:
pop   {r0-r5}
ldr r3,AlsoUseCheckVanillaSteal
bx r3

GoBack:
pop		{r0-r5}
mov   r0,#3
pop		{r1}
bx		r1


.align
.ltorg
SkillTester:
