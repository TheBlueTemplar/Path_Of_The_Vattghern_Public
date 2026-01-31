::TLW.HooksMod.hook("scripts/skills/traits/legend_sureshot_trait", function(q)
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
				icon = "ui/icons/ranged_skill.png",
				text = "[color=%positive%]+10%[/color] Ranged Damage"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=%negative%]-5[/color] Ranged Defense"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.RangedDamageMult *= 1.1;
		_properties.RangedDefense -= 5;
	}
})
