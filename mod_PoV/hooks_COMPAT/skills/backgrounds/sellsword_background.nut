::TLW.HooksMod.hook("scripts/skills/backgrounds/sellsword_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Increases Resolve by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of the currently paid wage."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local bonus = _properties.DailyWage / 10;
		_properties.Bravery += this.Math.max(1,bonus);
	}

})
