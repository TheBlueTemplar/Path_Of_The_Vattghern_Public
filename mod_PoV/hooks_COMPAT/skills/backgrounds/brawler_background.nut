::TLW.HooksMod.hook("scripts/skills/backgrounds/brawler_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = this.character_background.getTooltip();
		ret.push({
			id = 12,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Gain [color=%positive%]15%[/color] bonus damage to the [color=#400080]Punch[/color] skill and [color=%positive%]5%[/color] to the [color=#400080]Choke[/color] skill."
		});
		return ret;
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{
		if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.HandToHand))
		{
			_properties.DamageTotalMult *= 1.15;
		}
		else if (_skill.getID() == ::Legends.Actives.getID(::Legends.Active.LegendChoke))
		{
			_properties.DamageTotalMult *= 1.05;
		}
	}
})
