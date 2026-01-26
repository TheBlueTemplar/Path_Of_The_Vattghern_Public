::TLW.HooksMod.hook("scripts/skills/actives/legend_donkey_kick_skill", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original( _skill, _targetEntity, _properties );
		
		if (_skill == this)
		{
			_properties.DamageArmorMult = 1.25;
		}

	}

});	