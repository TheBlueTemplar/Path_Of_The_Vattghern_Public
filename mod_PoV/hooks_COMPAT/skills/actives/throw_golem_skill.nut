::TLW.HooksMod.hook("scripts/skills/actives/throw_golem_skill", function ( q ) {

	q.onTargetHit = @(__original) function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		__original();
		if(_targetEntity != null)
		{
			local shock = this.new("scripts/skills/effects/shellshocked_effect");
			if (!_targetEntity.getSkills().hasSkill("effects.shellshocked"))
			{
				_targetEntity.getSkills().add(shock);
			}
		}	
	}	
});