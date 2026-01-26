this.pov_autopsy_hexe_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_autopsy_hexe";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/autopsy/pov_autopsy_hexe_item");
		this.m.Cost = 110;
		local ingredients = [
			{
				Script = "scripts/items/misc/corpse/pov_corpse_hexen_item",
				Num = 1
			},
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_field_triage"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
	    local item;
	    if (this.Math.rand(1, 100) <= 15)
			{
				item = this.new("scripts/items/misc/anatomist/pov_hexe_mutagen_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 30)
			{
				item = this.new("scripts/items/misc/witch_hair_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 30)
			{
				item = this.new("scripts/items/misc/mysterious_herbs_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 25)
			{
				item = this.new("scripts/items/loot/jade_broche_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}	
		if (this.Math.rand(1, 100) <= 30)
			{
				item = this.new("scripts/items/misc/poisoned_apple_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
	}

});

