::TLW.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_handgonne", function(q) 
{
	q.m.PossibleSkills.extend([
		"actives.pov_fire_handgonne"
	]);
});