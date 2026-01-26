::TLW.HooksMod.hook("scripts/items/accessory/undead_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 2500; // up from 500
	}	

	q.getTooltip = @(__original) function()
	{
		//local ret = __original();
		local result = [
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
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 13,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] resolve."
		});
		result.push({
			id = 13,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Damage done (%) against undead increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of current resolve."
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Any undead hit are [color=" + this.Const.UI.Color.DamageValue + "]consecrated[/color], making them take damage over time, and susceptible to bleeding, poison and injuries."
		});
		return result;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		//__original(_properties);
		this.accessory.onUpdateProperties(_properties);
		_properties.Bravery += 15;
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Undead || this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Zombies || _targetEntity.getFlags().has("undead"))
			{
				local bonus = _properties.Bravery * 0.10;
				local damageBonus = 1.00 + (this.Math.maxf(1,bonus) / 100); 
				_properties.DamageTotalMult *= damageBonus;
			}
		}	
	}

	q.onDamageDealt <- function ( _target, _skill, _hitInfo )
	{
		
		if ( _skill == null || _skill.m.IsWeaponSkill == false )
			return;

		if (!_target.isAlive() || _target.isDying())
			return;


		if (_target.getFlags().has("undead"))
		{
			local holyFlame = this.new("scripts/skills/effects/legend_consecrated_effect");
			holyFlame.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
			_target.getSkills().add(holyFlame);
		}
	}

});

