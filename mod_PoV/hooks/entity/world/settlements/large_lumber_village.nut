::TLW.HooksMod.hook("scripts/entity/world/settlements/large_lumber_village", function(q) 
{
	q.create = @(__original) function()
	{
		__original();
		this.m.DraftList.extend([
			"pov_mutant_background"
		]);
	}
});
