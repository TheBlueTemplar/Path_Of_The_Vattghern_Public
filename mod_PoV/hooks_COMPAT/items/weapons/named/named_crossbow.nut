::TLW.HooksMod.hook("scripts/items/weapons/named/named_crossbow", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		//this.m.RangeMin = 2;
		this.m.RangeMax = 6; //+1
		this.m.RangeIdeal = 6; //+1
		//this.m.StaminaModifier = -6;
		//this.m.RegularDamage = 45; 
		//this.m.RegularDamageMax = 65; 
		this.m.DirectDamageMult = 0.50; //---
		//this.m.DirectDamageAdd = -0.05; //-0.05
		this.m.ArmorDamageMult = 0.70;	//-0.05
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

