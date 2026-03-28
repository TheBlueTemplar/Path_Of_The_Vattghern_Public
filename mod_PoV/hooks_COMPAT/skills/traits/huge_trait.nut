::TLW.HooksMod.hook("scripts/skills/traits/huge_trait", function(q)
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
				id = 12,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color] Melee and Ranged Damage"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Melee Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Ranged Defense"
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.MeleeDamageMult *= 1.08;
		_properties.RangedDamageMult *= 1.08;
		_properties.MeleeDefense -= 5;
		_properties.RangedDefense -= 5;
	}

})
