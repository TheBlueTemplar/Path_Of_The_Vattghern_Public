::TLW.HooksMod.hook("scripts/skills/perks/perk_legend_smashing_shields", function ( q ) {

	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();
		/*local thrown = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (thrown != null && thrown.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			thrown.onEquip();
		}*/
		local equippedItem = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (equippedItem != null)
		{
			actor.getItems().unequip(equippedItem);
			actor.getItems().equip(equippedItem);
		}

		equippedItem = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (equippedItem != null)
		{
			actor.getItems().unequip(equippedItem);
			actor.getItems().equip(equippedItem);
		} 
	}

});