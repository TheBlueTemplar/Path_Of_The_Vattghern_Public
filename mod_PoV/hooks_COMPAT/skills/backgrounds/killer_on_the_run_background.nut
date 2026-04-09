::TLW.HooksMod.hook("scripts/skills/backgrounds/killer_on_the_run_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.PovKnifeClassTree,
		]);
	}

})
