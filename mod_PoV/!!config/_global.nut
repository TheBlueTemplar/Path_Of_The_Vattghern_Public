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