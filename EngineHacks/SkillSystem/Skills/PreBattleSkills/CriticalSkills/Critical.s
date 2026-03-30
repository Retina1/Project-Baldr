.thumb
.equ CriticalIDList, SkillTester+4
push {r4-r7, lr}
mov 	r5, r0

mov     r0,r5       @Move unit data into r0.
ldr r1,=#0x020281F0
mov r3,#0x48
add r0,r0,r3
ldrb r0,[r0]
add r1,r1,r0
ldrb r4,[r1]
mov r3,#0x31
cmp r4,r3
blt CheckLooper
sub r4,r4,r3
@check unit is player or don't add bonus
mov     r0,r5       @Move unit data into r0.
add 	r0,#0x0B
ldrb 	r0,[r0]
mov 	r3,#0x40
cmp r0,r3
bgt CheckLooper
@Normal calc
mov     r0,r5       @Move unit data into r0.
add     r0,#0x66    @Move to the attacker's crit.
ldrh    r3,[r0]     @Load the attacker's crit into r3.
add		r3,r3,r4	@add weapon kill bonus
strh    r3,[r0]     @Store attacker avoid.
CheckLooper:
mov     r4,#0 @loop counter
CheckLoop:
mov 	r0, r5
ldr     r2,CriticalIDList   @Load in the list of critical Skills.
ldrb    r1,[r2,r4]  @Load in the next critical Skill in the list.
ldr     r3,SkillTester
mov     lr, r3     
.short 0xf800       @Call Skill Tester.
cmp r0, #0          @Check if unit has the corresponding critical skill.
bne SkillChecks
SkillReturn:
add     r4, #0x01
cmp     r4, #0x02
bne     CheckLoop
b       EndProgram
SkillChecks:
cmp     r4, #0x00
beq     ForceSkill
cmp     r4, #0x01
beq     MachineSkill
ForceSkill:
mov     r0,r5       @Move unit data into r0.

mov		r1,#0x15	@Position of unit skill
ldrb	r2,[r0,r1]  @Get unit's skill

add     r0,#0x66    @Move to the attacker's crit.
ldrh    r3,[r0]     @Load the attacker's crit into r3.
add     r3,r3,r2    @Add r2 to the attacker's crit.
strh    r3,[r0]     @Store attacker crit.
b       SkillReturn
MachineSkill:
mov     r0,r5       @Move unit data into r0.
add     r0,#0x66    @Move to the attacker's crit.
ldrh    r3,[r0]     @Load the attacker's crit into r3.
lsl		r3,r3,#0x01		@Double critical
strh    r3,[r0]     @Store attacker avoid.
EndProgram:
pop {r4-r7}
pop {r0}
bx r0
 
.align
.ltorg
SkillTester:
@POIN SkillTester
@POIN CriticalIDList
