::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/fletcher_building", function( q ) {

	q.fillStash = @( __original ) function(_list, _stash, _priceMult, _allowDamagedEquipment = false)
	{
		// NEW AMMO
		_list.extend([
			{
				R = 75,
				P = 1.0,
				S = "ammo/pov_silver_arrows"
			},
			{
				R = 75,
				P = 1.0,
				S = "ammo/pov_silver_bolts"
			},
			{
				R = 80,
				P = 1.0,
				S = "ammo/pov_sling_limestone_pebbles"
			},
			{
				R = 80,
				P = 1.0,
				S = "ammo/pov_sling_basalt_rocks"
			},
			{
				R = 85,
				P = 1.0,
				S = "ammo/pov_sling_pumice_pebbles"
			},
			{
				R = 98,
				P = 3.0,
				S = "weapons/named/pov_named_goblin_spiked_balls"
			}
		]);
		
		__original( _list, _stash, _priceMult, _allowDamagedEquipment);
				
	}

});