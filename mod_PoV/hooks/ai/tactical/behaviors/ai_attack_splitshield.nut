::TLW.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_splitshield", function(q) 
{
	q.m.PossibleSkills.extend([
		"actives.pov_ranged_split_shield"
	]);
});