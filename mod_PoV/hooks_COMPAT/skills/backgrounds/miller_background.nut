::TLW.HooksMod.hook("scripts/skills/backgrounds/miller_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		local r = this.Math.rand(1,6);
		if (r == 1)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.ClubClassTree,
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
	
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "Max Health increased by [color=" + this.Const.UI.Color.PositiveValue + "]6%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.HitpointsMult *= 1.06;
	}
})
