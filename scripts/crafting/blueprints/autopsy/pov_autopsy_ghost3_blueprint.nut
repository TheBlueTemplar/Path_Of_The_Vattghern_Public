this.pov_autopsy_ghost3_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_autopsy_ghost3";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/autopsy/pov_autopsy_ghost3_item");
		this.m.Cost = 120;
		local ingredients = [
			{
				Script = "scripts/items/misc/corpse/pov_corpse_ghost3_item",
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
    	if (this.Math.rand(1, 100) <= 20)
			{
				item = this.new("scripts/items/misc/anatomist/pov_ghost_mutagen_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 10)
			{
				item = this.new("scripts/items/loot/pov_infused_shards_special_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
	}

});


