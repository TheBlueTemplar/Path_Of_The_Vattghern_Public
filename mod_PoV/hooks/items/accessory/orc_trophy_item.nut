::TLW.HooksMod.hook("scripts/items/accessory/orc_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 2500; // up from 500
	}	

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage done against orcs increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			}		
		);
		return ret;
	}

	/*q.onUpdateProperties = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.IsImmuneToStun = true;
	}*/

	q.onAnySkillUsed = @(__original) function (_skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill != null && _targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Orcs || _targetEntity.getFlags().has("pov_mutant_orc"))
			{
				_properties.DamageTotalMult *= 1.25;
			}
		}	
	}

});

