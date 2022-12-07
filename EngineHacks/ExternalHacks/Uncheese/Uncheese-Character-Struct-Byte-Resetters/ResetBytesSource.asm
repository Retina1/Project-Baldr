.thumb

push    {r4-r6,r14}
sub     sp,#0x4 //vanilla code
mov     r6,r0	//vanilla code

//r1 has anticheesebyte

ldr     r0,=#0x202BE4C//Char struct
add     r0,r1//r0 has anticheesebyte charstruct offset
mov     r2,#0x0//r2 will be our counter to offset with
mov     r1,#0x00//r1 has 0, resetting the value of anticheese
mov     r3,#0x0//counter to loop with
Loop:
strb    r1,[r0,r2]//sets byte to 0
add     r2,#0x48//increases offset to the next charstruct
add     r3,#0x1
cmp     r3,#0x3E//there's 62 total charstruct slots, 0 to 61
blo     Loop
mov     r0,#0x0//HAS to be 0 when we're done
ldr     r1,=#0x8030E0D
bx      r1