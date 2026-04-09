::TLW.HooksMod.hook("scripts/skills/traits/cocky_trait", function(q)
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
				text = "When at [color=" + this.Const.UI.Color.PositiveValue + "]Confident[/color] morale, gain [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] to all combat stats."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Melee and Ranged Defense"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.Bravery += 5;
		_properties.MeleeDefense += -5;
		_properties.RangedDefense += -5;

		if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident)
		{
			_properties.RangedSkill *= 1.05;
			_properties.MeleeSkill *= 1.05;
			_properties.MeleeDefense *= 1.05;
			_properties.RangedDefense *= 1.05;
			_properties.Initiative *= 1.05;
			_properties.Bravery *= 1.05;
		}
	}
})
