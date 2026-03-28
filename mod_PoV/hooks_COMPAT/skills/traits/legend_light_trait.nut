::TLW.HooksMod.hook("scripts/skills/traits/legend_light_trait", function(q)
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
				id = 11,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=%negative%]-6%[/color] Melee Damage"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=%positive%]+15[/color] Initiative"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.MeleeDamageMult *= 0.94;
		_properties.Initiative += 15;
	}

})
