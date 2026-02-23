::TLW.HooksMod.hook("scripts/ai/tactical/behaviors/ai_defend_shieldwall", function(q) 
{
	q.m.PossibleSkills.extend([
		"actives.pov_quen"
	]);
});