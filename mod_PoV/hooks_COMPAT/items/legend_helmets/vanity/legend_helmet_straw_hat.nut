::TLW.HooksMod.hook("scripts/items/legend_helmets/vanity/legend_helmet_straw_hat", function (q) {
	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 80;
	}

	/*q.getTooltip = @(__original) function()
	{
		local result = __original();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] damage with Pitchforks."
		});
		return result;
	}

	q.onArmorTooltip = @(__original) function( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] damage with Pitchforks."
		});
	}

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		local item = _skill.getItem();
		if (item != null)
		{
			if (_skill.isAttack())
			{
				if(item.getID() == "weapon.pitchfork" || item.getID() == "weapon.legend_wooden_pitchfork" || item.getID() == "weapon.warfork")
				{
					_properties.DamageTotalMult *= 1.10;
				}
			}
		}	
	}*/

});

