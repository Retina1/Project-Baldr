.thumb

push    {r14}         
lsr r5,r5,#0x18
ldr r0,[r4,#0x2c]
mov    r2,#0x4       
add    r1,r0,#0x0     
add    r1,#0x26      
stopThree:
ldrh    r0,[r1]     
cmp     r0,#0x0       
beq     stopOne
add    r0,r2,#0x1     
b       stopTwo
stopOne:
sub    r1,#0x2 
sub    r2,#0x1       
cmp     r2,#0x0       
bge     stopThree
mov    r0,#0x0     
stopTwo:
pop     {r1}
cmp r0,#0x4
bgt alpha
ldr r2,=#0x03005257
ldrb r2,[r2]
mov r6,#0x1
and r2,r6
cmp r2,#0x1
beq beta
ldr r2,=#0x202bcf0
add r2,r2,#0x14
ldrb r2,[r2]
lsl r2,r2,#0x18
lsr r2,r2,#0x1C
lsl r2,r2,#0x4
cmp r2,#0x10
bne alpha
beta:
add r6,r0,#0x0
ldr r4,=#0x02013648
ldr r2,=#0x0809D65D
bx      r2
alpha:
mov r6,#0x5
mov r0,#0x5
ldr r4,=#0x02013648
ldr r2,=#0x0809D65D
bx      r2
