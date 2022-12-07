.thumb

push    {r4-r6,r14}
sub     sp,#0x4 //vanilla code
mov     r6,r0	//vanilla code

//r1 has anticheesebyte
push    {r4-r6}
ldr     r0,=#0x202BE4C//Char struct
mov     r2,#0x0//resetter
mov     r3,#0x0//counter to loop with
Loop:
//ldr     r5,[r0]
//ldr     r4,=#0x8803D64
//cmp     r5,r4
//blo     EndItemStore
//ldr     r4,=#0x88070FC
//cmp     r5,r4
//bhi     EndItemStore
//ldrb    r5,[r0,#0xC]
//mov     r6,#0x5 
//and     r5,r6
//cmp     r5,#0x5
//beq     DeadItemStore
//EndItemStore:
strb    r2,[r0,r1]//sets byte to 0
add     r0,#0x48//increases offset to the next charstruct
add     r3,#0x1
cmp     r3,#0x3E//there's 62 total charstruct slots, 0 to 61
blo     Loop
pop 	{r4-r6}
mov     r0,#0x0//HAS to be 0 when we're done
ldr     r1,=#0x8030E0D
bx      r1

//DeadItemStore:
//mov     r4,#0x1E//Item offset
//ldr		r5,[r0]
//ldrb	r5,[r5,#4]
//cmp		r5,#0xD0
//blt		Nulling
//cmp		r5,#0xEF
//bgt		Nulling
//b       LoopItemStore
//Nulling:
//str     r2,[r0]
//LoopItemStore:
//ldrh    r5,[r0,r4]
//cmp     r5,#0x0
//beq     EndItemStore
//cmp     r4,#0x28
//beq     EndItemStore
//push    {r0-r3}
//ldr     r0,=#0x08031570
//mov     r14,r0
//.short 	0xF800//r0 holds number of items in convoy
//cmp     r0,#0xFE
//pop     {r0-r3}
//bhs     EndItemStore
//push    {r0-r3}
//strh    r2,[r0,r4]//null out the item to be stored
//mov     r0,r5
//ldr     r3,=#0x8031594
//mov     r14,r3
//.short 	0xF800//Item stored to convoy
//pop     {r0-r3}
//add     r4,#0x02
//b       LoopItemStore
//