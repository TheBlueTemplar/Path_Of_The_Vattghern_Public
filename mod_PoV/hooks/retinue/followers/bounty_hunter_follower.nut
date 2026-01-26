::TLW.HooksMod.hook("scripts/retinue/followers/bounty_hunter_follower", function (q) {
	
	q.create = @(__original) function()
	{
		//__original(); // have to overwrite to make such changes...
		this.follower.create();
		this.m.ID = "follower.bounty_hunter";
		this.m.Name = "Bounty Board";
		this.m.Description = "A well maintained bounty board can keep everyone up to date on which heads they should be taking after a battle.";
		this.m.Image = "ui/campfire/legend_bounty_hunter_01";
		this.m.Cost = 4000;
		this.m.Effects = [
			"Significantly increases the chance of encountering champions",
			"Pays between 300 and 750 crowns for every champion slain"
		];

		this.addRequirement("Have at least a named or a legendary items in your possession ", function() {
			return this.getNumberOfNamedItems() >= 1;
		});

		this.addSkillRequirement("Have at least one of the following backgrounds: Manhunter, Witch Hunter, Beast Slayer, Bounty Hunter, Vattghern (trait)", [
			"background.witchhunter",
			"background.beast_slayer",
			"background.manhunter",
			"background.legend_companion_melee",
			"background.legend_companion_ranged",
			"background.legend_bounty_hunter",
			"trait.pov_witcher"
		]);

	}

});

