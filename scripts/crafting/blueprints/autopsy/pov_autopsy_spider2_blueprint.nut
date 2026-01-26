this.pov_autopsy_spider2_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.pov_autopsy_spider2";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/autopsy/pov_autopsy_spider2_item");
		this.m.Cost = 105;
		local ingredients = [
			{
				Script = "scripts/items/misc/corpse/pov_corpse_spider2_item",
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
				item = this.new("scripts/items/misc/anatomist/pov_spider_mutagen_upgrade_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 30)
			{
				item = this.new("scripts/items/misc/anatomist/pov_spider_mutagen_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		if (this.Math.rand(1, 100) <= 50)
			{
				item = this.new("scripts/items/misc/legend_redback_poison_gland_item");
				_stash.add(item);
				if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
			}
		item = this.new("scripts/items/misc/spider_silk_item");
		_stash.add(item);
		if (this.World.Assets.isCamping()){this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).addCraftedItem(item);}
	}

});

