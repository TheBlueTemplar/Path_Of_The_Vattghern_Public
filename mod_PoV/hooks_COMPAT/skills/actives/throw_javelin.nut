::TLW.HooksMod.hook("scripts/skills/actives/throw_javelin", function ( q ) {

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasPerk(::Legends.Perk.LegendThrustMaster))
			{
				_properties.DamageRegularMin += 5;
			}
		}	
	}

});	