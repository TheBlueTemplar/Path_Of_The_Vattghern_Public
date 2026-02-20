this.pov_named_banshee_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Initiative = 20;
		this.m.Threat = 5;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.pov_named_demon_banshee_trophy";
		this.m.NameList = this.Const.Strings.PovBansheeTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.Name = "Nachzehrer Trophy Necklace";
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "An eerie trophy that, infused with the most unholy of magick from the aetherium. When worn, it provides incredible vigor and speed.";
		this.m.Icon = "accessory/pov_named_demon_banshee_trophy.png";
		this.m.Sprite = "demon_banshee_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 1500;
	}

	function getTooltip()
	{
		local result = this.pov_named_accessory.getTooltip();
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Fatigue Recovery Rate"
		});
		return result;
	}

	function onUpdateProperties(_properties)
	{
		this.pov_named_accessory.onUpdateProperties(_properties);
		_properties.FatigueRecoveryRate += 2;
	}

});

