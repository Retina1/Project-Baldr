#include "gbafe.h"

typedef struct Struct_RepairMenuProc Struct_RepairMenuProc;

static u8 RepairMenuEffect(MenuProc* menu, MenuItemProc* command);
static u8 RepairMenuIdle(MenuProc* menu, MenuItemProc* command);
static int RepairMenuDraw(struct MenuProc* menu, struct MenuItemProc* command);

static const struct ProcCmd Proc_RepairMenu[] =
{
    PROC_CALL(LockGame),

    PROC_YIELD,

    PROC_CALL(UnlockGame),
    PROC_END,
};

struct Struct_RepairMenuProc
{
	PROC_HEADER;
	struct Unit* activeUnit;
	u16 gold;
	u8 currentItem; // goes 0-4, if 0 there's nothing in inventory and we draw special case
	u8 maxItem; //goes 0-4, or 255
	u8 item[5];
	u8 itemUses[5];
	u8 itemTargetUses[5];
	u16 itemCost[5];
	
};

//For selecting what each menu command does.
static const MenuItemDef MenuCommands_RepairMenu[] =
{
    {
        .isAvailable = MenuAlwaysEnabled,
        //Casting JumpDraw so it can return values for other functions
        .onDraw = (void*) RepairMenuDraw,
        .onIdle = RepairMenuIdle,
        .onSelected = RepairMenuEffect,
    },

    {} //END
};

static const struct MenuDef RepairMenu_MenuDef =
{
    .rect = { 5, 3, 14 },
    .menuItems = MenuCommands_RepairMenu, 

    .onBPress = (void*) (0x080152F4+1), // Goes back to main game loop
};

//draw desc at 16,5,14


typedef struct Unit Unit;
typedef struct walletTable walletTable;

extern u32 walletTableRam;

struct walletTable {
	u16 gold;
};
struct walletTable* GetWalletEntry(int index);