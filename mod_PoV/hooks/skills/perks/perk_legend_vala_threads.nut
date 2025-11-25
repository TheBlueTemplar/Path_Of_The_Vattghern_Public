::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_vala_threads", function ( q ) {

	q.onTargetHit = @(__original) function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		// hitting an enemy with 1 hp gives them 0, then untargetable --> simple fix (just dont apply effect)
		if (::MSU.isKindOf(_targetEntity, "pov_armor_ghost") || ::MSU.isKindOf(_targetEntity, "ghost")) 
		{
			return;
		}
		else
		{
			__original(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor);
		}
	}
});