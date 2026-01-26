::TLW.HooksMod.hook("scripts/entity/world/settlements/large_tundra_fort", function(q) 
{
	q.create = @(__original) function()
	{
		__original();
		this.m.DraftList.extend([
			"pov_mutant_background"
		]);
	}
});
