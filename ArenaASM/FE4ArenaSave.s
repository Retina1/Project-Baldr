
.thumb

.macro blh to, reg
    ldr \reg, =\to
    mov lr, \reg
    .short 0xF800
.endm

.equ WriteAndVerifySramFast, 0x080D184C @ r0 = source, r1 = destination, r2 = size.
.equ ReadSramFastAddr, 0x030067A0 @ r0 = source, r1 = destination, r2 = size.

.global ESU_SaveArenaProgress
.type ESU_SaveArenaProgress, %function
ESU_SaveArenaProgress: @ r0 = Sram target address, r1 = size.

push { r4, r5, lr }
mov r4, r0
mov r5, r1
ldr r0,=#0x02028250
mov r1, r4
mov r2, r5
blh WriteAndVerifySramFast, r3
pop { r4, r5 }
pop { r0 }
bx r0

.global ESU_LoadArenaProgress
.type ESU_LoadArenaProgress, %function
ESU_LoadArenaProgress: @ r0 = Sram source address, r1 = size.
push { r4, r5, lr }
mov r4, r0
mov r5, r1
ldr r0,=#0x02028250
mov r1, r0
mov r0, r4
mov r2, r5
@ blh ReadSramFast, r3 @ So... this would be nice to do, but this function is weird. Its in RAM, and we load the pointer to it.
ldr r3, =ReadSramFastAddr
ldr r3, [ r3 ]
bl BXR3
pop { r4, r5 }
pop { r0 }
bx r0

BXR3:
bx r3

.global ClearArenaProgress
.type ClearArenaProgress, %function
ClearArenaProgress: 

@Clear arena progress
@S1 = unit ID to target; first unit with this ID will be affected
@S2 = Fatigue Byte

.thumb

push        {r4,r5,r14}
ldr         r4,=#0x02028250
ldr         r5,=#0x02028250
mov         r2,#0x4A
mov         r1,#0x0
mov 		r3,#0x0
LOOP:
cmp			r1,r2
beq			END
strb 		r3,[r5]
add 		r1,r1,#0x1
add 		r5,r4,r1
b 			LOOP
END:
pop         {r4,r5}
pop         {r0}
bx          r0


