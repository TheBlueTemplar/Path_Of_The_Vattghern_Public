::TLW.HooksMod.hook("scripts/skills/traits/eagle_eyes_trait", function(q)
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
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Vision"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Ranged Defense"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		//__original(_properties);
		_properties.Vision += 1;
		_properties.RangedDefense += 3;
	}
})
