::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_assassin_commander_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.KnifeClassTree,
		]);
	}

})
