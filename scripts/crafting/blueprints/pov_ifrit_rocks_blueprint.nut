this.pov_ifrit_rocks_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_ifrit_rocks";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/ammo/pov_sling_ifrit_rocks");
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/misc/sulfurous_rocks_item",
				Num = 5
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/ammo/pov_sling_ifrit_rocks"));
	}

});

