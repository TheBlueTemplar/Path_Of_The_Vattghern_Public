::TLW.HooksMod.hook("scripts/skills/backgrounds/daytaler_background", function(q)
{
	q.create = @(__original) function()
	{
		__original();
		local r = this.Math.rand(1,7);
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
		} else if (r == 7)
		{
			this.m.PerkTreeDynamic.Class.extend([
				::Const.Perks.SickleClassTree,
			]);
		}	
	}
	
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Max Fatigue increased by [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.StaminaMult *= 1.05;
	}
})
