::TLW.HooksMod.hook("scripts/skills/traits/tiny_trait", function(q)
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
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+7[/color] Ranged Defense"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Melee Damage"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.MeleeDamageMult *= 0.90;
		_properties.MeleeDefense += 5;
		_properties.RangedDefense += 7;
	}
})
