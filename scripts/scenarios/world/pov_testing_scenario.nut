/////////////////////////////////////////////////////////////////////
// 					Author: The Blue Templar 					   //
// 			Not to be used elsewhere or tampered with, 2025.       //
/////////////////////////////////////////////////////////////////////

// THIS IS A DEV ONLY SCENARIO
// It is to be used only by devs, and trusted playtesters, noone else!!
this.pov_testing_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.pov_testing";
		this.m.Name = "PoV Testing";
		this.m.Description = "[p=c][img]gfx/ui/events/pov_testing_vattghern.png[/img][/p][p]A scenario meant for internal testing, modified for use by the playtesters. Playing this origin is meant to be for testing very specific things like \'can x mutagen do the y thing \'.\n\n[color=#bcad8c]Filthy Rich:[/color] You begin rich with resources and money, starting with 20000 gold and almost maxed out meds, tools and ammo. \n\n [color=#bcad8c]Reputable:[/color] Despite doing nothing, you start with 1000 reputation, pretty close to professional. Wow! \n\n [color=#bcad8c]Mutationmaxxing:[/color] You have each off the mutation potions with you, including 3 Trial of the grasses potions, as well as any other new items I added to the mod. \n\n [color=#bcad8c] Not recommended for a \'normal\' playthrough! [/color][/p]";
		this.m.Difficulty = 4;
		this.m.Order = 36;
		this.m.IsFixedLook = true;
		this.m.StartingBusinessReputation = 1000;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function isValid()
	{
		return this.Const.DLC.Unhold;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 6; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(2.0, "Happy to be testing stuff out!");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
			i = i;
			i = i;
		}

		local bros = roster.getAll();

		bros[0].setStartValuesEx([
			"pov_vattghern_background"
		]);
		bros[0].getBackground().m.RawDescription = "%name% is an old vattghern from the School of the Wolf, possibly the last of his kind. He possesses secret knowledge for crafting mutagens.";
		//bros[0].setName("Vesemir");
		bros[0].setTitle("The Vatt'ghern");
		bros[0].setPlaceInFormation(4);
		//bros[0].getBaseProperties().Hitpoints += 30;
		//bros[0].getBaseProperties().MeleeSkill += 10;
		//bros[0].getBaseProperties().MeleeDefense += 10;
		//bros[0].getBaseProperties().RangedDefense += 5;
		//bros[0].getSkills().add(this.new("scripts/skills/traits/pov_vattghern_trait"));
		//bros[0].getFlags().increment("pov_ActiveMutations");
		bros[0].getSkills().add(this.new("scripts/skills/traits/pov_old_vattghern_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_potion_brewer"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_field_triage"));
		bros[0].m.PerkPoints = 7;
		bros[0].m.LevelUps = 7;
		bros[0].m.Level = 12;
		local items = bros[0].getItems();
		//items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		//items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.equip(this.new("scripts/items/weapons/pov_witcher_longsword"));
		//items.equip(this.new("scripts/items/legend_armor/cloth/legend_gambeson_wolf"));
		items.equip(this.new("scripts/items/accessory/pov_vattghern_medallion_item"));
		/*
		bros[0].m.Talents = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Initiative] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 2;
		talents[this.Const.Attributes.MeleeSkill] = 3;
		*/

		bros[1].setStartValuesEx([
			"wildman_background"
		]);
		bros[1].getBackground().m.RawDescription = "A young whelp from the city, %name% got a start by becoming a prime target for experimentation!.";
		bros[1].setName("Poor Fella");
		bros[1].setTitle("The Lab Rat");
		bros[1].setPlaceInFormation(3);
		bros[1].getBaseProperties().MeleeSkill += 5;
		bros[1].getBaseProperties().RangedSkill += 5;
		bros[1].getBaseProperties().RangedDefense += 4;
		bros[1].getBaseProperties().MeleeDefense += 4;
		//bros[1].addLightInjury();
		//bros[1].addInjury(this.Const.Injury.Brawl);
		bros[1].m.PerkPoints = 5;
		bros[1].m.LevelUps = 5;
		bros[1].m.Level = 6;

		bros[2].setStartValuesEx([
			"pov_caravan_guard_background"
		]);
		bros[2].getBackground().m.RawDescription = "A young assassin, %name% started by reading books. It is the study and preparation that will give the edge in battle.";
		//bros[2].setName("Lambert");
		bros[2].setPlaceInFormation(5);
		bros[2].getBaseProperties().MeleeSkill += 4;
		bros[2].getBaseProperties().Initiative += 4;
		//bros[2].addLightInjury();
		//bros[2].addInjury(this.Const.Injury.Brawl);
		bros[2].m.PerkPoints = 5;
		bros[2].m.LevelUps = 5;
		bros[2].m.Level = 6;

		// THIS IS A TESTING SLOT, PLACE WHATEVER BACKGROUND YOU WANT HERE
		bros[3].setStartValuesEx([
			"pov_forsaken_background"
		]);
		//bros[3].getBackground().m.RawDescription = "What is this poor sod even doing here??";
		bros[3].setName("Broski");
		bros[4].setTitle("The Transformer");
		bros[3].setPlaceInFormation(14);
		//bros[3].addLightInjury();
		//bros[3].addInjury(this.Const.Injury.Brawl);
		bros[3].m.PerkPoints = 5;
		bros[3].m.LevelUps = 5;
		bros[3].m.Level = 6;

		bros[4].setStartValuesEx([
			"minstrel_background"
		]);
		bros[4].getBackground().m.RawDescription = "A truly flamboyant figure, %name% insisted in joining your order to record all of your feats and achievements. Not to mention that they are not really welcome to their home anymore, for undisclosed reasons of course. \n\n \'Nothing to concern your lordship, just a minor misunderstanding\' is all you can get. Not that you care.";
		bros[4].setName("Officinale");
		bros[4].setTitle("The Viscount");
		//bros[3].setBackgroundType(this.Const.BackgroundType.Female); FAIL XD
		bros[4].setPlaceInFormation(12);
		bros[4].getSkills().add(this.new("scripts/skills/traits/cocky_trait"));
		bros[4].getSkills().add(this.new("scripts/skills/traits/legend_seductive_trait"));
		bros[4].getSkills().add(this.new("scripts/skills/traits/bright_trait"));
		bros[4].getBaseProperties().Bravery += 15;
		bros[4].getBaseProperties().RangedDefense += 5;
		bros[4].addLightInjury();
		bros[4].addInjury(this.Const.Injury.Brawl);
		bros[4].m.PerkPoints = 0;
		bros[4].m.LevelUps = 0;
		bros[4].m.Level = 1;

		bros[5].setStartValuesEx([
			"pov_seer_background"
		]);
		//bros[5].getBackground().m.RawDescription = "Greek Original Giagia, has magic powers";

		// Skip PoV story events (already start with vattghern)
		// Also unlock base PoV mechanics (ToG,corpses,mutagens,events,some ambitions complete)
		
		this.World.Flags.add("FirstMutantSpawned");
		this.World.Flags.add("FirstMutantKilledEvent");
		this.World.Flags.add("FirstMutantKilled");
		this.World.Flags.add("GotMutagenEvent");
		this.World.Flags.add("GotMutagen");
		this.World.Flags.add("GotVattghernEvent");
		this.World.Flags.add("GotVattghern");
		this.World.Flags.add("GotMedallion");
		//this.World.Flags.add("GotStrongVattghernEvent");
		//this.World.Flags.add("GotStrongVattghern");
		//this.World.Flags.add("DoneVattghernContract");
		
		// Reputation and Legends flags
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Flags.set("HasLegendCampCrafting", true);
		
		// ADD SOME SUPPLIES
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_fish_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/goat_cheese_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
		
		// ADD VATTGHERN MUTATION POTIONS AND STUFF TO HEAL THE INJURY
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_witcher_potion_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_witcher_potion_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_witcher_potion_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/special/fountain_of_youth_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/special/fountain_of_youth_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/special/fountain_of_youth_item"));
		
		// ALL MOD'S NEW WEAPONS AND ITEMS
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/pov_whip_mace"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/pov_whip_mace_named"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/pov_witcher_longsword"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/pov_vattghern_medallion_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/gloves/pov_silver_gauntlets"));

		// ALL MOD'S NEW THROWN WEAPONS
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/pov_named_goblin_spiked_balls"));

		// ALL MOD'S NEW HANDGUNS
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/pov_feuerbuchse"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/pov_named_feuerbuchse"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/pov_feuerspeier"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/pov_named_feuerspeier"));
		*/
		// ALL MOD'S NEW STAVES
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/pov_rough_staff"));
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/pov_named_rough_staff"));

		// ALL MOD'S NEW SHIELDS
		//this.World.Assets.getStash().add(this.new("scripts/items/shields/pov_steel_buckler_shield"));
		//this.World.Assets.getStash().add(this.new("scripts/items/shields/named/pov_named_steel_buckler_shield"));

		// ALL MOD'S NEW ARMOR & UPGRADES
		//this.World.Assets.getStash().add(this.new("scripts/items/armor_upgrades/pov_ghost_plates_upgrade"));
		
		// ALL MOD'S NEW CONSUMABLES
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/special/pov_silvering_kit"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/pov_vattghern_poison_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_rotten_flesh_bag"));
		this.World.Assets.getStash().add(this.new("scripts/items/special/pov_reading_notes"));
		*/
		// NORMAL MUTAGENS
		for (local i = 0; i < ::TLW.MutagensNormal.len(); i++)
		{
			this.World.Assets.getStash().add(this.new(::TLW.MutagensNormal[i]));
		}
		
		// MUTAGEN UPGRADES
		for (local i = 0; i < ::TLW.MutagensUpgrades.len(); i++)
		{
			//this.World.Assets.getStash().add(this.new(::TLW.MutagensUpgrades[i]));
		}

		// MEME MUTAGENS
		for (local i = 0; i < ::TLW.MutagensMeme.len(); i++)
		{
			this.World.Assets.getStash().add(this.new(::TLW.MutagensMeme[i]));
		}

		// NEWLY ADDED MUTAGENS (for reference and test only)
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_basilisk_mutagen_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_sandgolem_mutagen_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_serpent_mutagen_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_beautiful_potion_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_donkey_mutagen_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_dog_mutagen_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/pov_rot_mutagen_item"));
		
		// MONSTER TROPHIES
		/*
		// Accessories (Vanilla)
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/alp_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/ghoul_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/undead_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/orc_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/hexen_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/goblin_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/oathtaker_skull_01_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/oathtaker_skull_02_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/slayer_necklace_item"));
		// Accessories (Legends)
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_basilisk_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_demon_banshee_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_demonalp_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_hexen_leader_trophy_item"));
		*/
		/*
		// Armor Upgrades (Monster) (commented out stuff is for other uses)
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_additional_padding_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_bone_platings_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_horn_plate_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_hyena_fur_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_light_padding_replacement_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_lindwurm_scales_upgrade"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/cloak/lindwurm_scales_cloak"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_serpent_skin_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/cloak/legend_serpent_skin_cloak"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_unhold_fur_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/cloak/legend_unhold_fur_cloak"));

		// Armor Upgrades (Monster) (Legends)
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor/legend_redback_cloak_upgrade"));
		//this.World.Assets.getStash().add(this.new("scripts/items/armor_upgrades/legend_armor_redback_cloak_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/cloak/legend_redback_cloak"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_stollwurm_scales_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/cloak/legend_stollwurm_scales_cloak"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_white_wolf_pelt_upgrade"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_white_wolf_pelt_upgrade"));
		*/
		
		// ARMOR UPGRADES - TIER V (The Rest) 
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_swan_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_strong_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_stag_upgrade"));
		//this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_named_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_pauldron_heavy_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_metal_pauldrons_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_metal_plating_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_mail_patch_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_double_mail_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_chain_and_mail_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_light_gladiator_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_leather_neckguard_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_leather_shoulderguards_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_joint_cover_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_heraldic_plates_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_spiked_collar_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_sacred_shield_upgrade"));
		this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_skull_chain_upgrade"));
		

		// MONSTER SHIELDS TEST
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/shields/special/legend_craftable_greenwood_schrat_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/special/legend_craftable_schrat_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/special/legend_craftable_kraken_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/named/named_lindwurm_shield"));
		*/
		// BUCKLERS TEST
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/shields/buckler_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/ancient/legend_mummy_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/pov_steel_buckler_shield"));
		this.World.Assets.getStash().add(this.new("scripts/items/shields/named/pov_named_steel_buckler_shield"));
		*/
		// CRAFTING / PRECIOUS ITEMS TEST
		
		// Sling ammo craft test
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		*/
		// Vala Rune
		//this.World.Assets.getStash().add(this.new("scripts/items/trade/uncut_gems_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/trade/uncut_gems_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/trade/uncut_gems_item"));
		
		// Vattghern Poison 
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/poison_gland_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/poison_gland_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/poison_gland_item"));
		
		// Rot Powder Ammo
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/powder_bag"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_grafted_flesh_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_grafted_flesh_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_grafted_flesh_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_rot_essence_special_item"));
		
		// Distilled Alcohol
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/preserved_mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/preserved_mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_liquor_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_liquor_item"));
		*/
		
		// Silver Ingots Melting
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/loot/silver_bowl_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/silver_bowl_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/silverware_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/silverware_item"));
		*/
		// Vattghern Medallion Crafting

		//this.World.Assets.getStash().add(this.new("scripts/items/trade/pov_silver_ingots_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/trade/legend_iron_ingots_item"));

		// Infused Armor Plates Crafting

		//this.World.Assets.getStash().add(this.new("scripts/items/trade/legend_iron_ingots_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_ghost_plates_special_item"));

		// NEW CRAFTABLES
		this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_distilled_alcohol_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/pov_silver_ingots_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/trade/pov_silver_ingots_item"));

		// SEASONAL ITEMS
		/*
		local xmasHat1 = this.new("scripts/items/legend_helmets/vanity/pov_helmet_xmas_hat");
		xmasHat1.setVariant(1);
		xmasHat1.updateVariant();
		this.World.Assets.getStash().add(xmasHat1);
		local xmasHat2 = this.new("scripts/items/legend_helmets/vanity/pov_helmet_xmas_hat");
		xmasHat2.setVariant(2);
		xmasHat2.updateVariant();
		this.World.Assets.getStash().add(xmasHat2);
		*/
		// ALL MOD'S CORPSES
		/*
		for (local i = 0; i < ::TLW.Corpses.len(); i++)
		{
			// Currently does not add simple alp corpse, check
			this.World.Assets.getStash().add(this.new(::TLW.Corpses[i]));
		}
		*/
		// ALL MOD'S SPECIAL CORPSES
		/*
		for (local i = 0; i < ::TLW.SpecialCorpses.len(); i++)
		{
			// Currently does not add simple alp corpse, check
			this.World.Assets.getStash().add(this.new(::TLW.SpecialCorpses[i]));
		}
		*/

		// NEWLY ADDED CORPSES (INCLUDED ABOVE, THIS IS FOR REFERENCE/TEST)
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_basilisk_drone_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_basilisk_sentry_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_flesh_golem_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_flesh_golem2_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_fault_finder_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_ghost3_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_ghost4_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/corpse/pov_corpse_forsaken_item"));

		// NEW MONSTER DROPS
			//Value
		//this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_ivory_spine_shard_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_old_crest_item"));
			//Special
		this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_rot_essence_special_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_infused_shards_special_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/loot/pov_ghost_plates_special_item"));
			//Misc
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_grafted_flesh_item"));

		// MISC/MEME STUFF
		//this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));

		// ALL INGREDIENTS FOR CRAFTING THE ToG
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/misc/third_eye_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/acidic_saliva_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/poison_gland_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/unhold_heart_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/adrenaline_gland_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/vampire_dust_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/ghoul_brain_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/sulfurous_rocks_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/pov_distilled_alcohol_item"));
		*/
		// HOLY WATER TESTING
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/holy_water_item"));

		// NETS TESTING
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/reinforced_throwing_net"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/throwing_net"));

		// ORC MUTAGEN TESTING
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/greenskins/orc_cleaver"));

		// Arrow/Bolt/Bullet Testing

		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/legend_broad_head_arrows"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/legend_broad_head_bolts"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/legend_armor_piercing_arrows"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/legend_armor_piercing_bolts"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_silver_arrows"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_silver_bolts"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_silver_bullets_bag"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_sling_limestone_pebbles"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_sling_basalt_rocks"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_sling_ifrit_rocks"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_sling_pumice_pebbles"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/pov_blunt_arrows")); // fail

		// THROWN WEAPONS TESTING
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/throwing_spear"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/greenskins/legend_orc_throwing_spear"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/throwing_axe"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/barbarians/heavy_throwing_axe"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/javelin"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/barbarians/heavy_javelin"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/greenskins/orc_javelin"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/greenskins/goblin_spiked_balls"));
		*/
		// THROWN WEAPONS TESTING (NAMED)
		/*
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/named_throwing_axe"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/legend_named_heavy_throwing_axe"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/named_javelin"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/legend_named_heavy_javelin"));
		*/
		
		// HANDGONNE TESTING
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/oriental/handgonne"));
		//this.World.Assets.getStash().add(this.new("scripts/items/ammo/powder_bag"));

		// MISC WEAPON TESTING
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_military_goedendag"));
		//this.World.Assets.getStash().add(this.new("scripts/items/weapons/two_handed_flanged_mace"));

		// BANNER / SHIELDS / TABARDS TESTING
		// BANNER
		local banner = this.new("scripts/items/tools/player_banner");
		banner.setVariant(1822);
		banner.updateVariant();
		this.World.Assets.getStash().add(banner);
		// Round Shield
		local round = this.new("scripts/items/shields/wooden_shield");
		round.setVariant(1822);
		round.updateVariant();
		this.World.Assets.getStash().add(round);
		// Kite Shield
		local kite = this.new("scripts/items/shields/kite_shield");
		kite.setVariant(1822);
		kite.updateVariant();
		this.World.Assets.getStash().add(kite);
		// Heater Shield
		local heater = this.new("scripts/items/shields/heater_shield");
		heater.setVariant(1822);
		heater.updateVariant();
		this.World.Assets.getStash().add(heater);
		// Tower Shield
		local tower = this.new("scripts/items/shields/legend_tower_shield");
		tower.setVariant(1822);
		tower.updateVariant();
		this.World.Assets.getStash().add(tower);
		// Tabard
		local tabard = this.new("scripts/items/legend_armor/tabard/legend_common_tabard");
		tabard.setVariant(1822);
		tabard.updateVariant();
		this.World.Assets.getStash().add(tabard); 
		// 1 for each member to test (5 total)
		/*
		local tabard1 = this.new("scripts/items/legend_armor/tabard/legend_common_tabard");
		tabard1.setVariant(1823);
		tabard1.updateVariant();
		this.World.Assets.getStash().add(tabard1);
		local tabard2 = this.new("scripts/items/legend_armor/tabard/legend_common_tabard");
		tabard2.setVariant(1823);
		tabard2.updateVariant();
		this.World.Assets.getStash().add(tabard2);
		local tabard3 = this.new("scripts/items/legend_armor/tabard/legend_common_tabard");
		tabard3.setVariant(1823);
		tabard3.updateVariant();
		this.World.Assets.getStash().add(tabard3);
		local tabard4 = this.new("scripts/items/legend_armor/tabard/legend_common_tabard");
		tabard4.setVariant(1823);
		tabard4.updateVariant();
		this.World.Assets.getStash().add(tabard4);
		*/

		// SSU RELATED BS 
		if (::TLW.hasSSU)
		{
			// BASE SEQUENCES FOR INTERACTION TESTING
			/*
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/alp_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/direwolf_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/goblin_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/lindwurm_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/nachzehrer_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/necrosavant_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/orc_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/schrat_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/serpent_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/unhold_sequence_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/webknecht_sequence_item"));
			*/
		}

		this.World.Assets.getStash().resize(150);
		this.World.Assets.m.Money = 30000;
		this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts * 3;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine * 3;
		this.World.Assets.m.Ammo = this.World.Assets.m.Ammo * 3;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() <= 1)
			{
				break;
			}

			i = ++i;
			i = i;
			i = i;
		}

		// Settlement Situation Testing
		//randomVillage.addSituation(this.new("scripts/entity/world/settlements/situations/pov_anatomists_visit_settlement_situation"));
		//randomVillage.addSituation(this.new("scripts/entity/world/settlements/situations/pov_mutants_visit_settlement_situation"));

		// Settlement Situation Transformer
		//randomVillage.addSituation(this.new("scripts/entity/world/settlements/situations/legend_militant_townsfolk_situation"));	

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 3), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 3));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 3), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 3));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(11);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			if (::TLW.EnablePovMainMusic)
			{
				this.Music.setTrackList(this.Const.Music.PovMenuTracks, this.Const.Music.CrossFadeTime);
			}
			else
			{
				this.Music.setTrackList(this.Const.Music.CivilianTracks, this.Const.Music.CrossFadeTime);
			}
			this.World.Events.fire("event.pov_testing_scenario_intro");
		}, null);	
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.FootprintVision = 1.5;
		//this.World.State.getPlayer().m.BaseMovementSpeed = 120;
		if (this.World.State.getPlayer() != null)	//fallback for movespeed multiplier
		{
			this.World.State.getPlayer().m.BaseMovementSpeed = 120;
		}
	}



});

