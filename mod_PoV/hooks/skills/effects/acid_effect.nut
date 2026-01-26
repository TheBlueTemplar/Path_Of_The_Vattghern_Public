::TLW.HooksMod.hook("scripts/skills/effects/acid_effect", function (q) {

	q.resetTime = @(__original) function ()
	{
		__original();
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	q.onAdded = @(__original) function ()
	{
		__original();
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}


});

