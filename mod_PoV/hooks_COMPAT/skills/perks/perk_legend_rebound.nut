::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_rebound", function ( q ) {

	q.onUpdate = @(__original) function(_properties)
	{
		__original(_properties);
		_properties.StaminaMult *= 1.05;
	}

});