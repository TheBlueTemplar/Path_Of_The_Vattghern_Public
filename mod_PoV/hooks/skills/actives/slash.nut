::TLW.HooksMod.hook("scripts/skills/actives/slash", function ( q ) {

	q.onAfterUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		if (this.getContainer().getActor().getSkills().hasPerk(::Legends.Perk.PovSpecialistHerbalist) && this.m.Item != null && (this.m.Item.getID() == "weapon.sickle" || this.m.Item.getID() == "weapon.legend_named_sickle"))
		{
			this.m.ActionPointCost = _properties.IsSpecializedInSwords ? 3 : 4;
		}
	}

});	
