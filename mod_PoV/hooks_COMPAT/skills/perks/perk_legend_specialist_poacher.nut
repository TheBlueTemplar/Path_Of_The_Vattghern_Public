::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_poacher", function ( q ) {

	// Disable the ammo bonuses from og perk
	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{
		//__original(_skill, _targetEntity, _properties);
		this.legend_specialist_abstract.onAnySkillUsed(_skill, _targetEntity, _properties);
	}

});