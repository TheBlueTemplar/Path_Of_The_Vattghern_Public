::TLW.HooksMod.hook("scripts/skills/traits/impatient_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Always acts first in the very first round of combat"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "[color=%negative%]-5%[/color] Melee and Ranged Defense"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=%positive%]+5%[/color] Initiative"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		//__original(_properties);

		if (this.getContainer().getActor().isPlacedOnMap() && this.Time.getRound() <= 1)
		{
			_properties.InitiativeForTurnOrderAdditional += 1000;
		}
		
		_properties.RangedDefenseMult *= 0.95;
		_properties.MeleeDefenseMult *= 0.95;
		_properties.InitiativeMult *= 1.05;
	}
})
