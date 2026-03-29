//080B4270 start

.thumb

.macro blh to, reg
  ldr \reg, =\to
  mov lr, \reg
 .short 0xf800
.endm


mov     r7,r0                  
mov     r0,r7                  
add     r0,#0x61               
strb    r5,[r0]                
mov     r0,r8                  
str     r0,[r7,#0x2C]          
ldr     r5,=#0x8A39170     
cmp     r6,#0x0                
beq     RealShop               
mov     r5,r6                  
RealShop:
mov     r4,r7                  
add     r4,#0x30               
mov     r6,#0xFF  //255 item cap             

ldrb    r0,[r5]
ldr 	r3,=#0x02028548
ldrb 	r3,[r3]
cmp 	r0,r3
beq 	ReloadSameStore
ldr 	r3,=#0x02028548
strb 	r0,[r3]

push    {r4}

//03003750 free fram 0x268 bytes long
ldr     r4,=#0x3003750
//we need to initialize all of these 0x200 bytes to 0
mov     r0,#0x00
mov     r1,#0x04
mov     r2,#0x00
ldr     r3,=#0x200

LoopInitizalize:
str     r0,[r4,r2]
add     r2,r1
cmp     r2,r3
bne     LoopInitizalize

@Add items to shop array only if new chapter
add 	r5,#0x2
LoadLoop:



ldrh    r0,[r5]                 
add     r5,#0x2                 
blh     0x8016540, r3//get uses 
strh    r0,[r4]      //store item to free ram spot
add     r4,#0x2                 
sub     r6,#0x1      
cmp     r0,#0x00
beq     EndNewStore
cmp     r6,#0x0                 
bhi     LoadLoop
EndNewStore:

push {r0-r7}
ldr r7,=#0x020282F0
sub r4,r4,#2
SecondLoop:
ldrh r0,[r7]
blh     0x8016540, r3//get uses 
strh    r0,[r4]      //store item to free ram spot
add     r4,#0x2
add     r7,#0x2                 
sub     r6,#0x1      
cmp     r0,#0x00
beq     EndNewStoreTwo
cmp     r6,#0x0                 
bhi     SecondLoop

EndNewStoreTwo:
mov 	r3,#0
ldr 	r6,=#0x100
ldr     r0,=#0x3003750
ldr 	r1,=#0x20282F0
ThirdLoop:
ldrb 	r2,[r0,r3]
strb 	r2,[r1,r3]
add 	r3,r3,#1
cmp		r3,r6
blt 	ThirdLoop
pop {r0-r7}

b End

ReloadSameStore:
push    {r4}
push {r0-r7}
mov 	r3,#0
ldr 	r6,=#0x100
ldr     r0,=#0x3003750
ldr 	r1,=#0x20282F0
FourthLoop:
ldrb 	r2,[r1,r3]
strb 	r2,[r0,r3]
add 	r3,r3,#1
cmp		r3,r6
blt 	FourthLoop
pop {r0-r7}

//03003750 free fram 0x268 bytes long
@ldr     r4,=#0x3003750
@add 	r5,#0x2
@ReloadSameStoreLoadLoop:
@ldrh    r0,[r5]                 
@add     r5,#0x2                 
@blh     0x8016540, r3//get uses 
@strh    r0,[r4]      //store item to free ram spot
@add     r4,#0x2                 
@sub     r6,#0x1      
@cmp     r0,#0x00
@beq     End           
@cmp     r6,#0x0                 
@bhi     ReloadSameStoreLoadLoop

End:
pop     {r4}

mov     r0,r7                   
blh     0x80B42B4, r3//current unit items??     
     
pop     {r3}                  
mov     r8,r3        
pop     {r4-r7}   
              
pop     {r0}       
             
bx      r0          
            