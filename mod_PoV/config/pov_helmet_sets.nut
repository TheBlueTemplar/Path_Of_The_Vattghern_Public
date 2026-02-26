::Const.LegendMod.HelmObjs.extend([
	// ALL STATS SHOWN IN COMMENTS ASSUME POV'S OVERHAULED STUFF ARE ACTIVE
	// BACKGROUNDS
	{
		ID = "vattghern_helmet_01", //135, -7, -2 , 70 (armor,fatigue,vision,???) (125 - 150)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg of 55 , -3, 0
					[1, "hood/legend_helmet_aventail"], // 60, -4, 0
					[1, "hood/legend_helmet_leather_hood"], //45, -2, 0,
					[1, "hood/legend_helmet_padded_hood"], //50, -2, 0
					[1, "hood/legend_helmet_open_chain_hood"] //60, -3, 0, 200
				],
				Helms = [//avg of 50, -3 , -1
					[1, "helm/legend_helmet_norman_helm"]// 50, -3 , -1
				],
				Tops = [ // avg of 20 , -1
					[1, "top/legend_helmet_chain_attachment"], //20, -1
					[1, "top/legend_helmet_nose_plate"] //20, -1, 0
				],
				Vanity = [ // avg of 10 , 0 , 0
					[1, "vanity/legend_helmet_hood_cloth_round"], //10
					[1, "vanity/legend_helmet_hood_cloth_wide"], //10
					[1, "vanity/legend_helmet_hood_cloth_square"], //10
					[1, "vanity/legend_helmet_hood_cloth_long"] //10
				]
			}
		]
	},
	{
		ID = "mutant_helmet_01", //115 -5 -2 , 70 (armor,fatigue,vision,???) (105 - 125)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg of 40, -1, 0
					[1, "hood/legend_helmet_leather_hood"], //45, -2, 0,
					[1, "hood/legend_helmet_simple_hood"], //30, -1, 0
					[1, "hood/legend_helmet_padded_cap"] //40, -1, 0, 200
				],
				Helms = [//avg of 50, -3 , -1
					[1, "helm/legend_helmet_norman_helm"]// 50, -3 , -1
				],
				Tops = [ // avg of 20 , -1
					[1, "top/legend_helmet_chain_attachment"], //20, -1, 0
					[1, "top/legend_helmet_nose_plate"] //20, -1, 0
				],
				Vanity = [ // avg of 10 , 0 , 0
					[1, "vanity/legend_helmet_hood_cloth_round"], //10
					[1, "vanity/legend_helmet_hood_cloth_wide"], //10
					[1, "vanity/legend_helmet_hood_cloth_square"], //10
					[1, "vanity/legend_helmet_hood_cloth_long"] //10
				]
			}
		]
	},
	{
		ID = "caravan_guard_helmet_01", //120 -5 -2 , 70 (armor,fatigue,vision,???) (115 - 130)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg of 40, -1, 0
					[1, "hood/legend_helmet_leather_hood"], //45, -2, 0,
					[1, "hood/legend_helmet_padded_cap"] //40, -1, 0, 200
				],
				Helms = [//avg of 55, -3 , -1
					[1, "helm/legend_helmet_norman_helm"],// 50, -3 , -1
					[1, "helm/legend_helmet_horsetail"] // 60, -3, -1
				],
				Tops = [ // avg of 20 , -1
					[1, "top/legend_helmet_chain_attachment"], //20, -1, 0
					[1, "top/legend_helmet_nose_plate"] //20, -1, 0
				],
				Vanity = [ // avg of 10 , 0 , 0 (5% for fancy hat lol)
					[2, "vanity/legend_helmet_hood_cloth_round"], //10
					[2, "vanity/legend_helmet_hood_cloth_wide"], //10
					[2, "vanity/legend_helmet_hood_cloth_square"], //10
					[2, "vanity/legend_helmet_hood_cloth_long"], //10
					[1, "vanity/legend_helmet_feathered_hat"] // 10
				]
			}
		]
	},
	// ENEMIES - MUTANTS
	{
		ID = "forsaken_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[2, "hood/legend_helmet_open_chain_hood"],
					[4, "hood/legend_helmet_chain_hood"],
					[1, "hood/legend_helmet_padded_cap"],
					[3, "hood/legend_helmet_chain_hood_full"]
				],
				Helms = [
					[1, "helm/legend_helmet_enclave_kettle"],
					[1, "helm/legend_helmet_enclave_skullcap"],
					[2, "helm/legend_helmet_heavy_plate_helm"],			
					[4, "helm/legend_helmet_flat_top_helm_polished"],
					[1, "helm/legend_helmet_italo_norman_helm"],
					[6, "helm/legend_helmet_great_helm"]
				],
				Tops = [
					[2, "top/legend_helmet_chain_attachment"],
					[3, "top/legend_helmet_faceplate_flat"],
					[1, "top/legend_helmet_faceplate_curved"],
					[1, "top/legend_helmet_facemask"],					
					[1, "top/legend_helmet_faceplate_full_breaths"],
					[2, "top/legend_helmet_faceplate_snub_slit"]
				],
				Vanity = [
					[1, "vanity/legend_helmet_bull_horns"],
					[1, "vanity/legend_helmet_impaled_head"],
					[1, "vanity/legend_helmet_ram_horns"],
					[1, "vanity/legend_helmet_hood_cloth_square"],
					[4, "vanity/legend_helmet_fleshcultist_straps"]
				]
			}
		]
	},
	{
		ID = "forsaken_boss_helmet",
		Script = "",
		Sets = [
			{
				Hoods = [
					[2, "hood/legend_helmet_open_chain_hood"],
					[4, "hood/legend_helmet_chain_hood"],
					[1, "hood/legend_helmet_padded_cap"],
					[3, "hood/legend_helmet_chain_hood_full"]
				],
				Helms = [
					[1, "helm/legend_helmet_enclave_kettle"],
					[1, "helm/legend_helmet_enclave_skullcap"],
					[2, "helm/legend_helmet_heavy_plate_helm"],				
					[4, "helm/legend_helmet_flat_top_helm_polished"],
					[1, "helm/legend_helmet_italo_norman_helm"],
					[6, "helm/legend_helmet_great_helm"]
				],
				Tops = [
					[1, "top/legend_helmet_bascinet_visor_named"],
					[1, "top/legend_helmet_faceplate_full_01_named"],
					[1, "top/legend_helmet_wallace_sallet_visor_named"],
				],
				Vanity = [
					[1, "vanity/legend_helmet_bull_horns"],
					[1, "vanity/legend_helmet_impaled_head"],
					[1, "vanity/legend_helmet_ram_horns"],
					[1, "vanity/legend_helmet_hood_cloth_square"],
					[1, "vanity/legend_helmet_fleshcultist_straps"]
				]
			}
		]
	},
	// ENEMIES - BANDITS
	{
		ID = "pov_bandit_gunner_helmet", // avg 158, -7, -1 (125 - 185)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 63, -3, 0
					[1, "hood/legend_helmet_open_chain_hood"], // 65, -3, 0
					[1, "hood/legend_helmet_chain_hood"], // 75, -4, 0
					[1, "hood/legend_helmet_padded_hood"] // 50, -2, 0
				],
				Helms = [ // avg, 74, -4, -1
					[1, "helm/legend_helmet_flat_top_helm_low"], // 70, -5, -1				
					[1, "helm/legend_helmet_flat_top_helm"], // 85, -5, -1
					//[1, "helm/legend_helmet_bascinet"], // 80, -5, -1
					[1, "helm/legend_helmet_horsetail"] // 60, -3, -1
				],
				Tops = [ // avg, 17 , -1 , 0
					[1, "top/legend_helmet_chain_attachment"], //20, -1, 0
					[1, "top/legend_helmet_nose_plate"], //20, -1, 0
					[1, "top/legend_helmet_headband_side"] //10, 0, 0
				],
				Vanity = [ // avg, 4 , 0 , 0
					[1, "vanity/legend_helmet_noble_feather"], // 2, 0, 0
					[1, "vanity/legend_helmet_ponytail"], // 5, 0, 0
					[1, "vanity/legend_helmet_side_feather"] // 5, 0, 0
				]
			}
		]
	},
	{
		ID = "pov_rogue_seer_helmet", // avg 105, -4, 0 (95 - 120)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 35, -1, 0
					[1, "hood/legend_helmet_simple_hood"], // 30, -1, 0
					[1, "hood/legend_helmet_leather_cap"], // 35, -1, 0
					[1, "hood/legend_helmet_padded_hood"] // 40, -1, 0
				],
				Helms = [ // avg, 42, -2, -1
					[1, "helm/legend_southern_cap_smooth"], // 40, -2, 0				
					[1, "helm/legend_helmet_norman_helm"], // 50, -3, -1
					[1, "helm/legend_helmet_barb_metal_cap"] // 40, -2, 0
				],
				Tops = [ // avg, 18 , -1 , 0
					[1, "top/legend_helmet_facemask"], //20, -1, 0
					[1, "top/legend_helmet_eyemask"] //15, 0, 0
				],
				Vanity = [ // avg, 10 , 0 , 0
					[1, "vanity/legend_helmet_hood_cloth_round"], //10
					[1, "vanity/legend_helmet_hood_cloth_wide"], //10
					[1, "vanity/legend_helmet_hood_cloth_square"], //10
					[1, "vanity/legend_helmet_hood_cloth_long"] //10
				]
			}
		]
	},
	// ENEMIES - NOBLE
	{
		ID = "pov_noble_seer_helmet", // avg 100, -4, 0 (90 - 110)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 35, -1, 0
					[1, "hood/legend_helmet_simple_hood"], // 30, -1, 0
					[1, "hood/legend_helmet_leather_cap"], // 35, -1, 0
					[1, "hood/legend_helmet_padded_hood"] // 40, -1, 0
				],
				Helms = [ // avg, 45, -2, -1
					[1, "helm/legend_southern_cap_smooth"], // 40, -2, 0				
					[1, "helm/legend_helmet_norman_helm"] // 50, -3, -1
				],
				Tops = [ // avg, 15 , -1 , 0
					[1, "top/legend_helmet_nose_plate"] // 15, -1
				],
				Vanity = [ // avg, 5 , 0 , 0
					[1, "vanity/legend_helmet_wizard_cowl"] //5
				]
			}
		]
	},
	{
		ID = "pov_gunner_knight_helmet", // avg 310, -20, -3 (280 - 335)
		Script = "",
		Sets = [
			{
				Hoods = [// 75, -4, 0
					[1, "hood/legend_helmet_open_chain_hood"], // 65,-3,0
					[1, "hood/legend_helmet_chain_hood"], // 75,-4,0
					[1, "hood/legend_helmet_mail_coif"], // 85,-5,0
					[1, "hood/legend_helmet_chain_hood_full"] // 80,-4,0
				],
				Helms = [ // 175, -12, -2
					[1, "helm/legend_helmet_heavy_plate_helm"], // 175,-15,-2		
					[1, "helm/legend_helmet_enclave_great_bascinet"], // 180,-13,-2
					[1, "helm/legend_helmet_enclave_great_helm"], // 180,-12,-2
					[1, "helm/legend_helmet_great_helm"] // 175,-12,-2
				],
				Tops = [ // 45, -4, -1
					[1, "top/legend_helmet_enclave_armet_visor"], // 35,-2,-1
					[1, "top/legend_helmet_enclave_great_bascinet_visor"], // 45,-3,-1
					[1, "top/legend_helmet_faceplate_full"], // 60,-5,-1
					[1, "top/legend_helmet_faceplate_pointed"], // 50,-4,-1
					[1, "top/legend_helmet_faceplate_winged"] // 45,-4,-1
				],
				Vanity = [ // 10, 0, 0
					[1, "vanity/legend_helmet_faction_helmet_2"], // 10,0,0
					//[1, "vanity/legend_helmet_fencer_hat"], // 15,0,0
					[1, "vanity/legend_helmet_feathered_hat"], // 10,0,0
					[1, "vanity/legend_helmet_noble_floppy_hat"] // 10,0,0
				]
			}
		]
	},
	// MERCENARY FACTION
	{
		ID = "pov_mercenary_gunner_helmet", // avg 180, -8, -2 (155 - 220)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 63, -3, 0
					[1, "hood/legend_helmet_open_chain_hood"], // 65, -3, 0
					[1, "hood/legend_helmet_chain_hood"], // 75, -4, 0
					[1, "hood/legend_helmet_padded_hood"] // 50, -2, 0
				],
				Helms = [ // avg, 74, -4, -1
					[1, "helm/legend_helmet_flat_top_helm_low"], // 70, -5, -1				
					[1, "helm/legend_helmet_flat_top_helm"], // 85, -5, -1
					//[1, "helm/legend_helmet_bascinet"], // 80, -5, -1
					[1, "helm/legend_helmet_horsetail"] // 60, -3, -1
				],
				Tops = [ // avg, 40 , -2 , -1
					[1, "top/legend_helmet_faceplate_flat"], //35, -2, -1
					[1, "top/legend_helmet_faceplate_long"], //35, -2, -1
					[1, "top/legend_helmet_headband_side"], //50, -3, 0
					[1, "top/legend_helmet_faceplate_raised"] // 50, -3, 0
				],
				Vanity = [ // avg, 10 , 0 , 0
					//[1, "vanity/legend_helmet_fencer_hat"], // 15,0,0
					[1, "vanity/legend_helmet_feathered_hat"] // 10,0,0
				]
			}
		]
	},
	{
		ID = "pov_hired_blade_helmet", // avg 205, -11, -1 (150 - 265)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 67, -3, 0
					[1, "hood/legend_helmet_padded_hood"], // 50, -2, 0
					[1, "hood/legend_helmet_open_chain_hood"], // 65, -3, 0
					[1, "hood/legend_helmet_chain_hood"], // 75, -4, 0
					[1, "hood/legend_helmet_chain_hood_full"] // 80,-4,0
				],
				Helms = [ // avg, 85, -5, -1
					[1, "helm/legend_helmet_horsetail"], // 60, -3, -1
					[1, "helm/legend_helmet_flat_top_helm_low"], // 70, -5, -1
					//[1, "helm/legend_helmet_bascinet"], // 80, -5, -1				
					[1, "helm/legend_helmet_flat_top_helm"], // 85, -5, -1
					[1, "helm/legend_helmet_italo_norman_helm"], // 90, -6, -2		
					[1, "helm/legend_helmet_deep_cervelliere"], // 100, -5, -1
					[1, "helm/legend_helmet_conic_helm"] // 110, -6, -1
				],
				Tops = [ // avg, 45 , -3 , -1
					[1, "top/legend_helmet_faceplate_flat"], //35, -2, -1
					[1, "top/legend_helmet_faceplate_long"], //35, -2, -1
					[1, "top/legend_helmet_faceplate_winged"], // 45,-4,-1	
					[1, "top/legend_helmet_enclave_great_bascinet_visor"], // 45,-3,-1
					[1, "top/legend_helmet_faceplate_pointed"], // 50,-4,-1
					[1, "top/legend_helmet_headband_side"], //50, -3, 0
					[1, "top/legend_helmet_faceplate_raised"], // 50, -3, 0
					[1, "top/legend_helmet_faceplate_full"] // 60,-5,-1
				],
				Vanity = [ // avg, 8 , 0 , 0
					[1, "vanity/legend_helmet_noble_feather"], // 2, 0, 0
					[1, "vanity/legend_helmet_ponytail"], // 5, 0, 0
					[1, "vanity/legend_helmet_side_feather"], // 5, 0, 0
					//[1, "vanity/legend_helmet_fencer_hat"], // 15,0,0
					[1, "vanity/legend_helmet_feathered_hat"], // 10,0,0
					[1, "vanity/legend_helmet_hood_cloth_long"], //10
					[1, "vanity/legend_helmet_metal_bird"] //10
				]
			}
		]
	},
	{
		ID = "pov_headhunter_helmet", // avg 135, -6, -1 (105 - 155)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 35, -1, 0
					[1, "hood/legend_helmet_simple_hood"], // 30, -1, 0
					[1, "hood/legend_helmet_leather_cap"], // 35, -1, 0
					[1, "hood/legend_helmet_padded_hood"] // 40, -1, 0
				],
				Helms = [ // avg, 75, -4, -1
					[1, "helm/legend_helmet_flat_top_helm_low"], // 70, -5, -1				
					[1, "helm/legend_helmet_flat_top_helm"], // 85, -5, -1
					//[1, "helm/legend_helmet_bascinet"], // 80, -5, -1
					[1, "helm/legend_helmet_horsetail"] // 60, -3, -1
				],
				Tops = [ // avg, 17 , -1 , 0
					[1, "top/legend_helmet_chain_attachment"], //20, -1, 0
					[1, "top/legend_helmet_nose_plate"], //20, -1, 0
					[1, "top/legend_helmet_headband_side"] //10, 0, 0
				],
				Vanity = [ // avg, 8 , 0 , 0
					[1, "vanity/legend_helmet_noble_feather"], // 2, 0, 0
					[1, "vanity/legend_helmet_ponytail"], // 5, 0, 0
					[1, "vanity/legend_helmet_side_feather"], // 5, 0, 0
					//[1, "vanity/legend_helmet_fencer_hat"], // 15,0,0
					[1, "vanity/legend_helmet_feathered_hat"], // 10,0,0
					[1, "vanity/legend_helmet_hood_cloth_long"], //10
					[1, "vanity/legend_helmet_metal_bird"] //10
				]
			}
		]
	},
	{
		ID = "pov_hired_gun_helmet", // avg 110, -4, -1 (90 - 130)
		Script = "",
		Sets = [
			{
				Hoods = [ // avg, 40, -1, 0
					[1, "hood/legend_helmet_southern_niqaab"], // 45, -1, 0
					[1, "hood/legend_helmet_southern_open_hood"], // 40, -1, 0
					[1, "hood/legend_helmet_southern_turban_light_hood"] // 40, -1, 0
				],
				Helms = [ // avg, 35, -1, -0
					[1, "helm/legend_helmet_southern_cap_smooth"], // 40, -2, -0				
					[1, "helm/legend_helmet_southern_cap_spiked"], // 40, -2, -0
					[1, "helm/legend_helmet_southern_studded_leather_helm"] // 25, -1, -0
				],
				Tops = [ // avg, 30 , -2 , -1
					[1, "top/legend_helmet_southern_faceplate"], //40, -2, -1
					[1, "top/legend_helmet_facemask"] //20, -1, 0
				],
				Vanity = [ // avg, 5 , 0 , 0
					[1, "vanity/legend_helmet_southern_headband"], // 5,0,0
					[1, "vanity/legend_helmet_southern_patterned_headwrap"], // 5,0,0
					[1, "vanity/legend_helmet_southern_patterned_headband"] // 5,0,0
				]
			}
		]
	},
	{
		ID = "pov_company_leader_helmet", // avg 310, -20, -3 (280 - 335)
		Script = "",
		Sets = [
			{
				Hoods = [// 75, -4, 0
					[1, "hood/legend_helmet_open_chain_hood"], // 65,-3,0
					[1, "hood/legend_helmet_chain_hood"], // 75,-4,0
					[1, "hood/legend_helmet_mail_coif"], // 85,-5,0
					[1, "hood/legend_helmet_chain_hood_full"] // 80,-4,0
				],
				Helms = [ // 175, -12, -2
					[1, "helm/legend_helmet_heavy_plate_helm"], // 175,-15,-2		
					[1, "helm/legend_helmet_enclave_great_bascinet"], // 180,-13,-2
					[1, "helm/legend_helmet_enclave_great_helm"], // 180,-12,-2
					[1, "helm/legend_helmet_great_helm"] // 175,-12,-2
				],
				Tops = [ // 45, -4, -1
					[1, "top/legend_helmet_enclave_armet_visor"], // 35,-2,-1
					[1, "top/legend_helmet_enclave_great_bascinet_visor"], // 45,-3,-1
					[1, "top/legend_helmet_faceplate_full"], // 60,-5,-1
					[1, "top/legend_helmet_faceplate_pointed"], // 50,-4,-1
					[1, "top/legend_helmet_faceplate_winged"] // 45,-4,-1
				],
				Vanity = [ // 10, 0, 0
					//[1, "vanity/legend_helmet_fencer_hat"], // 15,0,0
					[1, "vanity/legend_helmet_feathered_hat"], // 10,0,0
					[1, "vanity/legend_helmet_noble_floppy_hat"] // 10,0,0
				]
			}
		]
	},
]);


