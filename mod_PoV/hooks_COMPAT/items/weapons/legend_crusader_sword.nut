::TLW.HooksMod.hook("scripts/items/weapons/legend_crusader_sword", function (q) {

	q.getTooltip = @(__original) function ()
	{
		local result = __original();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Skills inflict an additional [color=" + this.Const.UI.Color.DamageValue + "]20%[/color] damage to undead, spirits, cultists and hexen."
		});
		return result;
	}

	q.onEquip = @(__original) function ()
	{
		__original();
		::Legends.Actives.remove(this, ::Legends.Active.Puncture); // Remove Old Halfsword Implementation
		local thrust = this.new("scripts/skills/actives/thrust"); // Add PoV's new one
		thrust.m.IsGreatSword = true;
		this.addSkill(thrust);

		::Legends.Actives.grant(this, ::Legends.Active.Hammer, function (_skill) {
			_skill.m.IsMordhau = true;
			_skill.m.IsGreatMordhau = true;
		}.bindenv(this));
	}

	q.onAnySkillUsed = @(__original) function ( _skill, _targetEntity, _properties)
	{
		__original( _skill, _targetEntity, _properties);
		if (_targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Undead || this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Zombies || _targetEntity.getFlags().has("ghost") || _targetEntity.getFlags().has("undead") || _targetEntity.getType() == this.Const.EntityType.Hexe || _targetEntity.getType() == this.Const.EntityType.LegendHexeLeader || _targetEntity.getType() == this.Const.EntityType.Cultist)
			{
				_properties.DamageTotalMult *= 1.20;
			}
		}	
	}
	
});

