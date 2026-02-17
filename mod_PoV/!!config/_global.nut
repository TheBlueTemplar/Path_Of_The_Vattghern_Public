// Global Economy Difficulty Modifications
// Ill try to comment in the default/legends values
// 0 = Beginner, 1 = Veteran, 2 = Expert, 3 = Legendary

::Const.Difficulty = {
// Tryout, Hire, and Daily costs are managed in player.nut hooks
	Easy = 0,
	Normal = 1,
	Hard = 2,
	Legendary = 3,
	BuyPriceMult = [ // Buying Prices Multiplier
		0.95, 	// 0.95
		1.05, 	// 1.00
		1.10, 	// 1.05
		1.15 	// 1.10
	],
	SellPriceMult = [ // Selling Prices Multiplier
		1.05, 	// 1.05
		0.95, 	// 1.00
		0.90, 	// 0.95
		0.85  	// 0.90
	],
	EnemyMult = [ // Scales Enemy Contract and Locations Enemy Difficulty
		0.90, 	// 0.85
		1.05, 	// 1.00
		1.10, 	// 1.15
		1.15  	// 1.00
	],
	PaymentMult = [ // Scales Payments you Receive
		1.1, 	// 1.1
		0.95, 	// 1.00
		0.90, 	// 0.95
		0.80 	// 0.90
	],
	MinPayments = [ // Minimum Received Payments
		50, 	// 100
		25, 	// 50
		15, 	// 30
		5 		// 10
	],
	MinHeadPayments = [ // Minimum Received Payments / Head
		12, 	// 15
		8, 		// 10
		4,		// 5
		1 		// 1 
	],
	HealMult = [ // Heal rate outside of camp
		0.80, 	// 1.00
		0.60, 	// 0.66
		0.25, 	// 0.33
		0.1   	// 0.10
	],
	RepairMult = [ // Repairs rate outside of camp
		0.80, 	// 1.00
		0.60, 	// 0.66
		0.25, 	// 0.33
		0.1   	// 0.10
	],
	RetreatDefenseBonus = [ // Defense Bonus vs AOO granted when retreating
		25, 	// 30
		15, 	// 20
		5, 		// 10
		0  		// 0
	],
	XPMult = [ // Total XP Multiplier
		1.1,  	// 1.1
		0.95, 	// 1.0
		0.90, 	// 1.0
		0.85  	// 1.0
	],
	MaxResources = [ 
	// Max Resource Amount (Seems to do nothing XD, see below)
	// Still changed them, but ignore that lmao, see below instead
		{
			Food = 200, 		// 300
			Ammo = 150, 		// 250
			Medicine = 75, 		// 100
			ArmorParts = 75 	// 100
		},
		{
			Food = 150, 		// 250
			Ammo = 100,			// 150
			Medicine = 60,		// 75
			ArmorParts = 60 	// 75
		},
		{
			Food = 100,			// 200
			Ammo = 75,			// 100
			Medicine = 50,		// 50
			ArmorParts = 50		// 75
		},
		{
			Food = 80,			// 100
			Ammo = 50,			// 75
			Medicine = 30,		// 30
			ArmorParts = 30		// 50
		}
	]
};

// Resources Max Values
// Goes from Beginner to Legendary
// Easier Diffs mostly nerfed, higher ones only light nerfs
::Const.LegendMod.MaxResources = [
	{
		Food = 250,			// 300 -50
		Ammo = 300,			// 500 -200
		Medicine = 150,		// 200 -50
		ArmorParts = 150,	// 200 -50
		Stash = 70 			// 80  -10
	},
	{
		Food = 175,			// 250 -75
		Ammo = 200,			// 250 -50
		Medicine = 75,		// 100 -25
		ArmorParts = 75,	// 100 -25
		Stash = 40			// 50  -10
	},
	{
		Food = 125,			// 200 -75
		Ammo = 80,			// 100 -20
		Medicine = 40,		// 50  -10
		ArmorParts = 40,	// 50  -10
		Stash = 25			// 25  ---
	},
	{
		Food = 40,			// 50  -10
		Ammo =  40,			// 50  -10
		Medicine = 20,		// 25  -5
		ArmorParts = 20,	// 25  -5
		Stash = 10			// 10  ---
	}
];

// Start Resources Edits
// Only light Nerfs here on easier diffs
::Const.LegendMod.StartResources = [
	{
		Money = 1750,		// 2000 -250
		Ammo = 80,			// 100  -20
		Medicine = 40,		// 50   -10
		ArmorParts = 40		// 50   -10
	},
	{
		Money = 1000,		// 1000 ---
		Ammo = 40,			// 50   -10
		Medicine = 20,		// 25   -5
		ArmorParts = 20     // 25   -5
	},
	{
		Money = 500,		// 500 ---
		Ammo = 20, 			// 25  -5
		Medicine = 10, 		// 10  ---
		ArmorParts = 10 	// 10  ---
	},
	{
		Money = 0,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	}
];


// Add new entities via a nice func. also check spawnlist_master.nut and relevant faction.nut

// Mercenary Faction
::Const.EntityType.PovMercenaryGunner <-
	::Const.EntityType.addNew("pov_bandit_gunner_orientation", "Mercenary Gunner", "Mercenary Gunners", this.Const.FactionType.NobleHouse);

// Noble/Military Faction
::Const.EntityType.PovNobleSeer <-
	::Const.EntityType.addNew("pov_noble_seer_orientation", "Noble Seer", "Noble Seers", this.Const.FactionType.NobleHouse);
::Const.EntityType.PovGunnerKnight <-
	::Const.EntityType.addNew("knight_orientation", "Flammenritter", "Flammenritter", this.Const.FactionType.NobleHouse);

// Bandit Faction
::Const.EntityType.PovBanditGunner <-
	::Const.EntityType.addNew("pov_bandit_gunner_orientation", "Brigand Gunner", "Brigand Gunners", this.Const.FactionType.Bandits);
::Const.EntityType.PovRogueSeer <-
	::Const.EntityType.addNew("pov_rogue_seer_orientation", "Rogue Seer", "Rogue Seers", this.Const.FactionType.Bandits);

// Mutant Faction
::Const.EntityType.PovForsaken <-
	::Const.EntityType.addNew("pov_forsaken_orientation", "Forsaken", "Forsaken", this.Const.FactionType.Bandits);

::Const.EntityType.PovForsaken_High <-
	::Const.EntityType.addNew("pov_forsaken_orientation", "Forsaken", "Forsaken", this.Const.FactionType.Bandits);

::Const.EntityType.PovForsaken_Boss <-
	::Const.EntityType.addNew("pov_forsaken_boss_orientation", "Forsaken", "Forsaken", this.Const.FactionType.Bandits);			

// Ghost Faction
::Const.EntityType.SwordGhost <-
	::Const.EntityType.addNew("pov_sword_ghost_orientation", "Swertgeist", "Swertgeister", this.Const.FactionType.Zombies);

::Const.EntityType.ArmorGhost <-
	::Const.EntityType.addNew("pov_armor_ghost_orientation", "Rüstunggheist", "Rüstunggheister", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedBanditRaider <-
	::Const.EntityType.addNew("pov_possessed_bandit_raider_orientation", "Possessed Bandit Raider", "Possessed Bandit Raiders", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedFootman <-
	::Const.EntityType.addNew("pov_possessed_footman_orientation", "Possessed Footman", "Possessed Footmen", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedBillman <-
	::Const.EntityType.addNew("pov_possessed_billman_orientation", "Possessed Billman", "Possessed Billmen", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedArbalester <-
	::Const.EntityType.addNew("pov_possessed_arbalester_orientation", "Possessed Arbalester", "Possessed Arbalesters", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedGreatsword <-
	::Const.EntityType.addNew("pov_possessed_greatsword_orientation", "Possessed Greatsword", "Possessed Greatswords", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedMercenary <-
	::Const.EntityType.addNew("pov_possessed_mercenary_orientation", "Possessed Mercenary", "Possessed Mercenaries", this.Const.FactionType.Zombies);

::Const.EntityType.PossessedWitchhunter <-
	::Const.EntityType.addNew("pov_possessed_witchhunter_orientation", "Possessed Witchhunter", "Possessed Witchhunters", this.Const.FactionType.Zombies);