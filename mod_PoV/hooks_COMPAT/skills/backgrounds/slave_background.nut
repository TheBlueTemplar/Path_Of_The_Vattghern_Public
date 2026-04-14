::TLW.HooksMod.hook("scripts/skills/backgrounds/slave_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		local r = this.Math.rand(1,6);
		if (r == 1)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.KnifeClassTree,
			]);
		} else if (r == 2)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.ButcherClassTree,
			]);
		} else if (r == 3)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.ShovelClassTree,
			]);
		} else if (r == 4)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.PitchforkClassTree,
			]);
		} else if (r == 5)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.SlingClassTree,
			]);
		} else if (r == 6)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.ScytheClassTree,
			]);
		}	
	}

})
