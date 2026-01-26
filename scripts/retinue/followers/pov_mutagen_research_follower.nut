this.pov_mutagen_research_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.pov_mutagen_research";
		this.m.Name = "Mutagen Research Tools";
		this.m.Description = "\"Know your Enemy\" - By researching these peculiar mutations, we could benefit in many different ways.";
		this.m.Image = "ui/campfire/pov_mutagen_research";
		this.m.Cost = 4750;
		this.m.Effects = [
			"Corpse and Mutagen drop rates increased by 20%",
			"Enemy Mutants appear 15% more often",
			"Enemy Mutants take 10% increased damage",
		];
		
		this.addRequirement("Must have discovered at least one mutagen ", function() {
			return ::World.Flags.has("GotMutagen");
		});

		this.addSkillRequirement("Have at least one of the following backgrounds: Alchemist, Taxidermist, Anatomist, Inventor, Druid, Vattghern (Background, not just the trait)", [
			"background.legend_alchemist",
			"background.legend_taxidermist",
			"background.anatomist",
			"background.legend_inventor",
			"background.legend_druid",
			"background.pov_vattghern"
		]);
	}

	function onUpdate()
	{
		::World.Assets.m.HasMutagenResearch = true;
	}


});
