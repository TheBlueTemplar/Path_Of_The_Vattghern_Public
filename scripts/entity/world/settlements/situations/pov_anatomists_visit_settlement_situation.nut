this.pov_anatomists_visit_settlement_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.pov_anatomists_visit_settlement";
		this.m.Name = "Anatomists and Alchemists Visit";
		this.m.Description = "Different groups of anatomists, alchemists and other peculiar fellows are visiting, looking for \"suitable material\". \n\n Beast parts, and especially corpses and mutagens can fetch a great price here, and rare items may be found on sale. Some of these interesting fellows might even be looking for more...exciting work.";
		this.m.Icon = "ui/settlement_status/pov_anatomists_situation.png";
		this.m.Rumors = [
			"Have you heard? Interesting fellows have visited %settlement%. All the talk about beast parts, alchemy and gods know what else is driving them crazy over there.",
			"I learned that in %settlement%, there are a variety of fellows, looking for alchemic parts, and even the mythical mutagens. This sure is interesting, and I plan to visit!",
			"The devil\'s work I tell you! O\'er at %settlement%. Dark robes and long nosed helmets, these soulless creatures posing as men of \"science\" or however they call it are up to no good. Theys look more like cultists if yer ask me...",
			"You are a mercenary huh? You should take a look over at %settlement%, beasthunters and anatomists have visited there, and you might find their services very much useful",
			"All this rise of mutants recently is driving people crazy...Did you know? All the way at %settlement%, there\'s a group of fellows there, \"studying\" this situation...gives me the creeps!"
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
	}

	function getTooltip()
	{
		local ret = this.situation.getTooltip();
		if(::TLW.PovSituation)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_money.png",
				text = "Buying Prices increased by [color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_mutagen.png",
				text = "Mutagen Value increased by [color=" + this.Const.UI.Color.PositiveValue + "]15x[/color] Times."
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_corpse.png",
				text = "Corpse Items value increased by [color=" + this.Const.UI.Color.PositiveValue + "]250%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale increased by [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Anatomists, Alchemists, Taxidermists, Beast Slayers, Peddlers, Inventors[/color]"
			});
		}
		return ret;
	}

	function onAdded( _settlement ) //most bad events except the major ones.
	{
		_settlement.resetRoster(true);
		_settlement.resetShop();
		::TLW.Mod.Debug.printLog("PoV: Added Amatomists and Alchemists Visit situation in:" + _settlement.getName());
		//_settlement.removeSituationByID("situation.abducted_children");
		//_settlement.removeSituationByID("situation.disappearing_villagers");
		//_settlement.removeSituationByID("situation.unhold_attacks");
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RecruitsMult *= 1.40;
		_modifiers.BuyPriceMult *= 1.10;
		_modifiers.RarityMult *= 1.40;
		_modifiers.PovMutagenPriceMult *= 15.00;
		_modifiers.PoVCorpsePriceMult *= 2.50;
		_modifiers.BeastPartsPriceMult *= 1.50;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("anatomist_background");
		_draftList.push("anatomist_background");
		_draftList.push("anatomist_background");
		_draftList.push("legend_alchemist_background");
		_draftList.push("legend_alchemist_background");
		_draftList.push("legend_alchemist_background");
		_draftList.push("legend_taxidermist_background");
		_draftList.push("legend_taxidermist_background");
		_draftList.push("legend_taxidermist_background");
		_draftList.push("beast_hunter_background");
		_draftList.push("beast_hunter_background");
		_draftList.push("beast_hunter_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("legend_inventor_background");
		_draftList.push("legend_inventor_background");
	}

});

