::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_scholar", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}
	}

});