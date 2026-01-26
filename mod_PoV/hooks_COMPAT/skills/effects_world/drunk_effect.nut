::TLW.HooksMod.hook("scripts/skills/effects_world/drunk_effect", function ( q ) {
	
	q.onRemoved = @(__original) function()
	{
		//__original();
		local actor = this.getContainer().getActor();
		if (this.Math.rand(1, 100) <= 50 && !actor.getSkills().hasPerk(::Legends.Perk.LegendRecuperation))
		{
			this.getContainer().add(this.new("scripts/skills/effects_world/hangover_effect"));
		}
	};
	
});
