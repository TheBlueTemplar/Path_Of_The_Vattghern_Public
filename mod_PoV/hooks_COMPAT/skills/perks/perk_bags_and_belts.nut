::TLW.HooksMod.hook("scripts/skills/perks/perk_bags_and_belts", function ( q ) {

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
					actor.getBackground().m.Modifiers.Stash += 4;
					// Apply the stash change (not immediate)
					this.World.State.getPlayer().calculateStashModifier();
				}
			}		
		}
	}

});