::TLW.HooksMod.hook("scripts/entity/world/settlements/buildings/weaponsmith_building", function ( q ) {

	q.fillStash = @( __original ) function(_list, _stash, _priceMult, _allowDamagedEquipment = false)
	{
		_list.extend([
			{
				R = 75,
				P = 1.0,
				S = "weapons/pov_whip_mace"
			},
			{
				R = 97,
				P = 2.0,
				S = "weapons/named/pov_whip_mace_named"
			},
			{
				R = 97,
				P = 2.0,
				S = "special/pov_silvering_kit"
			},
			{
				R = 80,
				P = 1.0,
				S = "weapons/pov_feuerbuchse"
			},
			{
				R = 90,
				P = 1.0,
				S = "weapons/pov_feuerspeier"
			}
		]);
		__original( _list, _stash, _priceMult, _allowDamagedEquipment);
	}

});