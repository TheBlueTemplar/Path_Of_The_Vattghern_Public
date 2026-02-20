this.pov_named_ghoul_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Bravery = 4;
		this.m.DamageMult = 1.03;
		this.m.Threat = 5;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_ghoul_trophy";
		this.m.NameList = this.Const.Strings.PovGhoulTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.Name = "Nachzehrer Trophy Necklace";
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of the strongest Nachzehrer declares the one wearing it a veteran of battle against feral beasts, and not easily daunted.";
		this.m.Icon = "accessory/pov_named_nachzehrer_trophy.png";
		this.m.Sprite = "nachzehrer_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 1500;
	}

	function onDeserialize( _in )
	{
		this.pov_named_accessory.onDeserialize(_in);

		if (this.m.DamageMult > 1.1)
			this.m.DamageMult = 1.1;
	}

});

