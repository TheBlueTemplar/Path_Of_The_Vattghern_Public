::TLW.HooksMod.hook("scripts/skills/traits/swift_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Ranged Skill"
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.RangedSkill += 2;
	}
})
