::TLW.HooksMod.hook("scripts/items/weapons/named/named_handgonne", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.ArmorDamageMult = 1.0;
	}
	
	q.onEquip = @(__original) function ()
	{
		__original();
		// AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		local strike = this.new("scripts/skills/actives/knock_out");
		strike.m.IsRangedKnockOut = true;
		this.addSkill(strike);
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "The [color=" + this.Const.UI.Color.povPerkPurple + "]Improvised Strike[/color] skill does [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] more damage."
		});
		return ret;
	}

	q.onAnySkillUsed = @(__original) function ( _skill, _targetEntity, _properties)
	{
		__original(_skill, _targetEntity, _properties);
		if(_skill != null && _skill.getID() == "actives.knock_out")
		{
			_properties.DamageTotalMult *= 1.20;
		}
	}

});

