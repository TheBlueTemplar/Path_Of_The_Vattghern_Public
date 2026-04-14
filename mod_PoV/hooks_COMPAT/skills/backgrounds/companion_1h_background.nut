::TLW.HooksMod.hook("scripts/skills/backgrounds/companion_1h_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		this.m.PerkTreeDynamic.Class.extend([
			::Const.Perks.MilitiaClassTree,
		]);
	}
	
})
