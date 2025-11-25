::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_ambidextrous", function ( q ) {

	q.onAnySkillExecuted = @(__original) function( _skill, _targetTile, _targetEntity, _forFree )
	{
		// using this with ambi caused a crash --> simple fix
		if (_skill.getID() == "actives.pov_charge")
		{
			return;
		}
		__original(_skill, _targetTile, _targetEntity, _forFree);
	}
});