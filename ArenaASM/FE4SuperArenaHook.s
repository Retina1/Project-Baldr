.thumb


//push {r14}
add r3,r3,#0x34
mov r14,r3 
//r0,r3 Free
push {r1,r2,r5}
ldr r1,=#0x3004E50
ldr r1,[r1]
ldr r1,[r1]
ldrb r5,[r1,#0x4] @Get Unit ID
ldr r1,=#0x02028250
LOOP:
ldrb r2,[r1]
cmp r2,#0x0
beq setGold
cmp r2,r5
beq Found
add r1,r1,#0x2
b LOOP
Found:
add r1,r1,#0x1
ldrb r1,[r1]
ldr r2,=#0x1F4
mul r2,r2,r1

setGold:
ldr r0,=#0x3E8
add r0,r0,r2
pop {r1,r2,r5}
add r4,r4,r0
mov r0,r4

ldr r3,=#0x08024e04
bx r3

SuperArenaIncrement:
ldr r3,SuperArena
mov r14,r3
.short 0xF800

ldr r0,=#0x080B5B81
bx r0


.ltorg
.align 4

SuperArena:
@POIN SuperArena
