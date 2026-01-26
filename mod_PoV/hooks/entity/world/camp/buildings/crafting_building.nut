::TLW.HooksMod.hook("scripts/entity/world/camp/buildings/crafting_building", function( q ) {

	// Edit I make, to be called in blueprint items WITH a ifCamping check
	// Done for autopsy items, where the recipe can net multiple different items
	// With this edit, all these items will be shown as "crafted" in UI
	q.addCraftedItem <- function( _item )
	{
		this.m.ItemsCrafted.push(_item);
	}	

});

