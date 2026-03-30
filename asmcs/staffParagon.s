.thumb
.align
.equ ChapterData, 0x202BCF0
.equ ParagonID, SkillTester+4
add    r2,r0,#0x0    
add    r2,#0x0A     
ldr    r0,[r4]    
ldr    r1,[r4,#0x4] 
ldr    r0,[r0,#0x28]
ldr    r1,[r1,#0x28]
orr    r0,r1
push   {r0,r4}

ldr r0, =ChapterData
mov r1, #0x42
ldrb r1, [r0, r1]

mov r4, #0x20 @ Set if not easy mode
tst r1, r4
bne NotEasyMode
lsl r2, r2, #0x01 @ Double EXP if they have Paragon.
b End
NotEasyMode:
push {r2}
mov r0, r1
ldr r1, ParagonID
ldr r4, SkillTester
mov lr, r4
.short 0xF800
pop {r2}
cmp r0, #0x00
beq End
    lsl r2, r2, #0x01 @ Double EXP if they have Paragon.
End:
pop { r4 }
pop { r0 }


ldr r1, =#0x802C683
bx r1

.ltorg
.align

SkillTester:
@POIN SkillTester
@WORD ParagonID
