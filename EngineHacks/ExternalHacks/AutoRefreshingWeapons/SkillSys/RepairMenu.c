#include "gbafe.h"
#include "RepairMenu.h"


static u8 CalculateTargetUses(u16 gold, int item) {
	int total = GetItemUses(item);
	int repairableUses = 0;
	int maxUses = GetItemMaxUses(item);
	int currentUses = GetItemUses(item);
	int repairCost = GetItemCostPerUse(item);
	if (repairCost > 0) {
		repairableUses = gold / repairCost; //how many uses we can buy
	}
	if ( maxUses < (repairableUses + currentUses)) {
		total = maxUses;
	}
	else {
		total += repairableUses;
	}
	return total;
}
static u16 CalculateRepairGoldCost(u16 item, u8 targetUses) {
	return GetItemCostPerUse(GetItemIndex(item)) * (targetUses - GetItemUses(item));
}

void RepairMenu_OnSelect(void* parent) {
    Struct_RepairMenuProc* proc = (void*) Proc_StartBlocking(Proc_RepairMenu, parent);
	//try various visual initializers
	SetTextFont(0);
	InitSystemTextFont();
	LoadUiFrameGraphics();

	proc->activeUnit = GetUnitFromCharId(gEventSlots[0x1]);
	proc->gold = GetWalletEntry(proc->activeUnit->index)->gold;
	proc->maxItem = 0xff;
	proc->currentItem = 0;
	
	for (int i = 0; i < 5; i++) {
		if (proc->activeUnit->items[i]) {
			proc->item[i] = GetItemIndex(proc->activeUnit->items[i]);
			proc->itemUses[i] = GetItemUses(proc->activeUnit->items[i]);
			proc->itemTargetUses[i] = CalculateTargetUses(proc->gold,proc->activeUnit->items[i]);
			proc->itemCost[i] = CalculateRepairGoldCost(proc->activeUnit->items[i],proc->itemTargetUses[i]);
			proc->maxItem = i;
		}
	}

    StartMenu(&RepairMenu_MenuDef, (void*) proc);
}

#define PlaySfx(aSongId) do { \
	if (!gPlaySt.config.disableSoundEffects) \
		m4aSongNumStart(aSongId); \
} while (0)

//change sfx from 6b to some more normal scroll sound
//Handles what to do when buttons are pushed
static u8 RepairMenuIdle (MenuProc* menu, MenuItemProc* command) {
    Struct_RepairMenuProc* const proc = (void*) menu->proc_parent;

	if (proc->maxItem != 0xff) {
		if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT  || gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
			proc->currentItem += 1;
			if (proc->currentItem > proc->maxItem) {
				proc->currentItem = 0;
			}
			RepairMenuDraw(menu, command);
			PlaySfx(0x66);
		}
		if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT || gKeyStatusPtr->repeatedKeys & DPAD_UP) {
			if (proc->currentItem == 0) {
				proc->currentItem = proc->maxItem;
			}
			else {
				proc->currentItem -= 1;
			}
			RepairMenuDraw(menu, command);
			PlaySfx(0x66);
		}
	}
	
    return 0;
}


int MakeItemWithUses(int item, int uses) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        uses = 0;

    return (uses << 8) + GetItemIndex(item);
}

//returns thing of chosen unit needed to make this work
static u8 RepairMenuEffect(MenuProc* menu, MenuItemProc* command) {
    Struct_RepairMenuProc* const proc = (void*) menu->proc_parent;
	int currentItem = proc->currentItem;
	if (proc->itemUses[currentItem] < proc->itemTargetUses[currentItem]) {
		GetWalletEntry(proc->activeUnit->index)->gold -= proc->itemCost[currentItem];
		proc->activeUnit->items[currentItem] = MakeItemWithUses(proc->item[currentItem],proc->itemTargetUses[currentItem]);
		PlaySfx(0xB9);
	}
	else {
		PlaySfx(0x6b);
	}
	proc->gold = GetWalletEntry(proc->activeUnit->index)->gold;
	for (int i = 0; i < 5; i++) {
		if (proc->activeUnit->items[i]) {
			proc->item[i] = GetItemIndex(proc->activeUnit->items[i]);
			proc->itemUses[i] = GetItemUses(proc->activeUnit->items[i]);
			proc->itemTargetUses[i] = CalculateTargetUses(proc->gold,proc->activeUnit->items[i]);
			proc->itemCost[i] = CalculateRepairGoldCost(proc->activeUnit->items[i],proc->itemTargetUses[i]);
		}
	}
	RepairMenuDraw(menu, command);

	return 0;
}



//ME_END |  | ME_CLEAR_GFX;

//use this for arbitrary boxes
//DrawUiFrame(gBG1TilemapBuffer, x, y, w, h, 0, style);

void Text_InsertDrawNumber(struct Text *text, int x, int colorId, int n)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, colorId);
    Text_DrawNumber(text, n);
}

//Draws the UI - figure out later
static int RepairMenuDraw(MenuProc* menu, MenuItemProc* command) {
    Struct_RepairMenuProc* const proc = (void*) menu->proc_parent;

	//one box with class, stats, etc
	
	DrawUiFrame(gBG1TilemapBuffer, 5, 7, 20, 12, 0, 0);
	
	PutFaceChibi(GetUnitPortraitId(proc->activeUnit), TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 4), 0x270, 2, 0);
	
	//name is a box itself too
	struct Text *texts = gPrepItemTexts;
	
	ResetText();
	
	for (int i = 0; i < 6; i++) {
		ClearText(&texts[i]);
	}
	
	InitText(&texts[0], 30);
	InitText(&texts[1], 30);
	InitText(&texts[2], 30);
	InitText(&texts[3], 30);
	InitText(&texts[4], 30);
	InitText(&texts[5], 11);

	//unit name and gold
	PutDrawText(&texts[5], TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 4),TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(proc->activeUnit->pCharacterData->nameTextId));
	Text_InsertDrawNumber(&texts[5], 80, TEXT_COLOR_SYSTEM_GOLD,proc->gold);
	//Text_InsertDrawString(&texts[5], 80, TEXT_COLOR_SYSTEM_WHITE,"G");

	//item loop
	int color = TEXT_COLOR_SYSTEM_WHITE;
	if (proc->maxItem != 0xff) {
		for (int j = 0; j <= proc->maxItem; j++) {
			if (proc->currentItem == j) {
				color = TEXT_COLOR_SYSTEM_GREEN;
			}
			else {
				color = TEXT_COLOR_SYSTEM_WHITE;
			}
			PutDrawText(&texts[j], TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 8 + 2*j),color, 0, 0, GetStringFromIndex(GetItemData(ITEM_INDEX(proc->item[j]))->nameTextId));
			Text_InsertDrawNumber(&texts[j], 60, TEXT_COLOR_SYSTEM_BLUE,proc->itemUses[j]);
			Text_InsertDrawString(&texts[j], 70, TEXT_COLOR_SYSTEM_WHITE,"->");
			Text_InsertDrawNumber(&texts[j], 90, TEXT_COLOR_SYSTEM_BLUE,proc->itemTargetUses[j]);
			Text_InsertDrawNumber(&texts[j], 130, TEXT_COLOR_SYSTEM_GOLD,proc->itemCost[j]);
//			Text_InsertDrawString(&texts[j], 160, TEXT_COLOR_SYSTEM_WHITE,"G");
		}
	}
	else {
		PutDrawText(&texts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 8),TEXT_COLOR_SYSTEM_WHITE, 0, 0, "Nothing to repair!");
	}

    return 0;
}
