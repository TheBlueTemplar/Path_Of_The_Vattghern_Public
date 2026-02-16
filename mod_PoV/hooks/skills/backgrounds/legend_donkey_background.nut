::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_donkey_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		if (::World.Assets.getOrigin() != null)
		{
			if (::World.Assets.getOrigin().getID() == "scenario.pov_donkeys")
			{
				ret.push(
					{
						id = 13,
						type = "text",
						icon = "ui/icons/special.png",
						text = "(Because of Scenario:) +15% Hp, +10% Damage and Damage Resistance, +10% Melee Attack, +10% Resolve, -25% Food Consumed."
					}
				);
			}
		}		
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		if (::World.Assets.getOrigin() != null)
		{
			if (::World.Assets.getOrigin().getID() == "scenario.pov_donkeys")
			{
				_properties.DamageReceivedRegularMult *= 0.90;
				_properties.DamageTotalMult *= 1.10; 
				_properties.HitpointsMult *= 1.15;
				_properties.MeleeSkillMult *= 1.10;
				_properties.BraveryMult *= 1.10;
				_properties.DailyFood *= 0.75;
			}	
		}	
	}
})
