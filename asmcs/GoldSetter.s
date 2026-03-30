.thumb

push		{r4,r5,r14}
ldr			r4, MemorySlots
ldr			r2,[r4,#0x4]
cmp			r2,#0x0
ble		End_false
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
bhs			End_false
b		UnitSearchLoop



MatchFound:
ldrb			r1,[r0,#0xB]	@Unit state bitfield
strb 		r1,[r4,#0x4]
End_false:
pop			{r4,r5}
pop			{r0}
bx			r0

.align 2
MemorySlots:
.long		0x030004B8
DeploymentOffsList:
.long		0x0859A5D0
