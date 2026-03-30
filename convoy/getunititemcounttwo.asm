.thumb

push    {r14}         
ldr r0,[r5,#0x2c]
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
mov r0,#0x1
and r2,r0
cmp r2,#0x1
beq beta


ldr r2,=#0x202bcf0
add r2,r2,#0x14
ldrb r2,[r2]
mov r0,#0x18
lsl r2,r2,r0
mov r0,#0x1C
lsr r2,r2,r0
lsl r2,r2,#0x4
cmp r2,#0x10
bne alpha
beta:
ldrb r2,[r4]
ldr r0,=#0x0809dd7D
bx      r0
alpha:
ldr r0,=#0x0809ddCD
bx      r0
