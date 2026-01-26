::TLW.HooksMod.hook("scripts/retinue/followers/scout_follower", function (q) {
	
	q.create = @(__original) function()
	{
		//__original(); // have to overwrite to make such changes...
		this.follower.create();
		this.m.ID = "follower.scout";
		this.m.Name = "Watcher's Totem";
		this.m.Description = "The people of the woods and hinterlands swear that the presence of this totem grants good fortune to those around it, somehow preventing sickness and accidents as long as it is in the camp. Sounds like farking nonsense but if it keeps them happy...";
		this.m.Image = "ui/campfire/legend_scout_01";
		this.m.Cost = 1250;
		this.m.Effects = [
			"Reduces the movement penalty of difficult terrain by 15%",
			"Prevents sickness and accidents due to terrain"
		];

		this.addSkillRequirement("Have at least one of the following backgrounds: Wildman/Wildwoman, Hunter, Lumberjack, Ranger, Master Archer, Vattghern (trait)", [
			"background.wildman",
			"background.hunter",
			"background.lumberjack",
			"background.legend_ranger",
			"background.legend_commander_ranger",
			"background.legend_master_archer",
			"background.legend_companion_melee",
			"background.legend_companion_ranged",
			"trait.pov_witcher"
		]);

	}

});

