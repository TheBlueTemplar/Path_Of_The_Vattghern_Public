this.pov_named_demon_alp_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Bravery = 5; // +5 bonus base resolve
		this.m.ExperienceMult = 1.15; // +2% base
		this.m.SpecialValue = 0;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_demon_alp_trophy";
		this.m.NameList = this.Const.Strings.PovAlpTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of a legendary demon alp declares the one wearing it a veteran of battle against supernatural nocturnal predators, and grants them power.";
		this.m.Icon = "accessory/pov_named_demon_alp_trophy.png";
		this.m.Sprite = "pov_demon_alp_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 5000;
	}

	function getTooltip()
	{
		local result = this.pov_named_accessory.getTooltip();
		result.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] vision."
			}
		);
		result.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Not affected by night penalties, and during it gain [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] Ranged Skill and Defense."
			}
		);
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.pov_named_accessory.onUpdateProperties(_properties);
		_properties.Vision += 3;
		_properties.IsAffectedByNight = false;
	}

	function onAfterUpdateProperties (_properties)
	{
		this.pov_named_accessory.onAfterUpdateProperties(_properties);

		if (this.getContainer() == null || this.getContainer().getActor() == null)
			return;

		if (::Legends.Effects.has(this.getContainer().getActor(), ::Legends.Effect.Night)) {
			_properties.RangedSkillMult *= 1.10;
			_properties.RangedDefense *= 1.10;
		}
	}

});

