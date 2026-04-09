::TLW.HooksMod.hook("scripts/skills/traits/hesitant_trait", function(q)
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
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Initiative"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-4%[/color] resolve."
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		//__original(_properties);
		_properties.Initiative += -10;
		_properties.BraveryMult *= 0.96;
	}
})
