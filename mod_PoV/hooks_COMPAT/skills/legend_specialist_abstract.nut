::TLW.HooksMod.hookTree("scripts/skills/legend_specialist_abstract", function ( q ) {
	
	if (!::TLW.hasSSU)
	{
		// Remove this skill from legends, with exceptions
		q.onUpdate = @(__original) function( _properties )
		{
			__original(_properties);

			local actor = this.getContainer().getActor();
			if(actor.getFaction() == this.Const.Faction.Player)
			{
				// exceptions
				if (this.m.ID != "perk.legend_specialist_musician" && this.m.ID != "perk.legend_specialist_selfdefense")
				{
					this.m.IsActive = false;
					this.m.IsHidden = true;
				}
			}	
		
		};

	}
	
});
