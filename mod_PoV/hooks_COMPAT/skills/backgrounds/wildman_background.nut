::TLW.HooksMod.hook("scripts/skills/backgrounds/wildman_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/scroll_01.png",
			text = "Cannot Read Books, and it would be a waste of time to try and change that."
		});
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Gain [color=%positive%]10%[/color] bonus damage to the [color=#400080]Punch[/color] skill and [color=%positive%]5%[/color] to the [color=#400080]Choke[/color] skill."
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/pov_extra_special.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] on all stats when fighting in [color=" + this.Const.UI.Color.PositiveValue + "]forests[/color]."
		});
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/pov_rain.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immunity[/color] To rainfall debuffs."
		});
		return ret;
	}

	q.onAnySkillUsed = @(__original) function ( _skill, _targetEntity, _properties )
	{
		if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.HandToHand))
		{
			_properties.DamageTotalMult *= 1.10;
		}
		else if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.LegendChoke))
		{
			_properties.DamageTotalMult *= 1.05;
		}
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		
		_properties.IsAffectedByRain = false;

		if (this.World.State.getPlayer() != null)
		{
			local currentTile = this.World.State.getPlayer().getTile();
			if (currentTile.Type == this.Const.World.TerrainType.Forest || currentTile.Type == this.Const.World.TerrainType.LeaveForest || currentTile.Type == this.Const.World.TerrainType.AutumnForest || currentTile.Type == this.Const.World.TerrainType.SnowyForest)
			{
				_properties.RangedSkillMult *= 1.05;
				_properties.RangedDefenseMult *= 1.05;
				_properties.MeleeSkillMult *= 1.05;
				_properties.MeleeDefenseMult *= 1.05;
				_properties.InitiativeMult *= 1.05;
				_properties.BraveryMult *= 1.05;
				_properties.StaminaMult *= 1.05;
			}
		}		
	}
})
