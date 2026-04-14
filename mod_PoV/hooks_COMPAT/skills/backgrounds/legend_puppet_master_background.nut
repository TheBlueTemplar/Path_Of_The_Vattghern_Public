::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_puppet_master_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.ShovelClassTree,
		]);
	}
	
})
