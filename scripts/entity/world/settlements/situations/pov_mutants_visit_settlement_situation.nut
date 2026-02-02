this.pov_mutants_visit_settlement_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.pov_mutants_visit_settlement";
		this.m.Name = "Mutants!";
		this.m.Description = "Mutants are temporarily staying in the area, and with their numbers higher than usual, the locals are concerned. \n\n Market activity is reduced, with less products moving around, and prices for both buying and selling are higher. Also, Some of these mutants might be looking to turn their life around...";
		this.m.Icon = "ui/settlement_status/pov_mutants_situation.png";
		this.m.Rumors = [
			"They say %settlement% ain\'t the same no more. Too many twisted folk walkin\' the streets, misshapen and wrong. The locals lock their doors tight come nightfall.",
			"Word is, mutants roam %settlement% openly now. Some say they\'re tolerated, others say the guards are too afraid to do anything about it.",
			"You feel it in the air, they say. Over in %settlement%, mutants walk among men, and fear has taken root deep in the hearts of the people.",
			"A trader told me %settlement% is crawling with mutants. Some hide their deformities, others don’t bother. Either way, the townsfolk are scared stiff."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
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
				icon = "ui/icons/pov_situation_money.png",
				text = "Selling Prices increased by [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_bag.png",
				text = "Available Items for sale reduced by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_mutagen.png",
				text = "Mutagen Value reduced by [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "Available Recruits increased by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]"
			});
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/pov_situation_person.png",
				text = "The following backgrounds are added to the recruit pool: [color=" + this.Const.UI.Color.povPerkDarkOrange + "]Mutants[/color]"
			});
		}
		return ret;
	}

	function onAdded( _settlement ) //most bad events except the major ones.
	{
		_settlement.resetRoster(true);
		_settlement.resetShop();
		::TLW.Mod.Debug.printLog("PoV: Added Mutants! situation in:" + _settlement.getName());
		//_settlement.removeSituationByID("situation.abducted_children");
		//_settlement.removeSituationByID("situation.disappearing_villagers");
		//_settlement.removeSituationByID("situation.unhold_attacks");
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RecruitsMult *= 1.20;
		_modifiers.BuyPriceMult *= 1.10;
		_modifiers.SellPriceMult *= 1.10;
		_modifiers.RarityMult *= 0.80;
		_modifiers.PovMutagenPriceMult *= 0.25;
	}

	function onUpdateDraftList( _draftList )
	{
		// 20 Total
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
		_draftList.push("pov_mutant_background");
	}

});

