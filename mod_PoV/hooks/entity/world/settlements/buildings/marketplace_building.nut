::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/marketplace_building", function( q ) {

	q.fillStash = @( __original ) function(_list, _stash, _priceMult, _allowDamagedEquipment = false)
	{
        // some mods can call fillStash with a null list
        if (_list == null) {
            __original(_list, _stash, _priceMult, _allowDamagedEquipment);
            return;
        }

		_list.extend([
			{
				R = 90,
				P = 1.0,
				S = "accessory/pov_rock_item"
			}
		]);

		// SEASONAL (XMAS)
		/*_list.extend([
			{
				R = 40,
				P = 1.0,
				S = "legend_helmets/vanity/pov_helmet_xmas_hat"
			}
		]);*/
		
		__original( _list, _stash, _priceMult, _allowDamagedEquipment);
				
	}

});