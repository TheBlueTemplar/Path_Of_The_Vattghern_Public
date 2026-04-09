::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_leech_peddler_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.PovSickleClassTree,
		]);
	}
	
})
