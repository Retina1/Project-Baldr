#include "gbafe.h"

void ApplyUnitPromotion(Unit* unit, const ClassData* newClass){

	const ClassData* oldClass = unit->pClassData;

	unit->pow += newClass->basePow - oldClass->basePow;

	if (unit->pow > newClass->maxPow){
		unit->pow = newClass->maxPow;
	}

	unit->skl += newClass->baseSkl - oldClass->baseSkl;

	if (unit->skl > newClass->maxSkl){
		unit->skl = newClass->maxSkl;
	}

	unit->spd += newClass->baseSpd - oldClass->baseSpd;

	if (unit->spd > newClass->maxSpd){
		unit->spd = newClass->maxSpd;
	}

	unit->def += newClass->baseDef - oldClass->baseDef;

	if (unit->def > newClass->maxDef){
		unit->def = newClass->maxDef;
	}

	unit->res += newClass->baseRes - oldClass->baseRes;

	if (unit->res > newClass->maxRes){
		unit->res = newClass->maxRes;
	}

	// there is no base lck

	unit->mag += MagClassTable[newClass->number].baseMag - MagClassTable[oldClass->number].baseMag;

	if (unit-> mag > MagClassTable[newClass->number].maxMag){
		unit->mag = MagClassTable[newClass->number].maxMag;
	}

	for (int i = 0; i < 8; i++){
		if (newClass->baseRanks[i] > oldClass->baseRanks[i]){
			unit->ranks[i] += newClass->baseRanks[i] - oldClass->baseRanks[i];

			// rank cap
			if (unit->ranks[i] > 0xFB){
				unit->ranks[i] = 0xFB;
			}
		}
	}

	unit->level = 0;
	unit->exp = 0;
	unit->pClassData = newClass;

}