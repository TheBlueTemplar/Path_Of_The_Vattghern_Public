this.pov_rain_special <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.pov_rain";
		this.m.Name = "Rainfall";
		this.m.Description = "The rain obscures vision and makes everything slippery,  but it can protect against fire";
		this.m.Icon = "skills/pov_rain_effect.png";
		this.m.IconMini = "status_effect_35_mini";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] Vision"
		});
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Ranged Skill"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]+15%[/color] Fatigue Costs"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/pov_fire.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] Fire Resistance"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		if (this.Tactical.isActive() && this.Tactical.getWeather().IsRaining)
		{
			this.m.IsHidden = !_properties.IsAffectedByRain;
			if (_properties.IsAffectedByRain)
			{
				_properties.Vision -= 1;
				_properties.RangedSkillMult *= 0.85;
				_properties.FatigueEffectMult *= 1.15;
			}
		}else
		{
			this.m.IsHidden = true;
		}	
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (this.Tactical.getWeather().IsRaining && _hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedTotalMult *= 0.70;
		}
	}

});

