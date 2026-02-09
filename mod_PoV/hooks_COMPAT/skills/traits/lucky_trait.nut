::TLW.HooksMod.hook("scripts/skills/traits/lucky_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color] chance to hit the head"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		_properties.HitChance[this.Const.BodyPart.Head] += 2;
	}
})
