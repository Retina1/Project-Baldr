.thumb

.global ReturnOne
.global GetChapterMode
.global IsOnPrepScreen
.global IsInChapter
.global IsSigurd
.global IsAlec
.global IsArden
.global IsNaoise
.global IsAzelle
.global IsLex
.global IsQuan
.global IsEthlyn
.global IsFinn
.global IsMidir
.global IsEdain
.global IsDew
.global IsAyra
.global IsJamke
.global IsDeirdre
.global IsLachesis
.global IsChulainn
.global IsBeowolf
.global IsLewyn
.global IsSilvia
.global IsErinys
.global IsHopper
.global IsIndech
.global IsClaud
.global IsTailtiu
.global IsCallista
.global IsBrigid
.global IsLarceiCreidne
.global IsScathachDalvin
.global IsLanaMuirne
.global IsDiarmuidTristan
.global IsLesterDeimne
.global IsFeeHermina
.global IsArthurAmid
.global IsPattyDaisy
.global IsLeneLaylea
.global IsZagreusMelchior
.global IsTineLinda
.global IsFebailAsaello
.global IsPersephoneNehalennia
.global IsCedHawk
.global IsCoirpreCharlot
.global IsOifey
.global IsJulia
.global IsLucharLucharba
.global IsShannan
.global IsAres
.global IsAife
.global IsLeif
.global IsClement
.global IsHannibal
.global IsShannam
.global IsAltena
.global IsSaias
.global IsArion
.global IsNannaJeanne

ReturnOne:
mov		r0,#1
bx		r14


IsAlec:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#3
bne		LabelAlec
mov		r0,#1
b Label2
LabelAlec:
cmp		r1,#0x4B
bne		Label2
mov		r0,#1
Label2:
bx		r14
.ltorg


IsSigurd:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#1
bne		LabelSigurd
mov		r0,#1
b Label1
LabelSigurd:
cmp		r1,#2
bne		Label1
mov		r0,#1
Label1:
bx		r14
.ltorg

IsArden:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#5
bne		LabelArden
mov		r0,#1
b Label3
LabelArden:
cmp		r1,#0x4B
bne		Label3
mov		r0,#1
Label3:
bx		r14
.ltorg

IsNaoise:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#4
bne		LabelNaoise
mov		r0,#1
b Label4
LabelNaoise:
cmp		r1,#0x4B
bne		Label4
mov		r0,#1
Label4:
bx		r14
.ltorg

IsAzelle:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#6
bne		LabelAzelle
mov		r0,#1
b Label6
LabelAzelle:
cmp		r1,#0x4B
bne		Label6
mov		r0,#1
Label6:
bx		r14
.ltorg

IsLex:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#7
bne		LabelLex
mov		r0,#1
b Label7
LabelLex:
cmp		r1,#0x4B
bne		Label7
mov		r0,#1
Label7:
bx		r14
.ltorg

IsQuan:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#8
bne		LabelQuan
mov		r0,#1
b Label8
LabelQuan:
cmp		r1,#0x4B
bne		Label8
mov		r0,#1
Label8:
bx		r14
.ltorg

IsEthlyn:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#9
bne		LabelEthlyn
mov		r0,#1
b Label9
LabelEthlyn:
cmp		r1,#0x4B
bne		Label9
mov		r0,#1
Label9:
bx		r14
.ltorg

IsFinn:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xA
bne		LabelFinn
mov		r0,#1
b LabelA
LabelFinn:
cmp		r1,#0x4B
bne		LabelA
mov		r0,#1
LabelA:
bx		r14
.ltorg

IsMidir:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xB
bne		LabelMidir
mov		r0,#1
b LabelB
LabelMidir:
cmp		r1,#0x4B
bne		LabelB
mov		r0,#1
LabelB:
bx		r14
.ltorg

IsEdain:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xC
bne		LabelEdain
mov		r0,#1
b LabelC
LabelEdain:
cmp		r1,#0x4B
bne		LabelC
mov		r0,#1
LabelC:
bx		r14
.ltorg

IsDew:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xD
bne		LabelDew
mov		r0,#1
b LabelD
LabelDew:
cmp		r1,#0x4B
bne		LabelD
mov		r0,#1
LabelD:
bx		r14
.ltorg

IsAyra:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xE
bne		LabelAyra
mov		r0,#1
b LabelE
LabelAyra:
cmp		r1,#0x4B
bne		LabelE
mov		r0,#1
LabelE:
bx		r14
.ltorg

IsJamke:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0xF
bne		LabelJamke
mov		r0,#1
b LabelF
LabelJamke:
cmp		r1,#0x4B
bne		LabelF
mov		r0,#1
LabelF:
bx		r14
.ltorg

IsDeirdre:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x10
bne		LabelDeirdre
mov		r0,#1
b Label10
LabelDeirdre:
cmp		r1,#0x4B
bne		Label10
mov		r0,#1
Label10:
bx		r14
.ltorg

IsLachesis:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x11
bne		LabelLachesis
mov		r0,#1
b Label11
LabelLachesis:
cmp		r1,#0x4B
bne		Label11
mov		r0,#1
Label11:
bx		r14
.ltorg

IsChulainn:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x12
bne		LabelChulainn
mov		r0,#1
b Label12
LabelChulainn:
cmp		r1,#0x4B
bne		Label12
mov		r0,#1
Label12:
bx		r14
.ltorg

IsBeowolf:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x13
bne		LabelBeowolf
mov		r0,#1
b Label13
LabelBeowolf:
cmp		r1,#0x4B
bne		Label13
mov		r0,#1
Label13:
bx		r14
.ltorg

IsLewyn:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x14
bne		LabelLewyn
mov		r0,#1
b Label14
LabelLewyn:
cmp		r1,#0x4B
bne		Label14
mov		r0,#1
Label14:
bx		r14
.ltorg

IsSilvia:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x15
bne		LabelSilvia
mov		r0,#1
b Label15
LabelSilvia:
cmp		r1,#0x4B
bne		Label15
mov		r0,#1
Label15:
bx		r14
.ltorg

IsErinys:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x16
bne		LabelErinys
mov		r0,#1
b Label16
LabelErinys:
cmp		r1,#0x4B
bne		Label16
mov		r0,#1
Label16:
bx		r14
.ltorg

IsHopper:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x17
bne		LabelHopper
mov		r0,#1
b Label17
LabelHopper:
cmp		r1,#0x4B
bne		Label17
mov		r0,#1
Label17:
bx		r14
.ltorg

IsIndech:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x18
bne		LabelIndech
mov		r0,#1
b Label18
LabelIndech:
cmp		r1,#0x4B
bne		Label18
mov		r0,#1
Label18:
bx		r14
.ltorg

IsClaud:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x19
bne		LabelClaud
mov		r0,#1
b Label19
LabelClaud:
cmp		r1,#0x4B
bne		Label19
mov		r0,#1
Label19:
bx		r14
.ltorg

IsTailtiu:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x1A
bne		LabelTailtiu
mov		r0,#1
b Label1A
LabelTailtiu:
cmp		r1,#0x4B
bne		Label1A
mov		r0,#1
Label1A:
bx		r14
.ltorg

IsCallista:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x1B
bne		LabelCallista
mov		r0,#1
b Label1B
LabelCallista:
cmp		r1,#0x4B
bne		Label1B
mov		r0,#1
Label1B:
bx		r14
.ltorg

IsBrigid:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x1C
bne		LabelBrigid
mov		r0,#1
b Label1C
LabelBrigid:
cmp		r1,#0x4B
bne		Label1C
mov		r0,#1
Label1C:
bx		r14
.ltorg

IsLarceiCreidne:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x1D
bne		LabelLarcei
mov		r0,#1
b Label1D
LabelLarcei:
cmp		r1,#0x1E
bne		Label1D
mov		r0,#1
Label1D:
bx		r14
.ltorg

IsScathachDalvin:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x1F
bne		LabelScathach
mov		r0,#1
b Label1F
LabelScathach:
cmp		r1,#0x20
bne		Label1F
mov		r0,#1
Label1F:
bx		r14
.ltorg

IsLanaMuirne:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x21
bne		LabelLana
mov		r0,#1
b Label21
LabelLana:
cmp		r1,#0x22
bne		Label21
mov		r0,#1
Label21:
bx		r14
.ltorg

IsDiarmuidTristan:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x23
bne		LabelDiarmuid
mov		r0,#1
b Label23
LabelDiarmuid:
cmp		r1,#0x24
bne		Label23
mov		r0,#1
Label23:
bx		r14
.ltorg

IsLesterDeimne:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x25
bne		LabelLester
mov		r0,#1
b Label25
LabelLester:
cmp		r1,#0x26
bne		Label25
mov		r0,#1
Label25:
bx		r14
.ltorg

IsFeeHermina:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x27
bne		LabelFee
mov		r0,#1
b Label27
LabelFee:
cmp		r1,#0x28
bne		Label27
mov		r0,#1
Label27:
bx		r14
.ltorg

IsArthurAmid:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x29
bne		LabelArthur
mov		r0,#1
b Label29
LabelArthur:
cmp		r1,#0x2A
bne		Label29
mov		r0,#1
Label29:
bx		r14
.ltorg

IsPattyDaisy:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x2B
bne		LabelPatty
mov		r0,#1
b Label2B
LabelPatty:
cmp		r1,#0x2C
bne		Label2B
mov		r0,#1
Label2B:
bx		r14
.ltorg

IsLeneLaylea:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x2F
bne		LabelLene
mov		r0,#1
b Label2F
LabelLene:
cmp		r1,#0x30
bne		Label2F
mov		r0,#1
Label2F:
bx		r14
.ltorg

IsZagreusMelchior:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x31
bne		LabelZagreus
mov		r0,#1
b Label31
LabelZagreus:
cmp		r1,#0x32
bne		Label31
mov		r0,#1
Label31:
bx		r14
.ltorg

IsTineLinda:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x33
bne		LabelTine
mov		r0,#1
b Label33
LabelTine:
cmp		r1,#0x34
bne		Label33
mov		r0,#1
Label33:
bx		r14
.ltorg

IsFebailAsaello:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x35
bne		LabelFebail
mov		r0,#1
b Label35
LabelFebail:
cmp		r1,#0x36
bne		Label35
mov		r0,#1
Label35:
bx		r14
.ltorg

IsPersephoneNehalennia:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x37
bne		LabelPersephone
mov		r0,#1
b Label37
LabelPersephone:
cmp		r1,#0x38
bne		Label37
mov		r0,#1
Label37:
bx		r14
.ltorg

IsCedHawk:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x39
bne		LabelCed
mov		r0,#1
b Label39
LabelCed:
cmp		r1,#0x3A
bne		Label39
mov		r0,#1
Label39:
bx		r14
.ltorg

IsCoirpreCharlot:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x3B
bne		LabelCoirpre
mov		r0,#1
b Label3B
LabelCoirpre:
cmp		r1,#0x3C
bne		Label3B
mov		r0,#1
Label3B:
bx		r14
.ltorg

IsOifey:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x3D
bne		LabelOifey
mov		r0,#1
b Label3D
LabelOifey:
cmp		r1,#0x4b
bne		Label3D
mov		r0,#1
Label3D:
bx		r14
.ltorg

IsJulia:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x3E
bne		LabelJulia
mov		r0,#1
b Label3E
LabelJulia:
cmp		r1,#0x4b
bne		Label3E
mov		r0,#1
Label3E:
bx		r14
.ltorg

IsLucharLucharba:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x3F
bne		LabelLuchar
mov		r0,#1
b Label3F
LabelLuchar:
cmp		r1,#0x40
bne		Label3F
mov		r0,#1
Label3F:
bx		r14
.ltorg

IsShannan:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x41
bne		LabelShannan
mov		r0,#1
b Label41
LabelShannan:
cmp		r1,#0x4b
bne		Label41
mov		r0,#1
Label41:
bx		r14
.ltorg

IsAres:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x42
bne		LabelAres
mov		r0,#1
b Label42
LabelAres:
cmp		r1,#0x4b
bne		Label42
mov		r0,#1
Label42:
bx		r14
.ltorg

IsAife:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x43
bne		LabelAife
mov		r0,#1
b Label43
LabelAife:
cmp		r1,#0x4b
bne		Label43
mov		r0,#1
Label43:
bx		r14
.ltorg

IsLeif:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x44
bne		LabelLeif
mov		r0,#1
b Label44
LabelLeif:
cmp		r1,#0x4b
bne		Label44
mov		r0,#1
Label44:
bx		r14
.ltorg

IsClement:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x45
bne		LabelClement
mov		r0,#1
b Label45
LabelClement:
cmp		r1,#0x4b
bne		Label45
mov		r0,#1
Label45:
bx		r14
.ltorg

IsHannibal:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x46
bne		LabelHannibal
mov		r0,#1
b Label46
LabelHannibal:
cmp		r1,#0x4b
bne		Label46
mov		r0,#1
Label46:
bx		r14
.ltorg

IsShannam:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x47
bne		LabelShannam
mov		r0,#1
b Label47
LabelShannam:
cmp		r1,#0x4b
bne		Label47
mov		r0,#1
Label47:
bx		r14
.ltorg

IsAltena:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x48
bne		LabelAltena
mov		r0,#1
b Label48
LabelAltena:
cmp		r1,#0x4b
bne		Label48
mov		r0,#1
Label48:
bx		r14
.ltorg

IsSaias:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x49
bne		LabelSaias
mov		r0,#1
b Label49
LabelSaias:
cmp		r1,#0x4b
bne		Label49
mov		r0,#1
Label49:
bx		r14
.ltorg

IsArion:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x4A
bne		LabelArion
mov		r0,#1
b Label4A
LabelArion:
cmp		r1,#0x4b
bne		Label4A
mov		r0,#1
Label4A:
bx		r14
.ltorg

IsNannaJeanne:
mov		r0,#0
ldr		r1,=#0x3004E50
ldr		r1,[r1]
ldr		r1,[r1]
ldrb	r1,[r1,#4]
cmp		r1,#0x2D
bne		LabelNanna
mov		r0,#1
b Label2D
LabelNanna:
cmp		r1,#0x2E
bne		Label2D
mov		r0,#1
Label2D:
bx		r14
.ltorg



GetChapterMode:
@ returns [gChapterData+0x1B]-1 (0 for prologue-ch8, 1 for eirika route, 2 for ephraim route, in vanilla FE8)
ldr		r0,=#0x202BCF0		@ gChapterData
ldrb	r0,[r0,#0x1B]
sub		r0,#1
bx		r14
.ltorg


IsOnPrepScreen:
mov		r0,#0
ldr		r1,=#0x202BCF0		@ gChapterData
ldrb	r1,[r1,#0x14]
mov		r2,#0x10			@ prep screen bit
tst		r1,r2
beq		End_IsOnPrepScreen
mov		r0,#1
End_IsOnPrepScreen:
bx		r14
.ltorg


IsInChapter:
mov		r0,#0
ldr		r1,=#0x202BCF0		@ gChapterData
ldrb	r1,[r1,#0x14]
mov		r2,#0x10			@ prep screen bit
tst		r1,r2
bne		End_IsInChapter
mov		r0,#1
End_IsInChapter:
bx		r14
.ltorg
