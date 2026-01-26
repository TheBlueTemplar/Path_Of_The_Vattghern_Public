::TLW.HooksMod.hook("scripts/ai/tactical/agents/donkey_agent", function(q)
{	
	q.onAddBehaviors = @(__original) function ()
	{
		__original();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
	}
});
