::TLW.HooksMod.hook("scripts/skills/actives/throw_balls", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasSkill("effects.pov_goblin_mutagen"))
			{
				_properties.DamageTotalMult *= 1.18;
			}
		}	
	}

});	