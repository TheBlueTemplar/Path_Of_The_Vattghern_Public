::TLW.PlayerMutation <- {}
	
	// VATTGHERN MUTATION
	::TLW.PlayerMutation.Vattghern <- 
	{
		Name = "Vattghern", // Used as a flag		Limit = false, // Whether it affects, and is affected by the mutation limit
		Limit = false,
		Remove = "", // If you want to remove a skill, while adding this, check MUTATION UPGRADES below to see
		Script = "scripts/skills/traits/pov_vattghern_trait", // Mutation Effect to add
		ScriptWeak = "", // Weak Version of Mutation Effect to add on mutants. Leave empty if none exist
		Sounds = ["sounds/combat/drink_01.wav","sounds/combat/rage_01.wav"] // SOunds to Play when adding mutation
	};

	// BASE MUTATIONS
	::TLW.PlayerMutation.Unhold <- 
	{
		Name = "Unhold",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_unhold_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_unhold_weak_mutagen_effect", // in some cases, keep as-is (when you want it usable by mutant, but same version of effect)
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/unhold_regenerate_03.wav","sounds/enemies/unhold_hurt_01.wav"]
	};

	::TLW.PlayerMutation.Alp <- 
	{
		Name = "Alp",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_alp_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_alp_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/alp_idle_03.wav"]
	};

	::TLW.PlayerMutation.Sandgolem <- 
	{
		Name = "Sandgolem",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_sandgolem_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_sandgolem_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc6/sand_golem_disassemble_03.wav","sounds/enemies/dlc6/sand_golem_disassemble_04.wav"]
	};

	::TLW.PlayerMutation.Ghost <- 
	{
		Name = "Ghost",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_ghost_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_ghost_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/geist_idle_17.wav"]
	};

	::TLW.PlayerMutation.Orc <- 
	{
		Name = "Orc",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_orc_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_orc_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/combat/rage_01.wav","sounds/combat/rage_02.wav"]
	};

	::TLW.PlayerMutation.Basilisk <- 
	{
		Name = "Basilisk",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_basilisk_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_basilisk_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/Basilisk_idle07.wav","sounds/enemies/Basilisk_idle09.wav",]
	};

	::TLW.PlayerMutation.Direwolf <- 
	{
		Name = "Direwolf",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_direwolf_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_direwolf_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/werewolf_hurt_02.wav","sounds/enemies/werewolf_idle_14.wav"]
	};

	::TLW.PlayerMutation.Ghoul <- 
	{
		Name = "Ghoul",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_ghoul_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_ghoul_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/ghoul_grows_02.wav","sounds/enemies/ghoul_hurt_04.wav"]
	};

	::TLW.PlayerMutation.Hexe <- 
	{
		Name = "Hexe",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_hexe_mutagen_effect",
		ScriptWeak = "", // intentionally empty
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/hexe_hex_01.wav","sounds/enemies/dlc2/hexe_charm_chimes_01.wav"]
	};

	::TLW.PlayerMutation.Schrat <- 
	{
		Name = "Schrat"
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_schrat_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_schrat_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/schrat_regrowth_02.wav","sounds/enemies/dlc2/schrat_idle_09.wav"]
	};

	::TLW.PlayerMutation.Serpent <- 
	{
		Name = "Serpent",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_serpent_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_serpent_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc6/snake_hurt_02.wav","sounds/enemies/dlc6/snake_idle_13.wav","sounds/enemies/dlc6/snake_idle_04.wav"]
	};

	::TLW.PlayerMutation.Skeleton <- 
	{
		Name = "Skeleton",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_skeleton_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_skeleton_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/skeleton_rise_01.wav","sounds/enemies/skeleton_death_01.wav"]
	};

	::TLW.PlayerMutation.Spider <- 
	{
		Name = "Spider",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_spider_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_spider_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/giant_spider_hurt_06.wav","sounds/enemies/dlc2/giant_spider_death_04.wav"]
	};

	::TLW.PlayerMutation.Necromancy <- 
	{
		Name = "Necromancy",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_necromancy_mutagen_effect",
		ScriptWeak = "", // intentionally empty
		Sounds = ["sounds/combat/drink_01.wav","sounds/humans/0/human_flee_01.wav","sounds/enemies/zombie_bite_04.wav"]
	};

	::TLW.PlayerMutation.Goblin <- 
	{
		Name = "Goblin",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_goblin_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_goblin_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/goblin_idle_08.wav","sounds/enemies/goblin_flee_01.wav"]
	};

	::TLW.PlayerMutation.Vampire <- 
	{
		Name = "Vampire",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_vampire_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_vampire_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/vampire_landing_01.wav","sounds/enemies/vampire_life_drain_03.wav"]
	};

	::TLW.PlayerMutation.Lindwurm <- 
	{
		Name = "Lindwurm",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_lindwurm_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_lindwurm_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/lindwurm_idle_02.wav","sounds/enemies/lindwurm_hurt_01.wav"]
	};

	::TLW.PlayerMutation.Rot <- 
	{
		Name = "Lindwurm",
		Limit = true,
		Remove = "",
		Script = "scripts/skills/effects/pov_rot_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_rot_weak_mutagen_effect",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/big_golem_death_01.wav"]
	};

	// MUTATION UPGRADES
	::TLW.PlayerMutation.SpiderUpgrade <- 
	{
		Name = "SpiderUpgrade",
		Limit = false,
		Remove = "effects.pov_spider_mutagen",
		Script = "scripts/skills/effects/pov_spider_mutagen_upgraded_effect",
		ScriptWeak = "", // upgrades not meant for mutants, only vattghern
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/giant_spider_hurt_06.wav","sounds/enemies/dlc2/giant_spider_death_04.wav"]
	};

	::TLW.PlayerMutation.UnholdUpgrade <- 
	{
		Name = "UnholdUpgrade",
		Limit = false,
		Remove = "effects.pov_unhold_mutagen",
		Script = "scripts/skills/effects/pov_unhold_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/unhold_regenerate_03.wav","sounds/enemies/unhold_hurt_01.wav"]
	};

	::TLW.PlayerMutation.DirewolfUpgrade <- 
	{
		Name = "DirewolfUpgrade",
		Limit = false,
		Remove = "effects.pov_direwolf_mutagen",
		Script = "scripts/skills/effects/pov_direwolf_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/werewolf_hurt_02.wav","sounds/enemies/werewolf_idle_14.wav"]
	};

	::TLW.PlayerMutation.GhoulUpgrade <- 
	{
		Name = "GhoulUpgrade",
		Limit = false,
		Remove = "effects.pov_ghoul_mutagen",
		Script = "scripts/skills/effects/pov_ghoul_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav", "sounds/enemies/ghoul_grows_02.wav", "sounds/enemies/ghoul_hurt_04.wav"]
	};

	::TLW.PlayerMutation.HexeUpgrade <- 
	{
		Name = "HexeUpgrade",
		Limit = false,
		Remove = "effects.pov_hexe_mutagen",
		Script = "scripts/skills/effects/pov_hexe_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav","sounds/enemies/dlc2/hexe_hex_01.wav","sounds/enemies/dlc2/hexe_charm_chimes_01.wav"]
	};

	::TLW.PlayerMutation.LindwurmUpgrade <- 
	{
		Name = "LindwurmUpgrade",
		Limit = false,
		Remove = "effects.pov_lindwurm_mutagen",
		Script = "scripts/skills/effects/pov_lindwurm_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav", "sounds/enemies/lindwurm_idle_02.wav", "sounds/enemies/lindwurm_hurt_01.wav"]
	};

	::TLW.PlayerMutation.SchratUpgrade <- 
	{
		Name = "SchratUpgrade",
		Limit = false,
		Remove = "effects.pov_schrat_mutagen",
		Script = "scripts/skills/effects/pov_schrat_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav", "sounds/enemies/dlc2/schrat_regrowth_02.wav", "sounds/enemies/dlc2/schrat_idle_09.wav"]
	};

	::TLW.PlayerMutation.AlpUpgrade <- 
	{
		Name = "AlpUpgrade",
		Limit = false,
		Remove = "effects.pov_alp_mutagen",
		Script = "scripts/skills/effects/pov_alp_mutagen_upgraded_effect",
		ScriptWeak = "",
		Sounds = ["sounds/combat/drink_01.wav", "sounds/enemies/dlc2/alp_idle_03.wav"]
	};

	// MEME MUTATIONS
	::TLW.PlayerMutation.Donkey <- 
	{
		Name = "Donkey",
		Limit = false,
		Remove = "",
		Script = "scripts/skills/effects/pov_donkey_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_donkey_mutagen_effect", 
		Sounds = ["sounds/combat/drink_01.wav","sounds/misc/donkey_hurt_01.wav","sounds/misc/donkey_idle_01.wav"]
	};

	::TLW.PlayerMutation.Dog <- 
	{
		Name = "Dog",
		Limit = false,
		Remove = "",
		Script = "scripts/skills/effects/pov_dog_mutagen_effect",
		ScriptWeak = "scripts/skills/effects/pov_dog_mutagen_effect", 
		Sounds = ["sounds/enemies/wardog_charge_00.wav","sounds/enemies/wardog_hurt_00.wav","sounds/enemies/wardog_flee_00.wav"]
	};