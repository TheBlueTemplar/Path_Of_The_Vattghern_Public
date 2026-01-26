::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_alcohol_brewing", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		// Actual edit of value in character_background.nut hook
		// Yes, its super hacky, ik
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				if (actor.getBackground() != null)
				{
					actor.getBackground().m.Modifiers.Crafting += 0.15;
					//actor.getBackground().onAdded();
				}
			}		
		}
	}

});