::TLW.HooksMod.hook("scripts/skills/actives/throw_axe", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original(_skill, _targetEntity, _properties);
		if (_targetEntity != null && this.m.IsBackupAxe && _skill == this)
		{
			_properties.DamageTotalMult *= 1.15;
			_properties.RangedSkill -= 5;
			this.m.AdditionalAccuracy -= 5;
		}	
	}

});	