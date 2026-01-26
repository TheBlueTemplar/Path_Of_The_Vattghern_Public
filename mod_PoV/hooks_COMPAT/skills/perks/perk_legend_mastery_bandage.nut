::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_mastery_bandage", function ( q ) {

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
					actor.getBackground().m.Modifiers.Healing += 0.1;
					actor.getBackground().m.Modifiers.Injury += 0.03;
					//actor.getBackground().onAdded();
				}
			}		
		}
	}

});