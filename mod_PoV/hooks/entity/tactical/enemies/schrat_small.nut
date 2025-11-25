::TLW.HooksMod.hook("scripts/entity/tactical/enemies/schrat_small", function ( q )
{
	q.onInit = @(__original) function()
	{
		__original();
		local b = this.m.BaseProperties;
		if (this.World.getTime().Days <= 30)
		{
			b.Hitpoints *= 0.75;
			b.MeleeSkillMult *= 0.75;
			b.MeleeDefenseMult *= 0.80;
		} 
		else if (this.World.getTime().Days <= 50)
		{
			b.Hitpoints *= 0.90;
			b.MeleeSkillMult *= 0.90;
			b.MeleeDefenseMult *= 0.90;
		}
	}

});