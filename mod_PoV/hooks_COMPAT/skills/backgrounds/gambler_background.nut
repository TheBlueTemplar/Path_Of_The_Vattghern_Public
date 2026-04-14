::TLW.HooksMod.hook("scripts/skills/backgrounds/gambler_background", function(q)
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
	
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] chance to hit the head"
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+4%[/color] chance to have any attacker require two successful attack rolls in order to hit."
			}
		);
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_luck.png",
				text = "Chance to hit increased by[color=" + this.Const.UI.Color.PositiveValue + "]1%[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.HitChance[this.Const.BodyPart.Head] += 2;
		_properties.RerollDefenseChance += 4;
		_properties.MeleeSkill += 1;
		_properties.RangedSkill += 1;
	}
})
