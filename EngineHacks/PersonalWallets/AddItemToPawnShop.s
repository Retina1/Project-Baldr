.thumb

push		{r0-r7,r14}

ldr     r7,=#0x3003750
mov 	r3,#0
mov 	r4,#0
ldr 	r1,=#0x20282F0
ldr 	r5,=#0x100
ThirdLoop:
ldrh 	r2,[r7,r4]
cmp 	r0,#0
beq 	skipLoop
cmp 	r2,#0
bne 	skipLoop
strh 	r0,[r7,r3]
strh 	r0,[r1,r3]
add 	r3,r3,#2
add 	r4,r4,#2
mov 	r0,#0
skipLoop:
strh 	r2,[r7,r3]
strh 	r2,[r1,r3]
add 	r3,r3,#2
add 	r4,r4,#2
cmp		r3,r5
blt 	ThirdLoop
b 		done

done:
pop			{r0-r7}
pop			{r0}
bx			r0

