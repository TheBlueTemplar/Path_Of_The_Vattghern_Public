this.pov_vattghern_sword_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_vattghern_sword";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/weapons/pov_vattghern_sword");
		this.m.Cost = 175;
		local ingredients = [
			{
				Script = "scripts/items/weapons/pov_vattghern_sword",
				Num = 1
			}
		];
		this.init(ingredients);
	}


	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/pov_vattghern_longsword"));
	}

});

