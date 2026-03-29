::TLW.HooksMod.hook("scripts/skills/traits/craven_trait", function(q)
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
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Resolve"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+4[/color] Melee Defense"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += -12;
		_properties.IsContentWithBeingInReserve = true;
		_properties.MeleeDefense += 4;
	}
})
