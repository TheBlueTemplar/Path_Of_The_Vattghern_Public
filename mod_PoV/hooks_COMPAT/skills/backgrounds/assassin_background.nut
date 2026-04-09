::TLW.HooksMod.hook("scripts/skills/backgrounds/assassin_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.PovKnifeClassTree,
		]);
	}

})
