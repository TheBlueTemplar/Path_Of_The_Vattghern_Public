this.pov_named_basilisk_trophy_item <- ::inherit("scripts/items/accessory/named/pov_named_accessory", {
	m = {},
	function create()
	{
		this.m.HeadChance = 5; 
		this.m.HeadDamageMult = 1.2; 
		this.m.SpecialValue = 0;
		this.pov_named_accessory.create();
		this.m.ID = "accessory.named_basilisk_trophy";
		this.m.NameList = this.Const.Strings.PovBasiliskTrophyNames;
		this.m.PrefixList = [""];
		this.m.SuffixList = [""];
		//this.m.DefaultName = "Named Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of the most powerful Basilisk declares the one wearing it a veteran of battle against the unpredictable and the precise, and signals they can cover their head as well as bash others\'.";
		this.m.Icon = "accessory/pov_named_basilisk_trophy.png";
		this.m.Sprite = "basilisk_trophy";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 1900;
	}

});

