this.pov_autopsy_forsaken_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_autopsy_forsaken";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/autopsy/pov_autopsy_forsaken_item");
		this.m.Cost = 125;
		local ingredients = [
			{
				Script = "scripts/items/misc/corpse/pov_corpse_forsaken_item",
				Num = 1
			},
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_potion_brewer"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
    	local item;
    	if (this.Math.rand(1, 100) <= 10)
			{
				local itemList = ::TLW.MutagensNormal;
				local itemRoll = itemList[this.Math.rand(0 , itemList.len() - 1)];
				item = this.new(itemRoll);
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
	}

});

