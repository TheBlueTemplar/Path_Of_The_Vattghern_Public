this.pov_anatomist2_potion_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IsPrecious = true;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onAddedToStash( _stashID )
	{
		// First mutagen obtained flag
		if(!::World.Flags.has("GotMutagenEvent"))
		{
			::World.Flags.add("GotMutagenEvent");
		}
	}

	// Are now considered Beast Parts AND Corpse Items, for modifying prices
	function getSellPriceMult()
	{
		return this.World.State.getCurrentTown().getMutagenPriceMult();
	}

	function getBuyPriceMult()
	{
		return this.World.State.getCurrentTown().getMutagenPriceMult();
	}

	function onUse( _actor, _item = null )
	{
		
	}

});

