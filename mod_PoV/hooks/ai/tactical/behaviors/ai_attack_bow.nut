::TLW.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_split", function(q) 
{
	q.m.PossibleSkills.extend([
		"actives.legend_magic_missile",
		"actives.legend_magic_chain_lightning"
	]);
});