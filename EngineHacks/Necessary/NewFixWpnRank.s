.thumb
.align 4
FixWpnRnkHook:
	@ STATE: r7 is a bu
	mov  r0, #0x50 @ BattleUnit.wpnType
	ldrb r0, [r7, r0]
	cmp r0, #0x15
	beq GainsW
	cmp r0,#0x25
	beq GainsT
	cmp r0, #7 @ Dark wep type 
	bgt no_gains @ If we are using monster weapons etc., don't try to give wexp lol 
	b LoadWeaponOld
	GainsW:
	mov r0, #0x3B
	ldrb r0, [r7, r0]
	cmp r2,#0x15
	bne checkRank
	pop {r4}
	mov r4,r0
	push {r4}
	b checkRank
	GainsT:
	mov r0, #0x47
	ldrb r0, [r7, r0]
	cmp r2,#0x25
	bne checkRank
	pop {r4}
	mov r4,r0
	push {r4}
	b checkRank
	LoadWeaponOld:
	add  r0, #0x28 @ BattleUnit.unit.wexp
	ldrb r0, [r7, r0]

	checkRank:
	cmp r0, #0
	beq no_gains

	@ REPLACED
	mov  r0, #0x52
	ldrb r0, [r7, r0]

	ldr r3, =0x0802C0FA+1
	bx  r3

no_gains:
	mov r0, #1
	neg r0, r0

	ldr r3, =0x0802C1AA+1
	bx  r3
	