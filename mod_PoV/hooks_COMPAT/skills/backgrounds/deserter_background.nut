::TLW.HooksMod.hook("scripts/skills/backgrounds/deserter_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.PitchforkClassTree,
		]);
	}
	
})
