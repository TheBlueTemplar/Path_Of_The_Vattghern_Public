::TLW.HooksMod.hook("scripts/skills/actives/legend_prayer_of_faith_skill", function ( q ) {

	q.create = @(__original) function()
	{	
		__original();
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
	}

});	