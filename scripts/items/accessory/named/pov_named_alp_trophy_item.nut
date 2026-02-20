this.pov_named_alp_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Bravery = 3; // +3 bonus base resolve
		this.m.ExperienceMult = 1.07; // +2% base
		this.m.SpecialValue = 0;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_alp_trophy";
		this.m.NameList = this.Const.Strings.PovAlpTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of the most powerful Alps declares the one wearing it a veteran of battle against supernatural nocturnal predators, and not easily daunted.";
		this.m.Icon = "accessory/pov_named_alp_trophy.png";
		this.m.Sprite = "alp_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 2000;
	}

	function getTooltip()
	{
		local result = this.pov_named_accessory.getTooltip();
		result.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] vision."
			}
		);
		result.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Mitigates [color=" + this.Const.UI.Color.PositiveValue + "]half[/color] of night penalties."
			}
		);
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.pov_named_accessory.onUpdateProperties(_properties);
		_properties.Vision += 2;
	}

	function onAfterUpdateProperties (_properties)
	{
		this.pov_named_accessory.onAfterUpdateProperties(_properties);

		if (this.getContainer() == null || this.getContainer().getActor() == null)
			return;

		if (_properties.IsAffectedByNight && ::Legends.Effects.has(this.getContainer().getActor(), ::Legends.Effect.Night)) {
			_properties.Vision += 1;
			_properties.RangedSkillMult *= 1.15;
			_properties.RangedDefense *= 1.15;
		}
	}

});

