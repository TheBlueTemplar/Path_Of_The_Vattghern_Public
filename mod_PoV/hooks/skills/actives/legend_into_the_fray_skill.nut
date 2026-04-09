::TLW.HooksMod.hook("scripts/skills/actives/legend_into_the_fray_skill", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.FatigueCost = 25;
	}

});	
