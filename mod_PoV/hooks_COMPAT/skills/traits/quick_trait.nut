::TLW.HooksMod.hook("scripts/skills/traits/quick_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] AP for the first round of combat"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		if (this.getContainer().getActor().isPlacedOnMap() && this.Time.getRound() <= 1)
		{
			_properties.ActionPoints += 1;			
		}
	}
})
