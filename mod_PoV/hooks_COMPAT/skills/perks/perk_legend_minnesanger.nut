::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_minnesanger", function ( q ) {

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
					actor.getBackground().m.Modifiers.Barter += 0.0075;
					//actor.getBarterModifier();
					this.World.State.getPlayer().calculateBarterMult();
				}
			}		
		}
	}

	q.onUpdate = @(__original) function(_properties)
	{
		__original(_properties);
		_properties.BraveryMult *= 1.10;
	}
});