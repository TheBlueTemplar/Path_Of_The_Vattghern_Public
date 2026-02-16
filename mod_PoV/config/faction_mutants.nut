// Forsaken (Normal Ver.)
::Const.Tactical.Actor.PovForsaken <- {
	XP = 300,
	ActionPoints = 9,
	Hitpoints = 100,
	Bravery = 75,
	Stamina = 155,
	MeleeSkill = 68,
	RangedSkill = 50,
	MeleeDefense = 10,
	RangedDefense = 12,
	Initiative = 90,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		20,
		20
	],
	FatigueRecoveryRate = 18
};

// Forsaken (Champ Ver. - Late Game)
::Const.Tactical.Actor.PovForsaken_High <- {
	XP = 900,
	ActionPoints = 9,
	Hitpoints = 180,
	Bravery = 120,
	Stamina = 170,
	MeleeSkill = 75,
	RangedSkill = 65,
	MeleeDefense = 20,
	RangedDefense = 18,
	Initiative = 90,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		50,
		50
	],
	FatigueRecoveryRate = 25,
	//DamageTotalMult = 1.1 // done in file	
};

// Forsaken Boss (Always Champ - Contract Only)
::Const.Tactical.Actor.PovForsaken_Boss <- {
	XP = 1600,
	ActionPoints = 10,
	Hitpoints = 250,
	Bravery = 150,
	Stamina = 200,
	MeleeSkill = 85,
	RangedSkill = 75,
	MeleeDefense = 26,
	RangedDefense = 24,
	Initiative = 100,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		75,
		75
	],
	FatigueRecoveryRate = 30,
	//DamageTotalMult = 1.1 // done in file	
};