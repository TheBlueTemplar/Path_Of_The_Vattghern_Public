::Const.LegendMod.ArmorObjs.extend([
	// ALL STATS SHOWN IN COMMENTS ASSUME POV'S OVERHAULED STUFF ARE ACTIVE
	// BACKGROUNDS
	{
		ID = "vattghern_armor_01", //avg 215, max 270, min 180
		Script = "",
		Sets = [
			{
				Cloth = [//avg of 65
					[1, "cloth/legend_gambeson"], // 65
					[1, "cloth/legend_padded_surcoat"], // 55
					[1, "cloth/legend_gambeson_wolf"] // 70
				],
				Chain = [// 70
					[1, "chain/legend_armor_basic_mail"], //85
					[1, "chain/legend_armor_mail_shirt"], //50
					[1, "chain/legend_armor_reinforced_mail_shirt"], //80
					[1, "chain/legend_armor_short_mail"] //60
				],
				Plate = [// 70
					[1, "plate/legend_armor_leather_riveted_light"], // 80
					[1, "plate/legend_armor_leather_brigandine"], // 65
					[1, "plate/legend_armor_leather_noble"], //65
					[1, "plate/legend_armor_leather_scale"] //70
				],
				Cloak = [
				],
				Tabard = [
				],
				Attachments = [// 10
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"], // 10
					[1, "armor_upgrades/legend_hyena_fur_upgrade"] // 10
				]
			}
		]
	},
	{
		ID = "mutant_armor_01", //avg 140, max 175, min 100
		Script = "",
		Sets = [
			{
				Cloth = [//avg of 40
					[1, "cloth/wanderers_coat"], // 45
					[1, "cloth/legend_tunic"], // 20
					[1, "cloth/legend_padded_surcoat"] // 55
				],
				Chain = [//avg of 35
					[1, "chain/legend_armor_mail_shirt_simple"], //25
					[1, "chain/legend_armor_mail_shirt"], //50
					[1, "chain/legend_southern_cloth"], //30
				],
				Plate = [//avg of 65
					[1, "plate/legend_armor_leather_scale"], // 70
					[1, "plate/legend_armor_leather_brigandine"], // 65
					[1, "plate/legend_armor_leather_lamellar"], //50
					[1, "plate/legend_southern_leather_scale"] //70
				],
				Cloak = [
				],
				Tabard = [
				],
				Attachments = [
				]
			}
		]
	},
	{
		ID = "caravan_guard_armor_01", //avg 165, max 205, min 140
		Script = "",
		Sets = [
			{
				Cloth = [//avg of 50
					[1, "cloth/wanderers_coat"], // 45
					[1, "cloth/legend_padded_surcoat"] // 55
				],
				Chain = [//avg of 40
					[1, "chain/legend_armor_mail_shirt"], //50
					[1, "chain/legend_southern_cloth"] //30
				],
				Plate = [//avg of 60
					[1, "plate/legend_armor_leather_scale"], // 70
					[1, "plate/legend_armor_leather_brigandine"], // 65
					[1, "plate/legend_armor_leather_lamellar"] //50
				],
				Cloak = [//avg of 15 
					[4, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_armor_cloak_heavy"]// 30, -4
				],
				Tabard = [
				],
				Attachments = [
				]
			}
		]
	},
	// ENEMIES - MUTANTS
	{
		ID = "forsaken_armor",	//??
		Script = "",
		Sets = [
			{
				Cloth = [
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_gambeson"],// 65,-8
					[1, "cloth/legend_gambeson_plain"],// 65,-8
					[1, "cloth/legend_gambeson_wolf"],// 70,-9
				],
				Chain = [ // 105,-13
					[2,"chain/legend_armor_hauberk"],// 95,-11
					[1,"chain/legend_southern_mail"],// 100,-13
					[1,"chain/legend_armor_hauberk_full"]// 115,-14
				],
				Plate = [
					[6, "plate/legend_armor_leather_riveted"],// 95,-13	
					[2, "plate/legend_armor_scale_shirt"],// 85,-10						
					[1, "plate/legend_armor_scale"],// 100,-12
					[1, "plate/legend_armor_scale_coat"],// 120,-15
					[3, "plate/legend_armor_leather_brigandine_hardened"],// 110,-15
					[1, "plate/legend_armor_plate_chest"],// 125,-17
					[1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130,-20				
				],
				Cloak = [
					[1, "cloak/fur_cloak"], // 35, -6
					[1, "cloak/legend_animal_pelt"], // 15, -2
					[1, "cloak/legend_dark_wooly_cloak"], // 15, -2
				],
				Tabard = [],
				Attachments = [
					[2, "armor_upgrades/legend_armor_skull_chain_upgrade"],
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"],
					[1, "armor_upgrades/legend_pauldron_upgrade"],				
					[1, "armor_upgrades/legend_metal_plating_upgrade"],
					[1, "armor_upgrades/legend_joint_cover_upgrade"],					
					[1, "armor_upgrades/legend_double_mail_upgrade"],
				]
			}
		]
	},
	{
		ID = "forsaken_boss_armor",	//??
		Script = "",
		Sets = [
			{
				Cloth = [
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_gambeson"],// 65,-8
					[1, "cloth/legend_gambeson_plain"],// 65,-8
					[1, "cloth/legend_gambeson_wolf"],// 70,-9
				],
				Chain = [
					[2,"chain/legend_armor_hauberk"],
					[1,"chain/legend_southern_mail"],
					[1,"chain/legend_armor_hauberk_full"]
				],
				Plate = [
					[1, "plate/legend_armor_leather_brigandine_named"],// 75,-6						
					[1, "plate/legend_thick_plated_barbarian_armor_named"],// 155,-26
					[1, "plate/legend_armor_scale_coat_named"],// 160,-22
					[1, "plate/legend_bronze_armor_named"],// 130,-14
					[1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140,-23				
				],
				Cloak = [
					[1, "cloak/fur_cloak"], // 35, -6
					[1, "cloak/legend_animal_pelt"], // 15, -2
					[1, "cloak/legend_dark_wooly_cloak"], // 15, -2
				],
				Tabard = [],
				Attachments = [
					[2, "armor_upgrades/legend_armor_skull_chain_upgrade"],
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"],
					[1, "armor_upgrades/legend_pauldron_upgrade"],				
					[1, "armor_upgrades/legend_metal_plating_upgrade"],
					[1, "armor_upgrades/legend_joint_cover_upgrade"],					
					[1, "armor_upgrades/legend_double_mail_upgrade"],
				]
			}
		]
	},
	// ENEMIES - BANDITS
	{
		ID = "pov_bandit_gunner_armor",	// 185, -24 (155 - 215)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 60, -7
					[1, "cloth/legend_gambeson"],// 65,-8
					[1, "cloth/legend_padded_surcoat"],// 55,-6
				],
				Chain = [// avg 63, -8
					[1,"chain/legend_armor_mail_shirt"], // 50, -6
					[1,"chain/legend_armor_reinforced_mail_shirt"], // 80, -10
					[1,"chain/legend_armor_short_mail"] // 60, -8 
				],
				Plate = [// avg 62, -8
					[1, "plate/legend_armor_leather_brigandine"],// 65, -8						
					[1, "plate/legend_armor_leather_lamellar"],// 50, -6
					[1, "plate/legend_armor_leather_scale"],// 70, -9		
				],
				Cloak = [],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "pov_rogue_seer_armor", // 115, -12 (90 - 140)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 32, -2
					[1, "cloth/legend_robes"],// 25,-2
					[1, "cloth/legend_southern_robe"],// 25,-1
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_thick_tunic"]// 30,-3
				],
				Chain = [// avg 27, -3
					[1, "chain/legend_armor_mail_shirt_simple"], // 25, -3
					[1, "chain/legend_southern_cloth"] // 30, -2
				],
				Plate = [// avg 43, -5
					[1, "plate/legend_southern_leather_plates"],// 50, -5						
					[1, "plate/legend_armor_leather_lamellar"],// 50, -6
					[1, "plate/legend_southern_leather_jacket"]// 30, -3		
				],
				Cloak = [ // 13, -2
					[1, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_dark_wooly_cloak"],// 15, -2
					[1, "cloak/legend_animal_pelt"]// 15, -2
				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	// ENEMIES - NOBLE/MILITARY
	{
		ID = "pov_noble_seer_armor", // 95, -8 (95 - 95)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 5, 0
					[1, "cloth/legend_robes_wizard"],// 5,0
					[1, "cloth/legend_robes_magic"]// 5,0
				],
				Chain = [],
				Plate = [// avg 65, -6
					[1, "plate/legend_armor_leather_noble"]// 65, -6								
				],
				Cloak = [ // 25, -2
					[1, "cloak/legend_armor_cloak_noble"]// 25, -2

				],
				Tabard = [],
				Attachments = []
			}
		]
	},
	{
		ID = "pov_gunner_knight_armor", // 395, -47 (335 - 440)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 60, -3
					[4, "cloth/legend_knightly_robe"],// 60,-2
					[1, "cloth/legend_padded_surcoat"]// 55,-6
				],
				Chain = [// avg 100, -12
					[1, "chain/legend_armor_hauberk"], // 95, -11
					[1, "chain/legend_armor_hauberk_full"], // 115, -14
					[1, "chain/legend_armor_reinforced_mail"], // 110, -15
					[1, "chain/legend_armor_reinforced_mail_shirt"], // 80, -10
				],
				Plate = [// avg 165, -25
					[1, "plate/legend_armor_plate_cuirass"],// 150, -21						
					[1, "plate/legend_armor_plate_full"],// 160, -22
					[1, "plate/legend_armor_plate_full_greaves"],// 170, -26
					[1, "plate/legend_armor_plate_krastenbrust"],// 170, -26
					[1, "plate/legend_armor_plate_milanese"],// 170, -26
					[1, "plate/legend_armor_plate_triangle"],// 170, -26		
				],
				Cloak = [ // 15, -1
					[1, "cloak/legend_noble_shawl"],// 10, -0
					[1, "cloak/legend_armor_cloak_noble"],// 25, -2
					[1, "cloak/legend_animal_pelt"]// 15, -2
				],
				Tabard = [],
				Attachments = [ // 55, -6
					[1, "armor_upgrades/legend_pauldron_swan_upgrade"], //50, -5, 20% ranged res
					[1, "armor_upgrades/legend_pauldron_stag_upgrade"], //60, -6, 25% direct res
					[1, "armor_upgrades/legend_pauldron_strong_upgrade"], //40, -4, 20% direct res
					[1, "armor_upgrades/legend_metal_pauldrons_upgrade"], //60, -6, none
					[1, "armor_upgrades/legend_heraldic_plates_upgrade"], //70, -7, + ~7 Resolve
				]
			}
		]
	},
	// MERCENARY FACTION
	{
		ID = "pov_mercenary_gunner_armor",	// 210, -26 (175 - 255)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 60, -7
					[1, "cloth/legend_gambeson"],// 65,-8
					[1, "cloth/legend_padded_surcoat"],// 55,-6
				],
				Chain = [// avg 63, -8
					[1,"chain/legend_armor_mail_shirt"], // 50, -6
					[1,"chain/legend_armor_reinforced_mail_shirt"], // 80, -10
					[1,"chain/legend_armor_short_mail"] // 60, -8 
				],
				Plate = [// avg 62, -8
					[1, "plate/legend_armor_leather_brigandine"],// 65, -8						
					[1, "plate/legend_armor_leather_lamellar"],// 50, -6
					[1, "plate/legend_armor_leather_scale"],// 70, -9		
				],
				Cloak = [ // avg 5, 0
					[1, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_sash"],// 3, 0
					[1, "cloak/legend_southern_scarf"],// 5, 0			
				],
				Tabard = [],
				Attachments = [ // avg 20, -2
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"], //25, -1, 7 threat
					[1, "armor_upgrades/legend_leather_neckguard_upgrade"], //15, -2, 10% ranged res.
					[1, "armor_upgrades/legend_leather_shoulderguards_upgrade"], //30, -2, none
				]
			}
		]
	},
	{
		ID = "pov_hired_blade_armor", // 230, -22 (140 - 350)
		Script = "",
		Sets = [
			{
				Cloth = [ // avg 50, -5
					[1, "cloth/legend_southern_robe"],// 25,-1
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_thick_tunic"],// 30,-3
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_padded_surcoat"],// 55,-6
					[1, "cloth/legend_gambeson"],// 65,-8
					[1, "cloth/legend_gambeson_plain"],// 65,-8
				],
				Chain = [ // avg 60, -7
					[1,"chain/legend_southern_padded_chest"], // 45, -4
					[1,"chain/legend_armor_mail_shirt"], // 50, -6
					[1,"chain/legend_armor_reinforced_mail_shirt"], // 80, -10
					[1,"chain/legend_armor_short_mail"] // 60, -8 
				],
				Plate = [ // avg 80, -8
					[1, "plate/legend_southern_leather_plates"],// 50, -5
					[1, "plate/legend_southern_padded"],// 50, -5
					[1, "plate/legend_armor_leather_brigandine"],// 65, -8						
					[1, "plate/legend_armor_leather_lamellar"],// 50, -6
					[1, "plate/legend_armor_leather_scale"],// 70, -9	
					[1, "plate/legend_armor_leather_riveted"],// 95,-13	
					[1, "plate/legend_armor_scale_shirt"],// 85,-10						
					[1, "plate/legend_armor_scale"],// 100,-12
					[1, "plate/legend_armor_leather_brigandine_hardened"],// 110,-15
					[1, "plate/legend_armor_plate_chest"] // 125,-17			
				],
				Cloak = [ // 10, -2
					[1, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_armor_cloak_heavy"],// 30, -5
					[1, "cloak/legend_sash"],// 3, 0
					[1, "cloak/legend_southern_scarf"],// 5, 0	
					[1, "cloak/legend_animal_pelt"], // 15, -2
					[1, "cloak/legend_dark_wooly_cloak"], // 15, -2
				],
				Tabard = [],
				Attachments = [ // avg 30, -4
					[1, "armor_upgrades/legend_leather_neckguard_upgrade"], // 15, -2, 10% ranged res.
					[1, "armor_upgrades/legend_leather_shoulderguards_upgrade"], // 30, -2, none
					[1, "armor_upgrades/legend_pauldron_strong_upgrade"], //40, -4, 20% direct res
					[1, "armor_upgrades/legend_pauldron_upgrade"],	// 50, -7			
					[1, "armor_upgrades/legend_joint_cover_upgrade"], // 15, -3	
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"], // 10		
					[1, "armor_upgrades/legend_double_mail_upgrade"] // 30, -4
				]
			}
		]
	},
	{
		ID = "pov_headhunter_armor", // 150, -18 (135 - 190)
		Script = "",
		Sets = [
			{
				Cloth = [ // avg 30, -3
					[1, "cloth/legend_southern_robe"],// 25,-1
					[1, "cloth/wanderers_coat"],// 45,-4
					[1, "cloth/legend_thick_tunic"],// 30,-3
					[1, "cloth/legend_thick_tunic"]// 30,-3
				],
				Chain = [ // avg 45, -5
					[1,"chain/legend_southern_padded_chest"], // 45, -4
					[1,"chain/legend_armor_mail_shirt"] // 50, -6
				],
				Plate = [ // avg 50, -5
					[1, "plate/legend_southern_leather_plates"],// 50, -5
					[1, "plate/legend_southern_padded"],// 50, -5					
					[1, "plate/legend_armor_leather_lamellar"]// 50, -6		
				],
				Cloak = [ // 8, -1
					[1, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_sash"],// 3, 0
					[1, "cloak/legend_southern_scarf"],// 5, 0	
					[1, "cloak/legend_animal_pelt"] // 15, -2
				],
				Tabard = [],
				Attachments = [ // avg 17, -4
					[1, "armor_upgrades/legend_leather_neckguard_upgrade"], // 15, -2, 10% ranged res.
					[1, "armor_upgrades/legend_leather_shoulderguards_upgrade"], // 30, -2, none		
					[1, "armor_upgrades/legend_joint_cover_upgrade"], // 15, -3	
					[1, "armor_upgrades/legend_direwolf_pelt_upgrade"] // 10 -2
				]
			}
		]
	},
	{
		ID = "pov_hired_gun_armor",	// 130, -10 (105 - 160)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 25, -1
					[1, "cloth/legend_southern_robe"],// 25,-1
					[1, "cloth/legend_southern_tunic"],// 25,-1
				],
				Chain = [// avg 38, -3
					[1,"chain/legend_southern_padded_chest"], // 45, -4
					[1, "chain/legend_southern_cloth"] // 30, -1
				],
				Plate = [// avg 40, -5
					[1, "plate/legend_southern_arm_guards"],// 30, -2						
					[1, "plate/legend_southern_strips"],// 40, -4
					[1, "plate/legend_southern_leather_plates"]// 50, -5		
				],
				Cloak = [ // avg 7, 0
					[1, "cloak/legend_armor_cloak_common"],// 10, -1
					[1, "cloak/legend_sash"],// 3, 0
					[1, "cloak/legend_southern_scarf"]// 5, 0			
				],
				Tabard = [],
				Attachments = [ // avg 20, -2
					[1, "armor_upgrades/legend_leather_neckguard_upgrade"], //15, -2, 10% ranged res.
					[1, "armor_upgrades/legend_leather_shoulderguards_upgrade"] //30, -2, none
				]
			}
		]
	},
	{
		ID = "pov_company_leader_armor", // 395, -47 (335 - 440)
		Script = "",
		Sets = [
			{
				Cloth = [// avg 60, -3
					[4, "cloth/legend_knightly_robe"],// 60,-2
					[1, "cloth/legend_padded_surcoat"]// 55,-6
				],
				Chain = [// avg 100, -12
					[1, "chain/legend_armor_hauberk"], // 95, -11
					[1, "chain/legend_armor_hauberk_full"], // 115, -14
					[1, "chain/legend_armor_reinforced_mail"], // 110, -15
					[1, "chain/legend_armor_reinforced_mail_shirt"], // 80, -10
				],
				Plate = [// avg 165, -25
					[1, "plate/legend_armor_plate_cuirass"],// 150, -21						
					[1, "plate/legend_armor_plate_full"],// 160, -22
					[1, "plate/legend_armor_plate_full_greaves"],// 170, -26
					[1, "plate/legend_armor_plate_krastenbrust"],// 170, -26
					[1, "plate/legend_armor_plate_milanese"],// 170, -26
					[1, "plate/legend_armor_plate_triangle"],// 170, -26		
				],
				Cloak = [ // 15, -1
					[1, "cloak/legend_noble_shawl"],// 10, -0
					[1, "cloak/legend_armor_cloak_noble"],// 25, -2
					[1, "cloak/legend_animal_pelt"]// 15, -2
				],
				Tabard = [],
				Attachments = [ // 55, -6
					[1, "armor_upgrades/legend_pauldron_swan_upgrade"], //50, -5, 20% ranged res
					[1, "armor_upgrades/legend_pauldron_stag_upgrade"], //60, -6, 25% direct res
					[1, "armor_upgrades/legend_pauldron_strong_upgrade"], //40, -4, 20% direct res
					[1, "armor_upgrades/legend_metal_pauldrons_upgrade"], //60, -6, none
					[1, "armor_upgrades/legend_heraldic_plates_upgrade"], //70, -7, + ~7 Resolve
				]
			}
		]
	},
]);