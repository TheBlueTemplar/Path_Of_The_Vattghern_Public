this.pov_named_hexe_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.Bravery = 10; 
		this.m.Luck = 8; 
		this.m.SpecialValue = 0;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_hexe_trophy";
		this.m.NameList = this.Const.Strings.PovAlpTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of the most powerful Hexen declares the one wearing it a veteran of battle against supernatural, charming predators, and not easily daunted.";
		this.m.Icon = "accessory/pov_named_hexe_trophy.png";
		this.m.Sprite = "hexe_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 1666;
	}

});

