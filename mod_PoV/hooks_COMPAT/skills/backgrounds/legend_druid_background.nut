::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_druid_background", function(q)
{
	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovEasyLearnRead"))
		{
			actor.getFlags().add("PovEasyLearnRead");
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can learn to read books much quicker, and without penalties."
			}
		);
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_extra_special.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] on all stats when fighting in [color=" + this.Const.UI.Color.PositiveValue + "]forests[/color]."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		if (this.World.State.getPlayer() != null)
		{
			local currentTile = this.World.State.getPlayer().getTile();
			if (currentTile.Type == this.Const.World.TerrainType.Forest || currentTile.Type == this.Const.World.TerrainType.LeaveForest || currentTile.Type == this.Const.World.TerrainType.AutumnForest || currentTile.Type == this.Const.World.TerrainType.SnowyForest)
			{
				_properties.RangedSkillMult *= 1.10;
				_properties.RangedDefenseMult *= 1.10;
				_properties.MeleeSkillMult *= 1.10;
				_properties.MeleeDefenseMult *= 1.10;
				_properties.InitiativeMult *= 1.10;
				_properties.BraveryMult *= 1.10;
				_properties.StaminaMult *= 1.10;
			}
		}		
	}
})
