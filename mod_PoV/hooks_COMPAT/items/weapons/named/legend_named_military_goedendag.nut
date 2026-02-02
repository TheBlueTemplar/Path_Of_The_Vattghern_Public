::TLW.HooksMod.hook("scripts/items/weapons/named/legend_named_military_goedendag", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.ArmorDamageMult = 1.20;	//-0.05
	}

	q.onEquip = @(__original) function ()
	{
		__original();

		::Legends.Actives.grant(this, ::Legends.Active.Cudgel, function (_skill) {
			//_skill.m.Icon = "skills/active_132.png";
			//_skill.m.IconDisabled = "skills/active_132_sw.png";
			//_skill.m.Overlay = "active_132";
			_skill.setFatigueCost(_skill.getFatigueCostRaw() + 5);
		}.bindenv(this));
	}

});

