this.pov_corpse_flesh_golem2_item <- this.inherit("scripts/items/misc/corpse/pov_corpse_item", {
	m = {},
	function create()
	{
		this.pov_corpse_item.create();
		this.m.ID = "supplies.pov_corpse_flesh_golem2";
		this.m.Name = "Large Grafted Remains";
		this.m.Description = "The twisted corpse of a Greater Flesh Golem — a grotesque mass of stitched limbs, mismatched torsos, pulsing sinew, and rotten armor. Even in death, the seams strain and twitch, as if the thing resents the idea of staying dead.\n\nA skilled medicus may be able to extract useful materials from it.";
		this.m.Icon = "consumables/pov_corpse_flesh_golem2.png";
		this.m.Value = 150;
		this.m.GoodForDays = 10;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];


		result.push({
				id = 3,
				type = "image",
				image = "consumables/pov_enemy_flesh_golem2.png",
		});

		result.push({
			id = 11,
			type = "text",
			//icon = "ui/icons/special.png",
			text = "The Greater Flesh Golem is an even more terrifying creation from its smaller counterpart. It is assembled by a grotesque construction of human parts, stolen from graves, battlefields, and butchered prisoners, but it is also armored to further its resilience. Limbs are grafted to torsos that were never theirs. Heads are sewn on backwards. Eyes stitched shut. The creators of such monstrosities are believed to be rogue alchemists, exiled necromancers, or deranged anatomists driven beyond reason.\n\nAside from being extremely resilient, it is also able to do considerable damage, and even attack with great speed, making it a truly fearsome foe."
		});
		result.push({
			id = 67,
			type = "hint",
			icon = "ui/icons/warning.png",
			text = "Will fully decompose in [color=" + this.Const.UI.Color.NegativeValue + "]" + this.getSpoilInDays() + "[/color] days."
		});

		return result;

	}

});

