::TLW.HooksMod.hook("scripts/ai/tactical/behaviors/ai_defend_knock_back", function(q) 
{
	q.m.PossibleSkills.extend([
		"actives.legend_revolt",
		"actives.legend_entice"
	]);
});