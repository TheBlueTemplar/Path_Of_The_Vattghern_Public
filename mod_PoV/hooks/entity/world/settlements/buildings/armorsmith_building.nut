::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/armorsmith_building", function ( q ) {

	q.fillStash = @( __original ) function(_list, _stash, _priceMult, _allowDamagedEquipment = false)
	{
		_list.extend([
			{
				R = 75,
				P = 1.0,
				S = "shields/pov_steel_buckler_shield"
			},
			{
				R = 97,
				P = 2.0,
				S = "shields/named/pov_named_steel_buckler_shield"
			},
			{
				R = 80,//80
				P = 1.0,
				S = "accessory/gloves/pov_silver_gauntlets"
			}
		]);

		// Remove uneeded items (more simple, blunt method)
		for (local i = _list.len() - 1; i >= 0; i--) 
		{
		    if (_list[i].S == "legend_armor/armor_upgrades/legend_light_gladiator_upgrade" || _list[i].S == "legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade")
		    {
		        _list.remove(i);
		    }
		}
		
		__original( _list, _stash, _priceMult, _allowDamagedEquipment);

	}

});