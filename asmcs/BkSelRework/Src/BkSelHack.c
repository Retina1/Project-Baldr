
// ====================================================

// C-Lib version: FE-CLib-Mokha
// https://github.com/MokhaLeee/FE-CLib-Mokha.git

#include "gbafe.h"
// ====================================================




struct Proc_BKSEL{
	
	/* 00 */ PROC_HEADER;
	/* 29 */ u8 pad[0x32 - 0x29];
	/* 32 */ u8 mode;
	/* 33 */ u8 stat;
	/* 34 */ u8 unk_34;
	/* 35 */ s8 pos;		// left = 1, middle = 0, right = -1
	/* 36 */ u8 unk_36[0x38 - 0x36];
	/* 38 */ struct TextHandle* texts[6];
	/* 50 */ u8 act_hit;
	/* 51 */ u8 tar_hit;
	/* 52 */ u8 act_eff;	// bool
	/* 53 */ u8 tar_eff;	// bool
};





void AddWeaponStatsAfterRound(struct BattleUnit* bu, u8 *hit, int *item_use){
	
	if( *item_use <= 0 )
		return;
	
	(*hit)++;
	(*item_use)--;
	
	if( IA_BRAVE & bu->weaponAttributes )
	{
		(*hit)++;
		(*item_use)--;
	}
}




void BKSEL_SetupHitAndSuchStats(struct Proc_BKSEL *proc){
	
	struct BattleUnit *double_bu, *tmp_bu;
	
	int act_itemuse = GetItemUses(gBattleActor.weaponBefore);
	int tar_itemuse = GetItemUses(gBattleTarget.weaponBefore);
	
	int double_bool = BattleGetFollowUpOrder(&double_bu, &tmp_bu);
	
	
	// judge attacker
	
	proc->act_hit = 0;
	proc->act_eff = 0;
	
	if( (0 != gBattleActor.weapon) || (0 != gBattleActor.weaponBroke) )
	{
		AddWeaponStatsAfterRound(&gBattleActor, &proc->act_hit, &act_itemuse);
		
		if( (0 != double_bool) && (&gBattleActor == double_bu) )
			AddWeaponStatsAfterRound(&gBattleActor, &proc->act_hit, &act_itemuse);
		
		if( 0 != IsUnitEffectiveAgainst(&gBattleActor.unit, &gBattleTarget.unit) )
			proc->act_eff = 1;
		
		if( 0 != IsItemEffectiveAgainst(gBattleActor.weaponBefore, &gBattleTarget.unit) )
			proc->act_eff = 1;
		
		if( (gBattleActor.wTriangleHitBonus > 0) && (IA_REVERTTRIANGLE & gBattleActor.weaponAttributes) )
			proc->act_eff = 1;
	}
	
	// judge target
	
	proc->tar_hit = 0;
	proc->tar_eff = 0;
		
	if( (0 != gBattleTarget.weapon) || (0 != gBattleTarget.weaponBroke) )
	{
		AddWeaponStatsAfterRound(&gBattleTarget, &proc->tar_hit, &tar_itemuse);
		
		if( (0 != double_bool) && (&gBattleTarget == double_bu) )
			AddWeaponStatsAfterRound(&gBattleTarget, &proc->tar_hit, &tar_itemuse);
		
		if( 0 != IsUnitEffectiveAgainst(&gBattleTarget.unit, &gBattleActor.unit) )
			proc->tar_eff = 1;
		
		if( 0 != IsItemEffectiveAgainst(gBattleTarget.weaponBefore, &gBattleActor.unit) )
			proc->tar_eff = 1;
		
		if( (gBattleTarget.wTriangleHitBonus > 0) && (IA_REVERTTRIANGLE & gBattleTarget.weaponAttributes) )
			proc->tar_eff = 1;
	}
	
	
	// Update Obj here
	extern const u8 Gfx_BkSel[11][0x40];

	switch(proc->act_hit){
		case 0:
		case 1:
			CopyTileGfxForObj(Gfx_BkSel[0], OBJ_VRAM0 + 0x5D00, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[0], OBJ_VRAM0 + 0x5D20, 1, 2);
			break;
		
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
			CopyTileGfxForObj(Gfx_BkSel[1], OBJ_VRAM0 + 0x5D00, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[proc->act_hit], OBJ_VRAM0 + 0x5D20, 1, 2);
			break;
		
		default:
			CopyTileGfxForObj(Gfx_BkSel[1], OBJ_VRAM0 + 0x5D00, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[10], OBJ_VRAM0 + 0x5D20, 1, 2);
			break;
	};
	
	switch(proc->tar_hit){
		case 0:
		case 1:
			CopyTileGfxForObj(Gfx_BkSel[0], OBJ_VRAM0 + 0x5D40, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[0], OBJ_VRAM0 + 0x5D60, 1, 2);
			break;
		
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
			CopyTileGfxForObj(Gfx_BkSel[1], OBJ_VRAM0 + 0x5D40, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[proc->tar_hit], OBJ_VRAM0 + 0x5D60, 1, 2);
			break;
		
		default:
			CopyTileGfxForObj(Gfx_BkSel[1], OBJ_VRAM0 + 0x5D40, 1, 2);
			CopyTileGfxForObj(Gfx_BkSel[10], OBJ_VRAM0 + 0x5D60, 1, 2);
			break;
	};
}


