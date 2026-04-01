.thumb

push		{r4,r5,r14}
ldr			r4, MemorySlots
ldr			r0,[r4,#0x4]
ldr 	r3, SetGold
mov		r14,r3
.short	0xF800
pop			{r4,r5}
pop			{r0}
bx			r0

.align 2
MemorySlots:
.long		0x030004B8
SetGold:
@GoldPointer
