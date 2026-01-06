::TLW.HooksMod.hookTree("scripts/scenarios/world/starting_scenario", function (q) {

	q.onSpawnAssets = @(__original) function()
	{
		__original();
		// SEASONAL ITEMS - Remember to remove them after xmas time!
		/*	
		local xmasHat1 = this.new("scripts/items/legend_helmets/vanity/pov_helmet_xmas_hat");
		xmasHat1.setVariant(1);
		xmasHat1.updateVariant();
		this.World.Assets.getStash().add(xmasHat1);
		local xmasHat2 = this.new("scripts/items/legend_helmets/vanity/pov_helmet_xmas_hat");
		xmasHat2.setVariant(2);
		xmasHat2.updateVariant();
		this.World.Assets.getStash().add(xmasHat2);
		*/	
	}

	
});

