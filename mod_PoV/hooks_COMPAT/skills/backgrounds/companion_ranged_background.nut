::TLW.HooksMod.hook("scripts/skills/backgrounds/companion_ranged_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.PovInquisitionClassTree,
		]);
	}
	
})
