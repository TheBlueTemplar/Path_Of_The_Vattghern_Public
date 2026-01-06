::TLW.HooksMod.hook("scripts/scenarios/world/legends_rangers_scenario", function (q) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Description += "[p][color=#bcad8c]Corpse Hunting:[/color] Enemy corpse and mutagen drops have their base drop chance increased by 15%[/p]\n";
	}

	q.onSpawnAssets = @(__original) function()
	{
		__original();	
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/holy_water_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/tools/throwing_net"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_wooden_stake"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
		//this.World.Assets.getStash().add(this.new("scripts/items/accessory/ghoul_trophy_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/spider_poison_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/knife"));
	}

});

