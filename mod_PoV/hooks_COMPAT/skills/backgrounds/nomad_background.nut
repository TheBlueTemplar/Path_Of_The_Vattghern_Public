::TLW.HooksMod.hook("scripts/skills/backgrounds/nomad_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_extra_special.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+6%[/color] on all stats when fighting in [color=" + this.Const.UI.Color.PositiveValue + "]deserts[/color]."
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
			if (currentTile.Type == this.Const.World.TerrainType.Desert || currentTile.Type == this.Const.World.TerrainType.Oasis)
			{
				_properties.RangedSkillMult *= 1.06;
				_properties.RangedDefenseMult *= 1.06;
				_properties.MeleeSkillMult *= 1.06;
				_properties.MeleeDefenseMult *= 1.06;
				_properties.InitiativeMult *= 1.06;
				_properties.BraveryMult *= 1.06;
				_properties.StaminaMult *= 1.06;
			}
		}		
	}
})
