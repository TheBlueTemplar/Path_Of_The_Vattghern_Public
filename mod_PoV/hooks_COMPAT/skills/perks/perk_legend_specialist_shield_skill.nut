::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_specialist_shield_skill", function ( q ) {

	q.onUpdate = @(__original) function(_properties)
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			if (!::TLW.hasSSU && actor.getSkills().hasSkill("actives.legend_fortify_skill"))
			{
				_properties.DamageReceivedRegularMult *= 0.75;
			}
			else if (!::TLW.hasSSU && actor.getSkills().hasSkill("actives.fortify"))
			{
				_properties.DamageReceivedRegularMult *= 0.80;
			}
			else
			{
				_properties.DamageReceivedRegularMult *= 0.90;
			}	
		}
	}

});