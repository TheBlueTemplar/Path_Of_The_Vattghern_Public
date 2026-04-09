::TLW.HooksMod.hook("scripts/skills/traits/determined_trait", function(q)
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
				icon = "ui/icons/morale.png",
				text = "Will start combat at confident morale if permitted by mood"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "When at [color=" + this.Const.UI.Color.PositiveValue + "]Confident[/color] morale, gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Resolve."
			}
		];
	}

	q.onCombatStarted = @(__original) function()
	{
		local actor = this.getContainer().getActor();

		if (actor.getMoodState() >= this.Const.MoodState.Neutral && actor.getMoraleState() < this.Const.MoraleState.Confident)
		{
			actor.setMoraleState(this.Const.MoraleState.Confident);
		}
	}

	q.onUpdate = @(__original) function( _properties )
	{
		if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident)
		{
			_properties.Bravery *= 1.10;
		}
	}

})
