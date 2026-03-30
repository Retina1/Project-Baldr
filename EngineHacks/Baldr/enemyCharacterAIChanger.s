.thumb

push		{r4,r5,r14}
ldr			r4, MemorySlots
ldr			r2,[r4,#0x4]
mov			r4,#0x0
cmp			r2,#0x0
ble		End
ldr			r5,DeploymentOffsList
mov			r3,#0x1			@r3 is loop counter
UnitSearchLoop:
lsl			r0,r3,#0x2
ldr			r0,[r5,r0]
cmp			r0,#0x0
beq		SearchLoopCount
ldr			r1,[r0]			@Loading character data pointer
cmp			r1,#0x0
beq		SearchLoopCount
ldrb		r1,[r1,#0x4]
cmp			r1,r2			@Is this the character we're looking for?
beq		MatchFound
SearchLoopCount:
add			r3,#0x1
cmp			r3,#0x55		@Searches through all player/NPC units
beq			End
ldr			r4, MemorySlots
ldr			r2,[r4,#0x4]
b		UnitSearchLoop

MatchFound:
ldr			r4, MemorySlots
ldr			r2,[r4,#0x8]
mov 		r4,#0x40
add 		r1,r0,r4
mov 		r4,#0x18 //AI 3
lsr			r2,r2,r4
strb		r2,[r1]
ldr			r4, MemorySlots
ldr			r2,[r4,#0x8]
mov 		r4,#0x10 //AI 4
lsr			r2,r2,r4
strb		r2,[r1,#0x1]
ldr			r4, MemorySlots
ldr			r2,[r4,#0x8]
mov 		r4,#0x8 //AI 1
lsr			r2,r2,r4
strb		r2,[r1,#0x2]
ldr			r4, MemorySlots
ldr			r2,[r4,#0x8]
mov 		r4,#0x0 //AI 2
lsr			r2,r2,r4
strb		r2,[r1,#0x4]
b 			SearchLoopCount
End:


pop			{r4,r5}
pop			{r0}
bx			r0

.align 4
MemorySlots:
.long		0x030004B8
DeploymentOffsList:
.long		0x0859A7D0

