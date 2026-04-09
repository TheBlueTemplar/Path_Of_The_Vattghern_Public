::TLW.HooksMod.hook("scripts/skills/injury_permanent/legend_donkey_injury", function ( q ) {

	q.onAdded = @(__original) function()
	{
		//__original();
		
		local items = this.getContainer().getActor().getItems();
			//ineloquent solution for forcing the item assigned to any of these slots via hotkey to be unassigned and returned to ground or stash. We squish this code later.
			//Note that 'item.unequip();' does not work.
		if (items.getItemAtSlot(this.Const.ItemSlot.Offhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Offhand);
			item.drop();
		}

		if (items.getItemAtSlot(this.Const.ItemSlot.Mainhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
			item.drop();
		}

		if (items.getItemAtSlot(this.Const.ItemSlot.Head))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Head);
			item.drop();
		}

		if (items.getItemAtSlot(this.Const.ItemSlot.Body))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Body);
			item.drop();
		}

		if (items.getItemAtSlot(this.Const.ItemSlot.Ammo))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Ammo);
			item.drop();
		}

		/*if (items.getItemAtSlot(this.Const.ItemSlot.Accessory))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Accessory);
			item.drop();
		}*/

		items.getData()[this.Const.ItemSlot.Offhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Head][0] = -1;
		items.getData()[this.Const.ItemSlot.Body][0] = -1;
		items.getData()[this.Const.ItemSlot.Ammo][0] = -1;
		//items.getData()[this.Const.ItemSlot.Accessory][0] = -1;
	}
});	

// May not work wth modern hooks, as legends does this hookin shit with old hooks!
// Dumb comment, leaving for proof that im dumb
// Ill keep it, thats proof someone was dumb!