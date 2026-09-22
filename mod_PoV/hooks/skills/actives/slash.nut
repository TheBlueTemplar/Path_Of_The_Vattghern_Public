::TLW.HooksMod.hook("scripts/skills/actives/slash", function (q) {

	q.onAfterUpdate = @(__original) function (_properties) {
		__original(_properties);
		local item = this.getItem();
		if (item != null
			&& (item.getID() == "weapon.sickle" || item.getID() == "weapon.legend_named_sickle"))
		{
			local hasHarvester = this.getContainer().getActor().getSkills().hasPerk(
				::Legends.Perk.LegendSpecialistHerbalist
			);
			this.m.ActionPointCost = hasHarvester && _properties.IsSpecializedInSwords ? 3 : 4;
		}
	}
});
