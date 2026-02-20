this.pov_named_hexe_leader_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Bravery = 10; 
		this.m.Luck = 15; 
		this.m.SpecialValue = 0;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_hexe_leader_trophy";
		this.m.NameList = this.Const.Strings.PovHexeTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of a slain Legendary Hexe Coven Leader declares the one wearing it a veteran of battle against vile sorcery, and is very hard to manipulate and break.";
		this.m.Icon = "accessory/pov_named_hexe_leader_trophy.png";
		this.m.Sprite = "hexe_leader_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 4666;
	}

	function getTooltip()
	{
		local result = this.pov_named_accessory.getTooltip();
		result.push(
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Doubles[/color] your Resolve if defending against fear and mind control abilities"
			}
		);
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.pov_named_accessory.onUpdateProperties(_properties);
		_properties.MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack] *= 2.0;
	}

});

