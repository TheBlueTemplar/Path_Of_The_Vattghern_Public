::TLW.HooksMod.hook("scripts/skills/traits/fragile_trait", function(q)
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
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]-5[/color] Hitpoints"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]-5%[/color] damage resistance."
			}
		];
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.Hitpoints -= 5;
	}

	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		__original(_attacker, _skill, _hitInfo, _properties);
		_properties.DamageReceivedTotalMult *= 1.05;
	}
})
