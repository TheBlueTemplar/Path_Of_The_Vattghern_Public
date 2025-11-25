this.pov_vattghern_medallion_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.pov_vattghern_medallion";
		this.m.Name = "Vatt\'ghern Medallion";
		this.m.Description = "A Vatt'ghern medallion, forged from silver and iron and darkened with age, bears the symbol of a fierce wolf, its eyes glinting with a crimson hue.\n\nWorn by the few who have faced the Trial of the Grasses, it serves as both a mark of honor and a reminder of the bloodshed endured to become something more than human. \n\n Only effective when worn by a vattghern.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/pov_vattghern_medallion.png";
		this.m.Sprite = "pov_vattghern_medallion";
		this.m.Value = 1000;
		this.m.IsPrecious = true;
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
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		local actor = this.m.Container.getActor();
		if (actor != null)
		{
			if (actor.getSkills().hasSkill("trait.pov_witcher"))
			{
				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Resolve"
				});
				result.push({
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-10[/color]"
				});
			} 
			else
			{
				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/hint.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Does Nothing[/color] - Not equipped by a vattghern"
				});
			}
		} 

		return result;
	}

	// Immediately unequip item under specific conditions
	// Old, problematic implementation (item lost on reload n after battle)

	/*function onEquip()
	{
		this.accessory.onEquip();
		local actor = this.m.Container.getActor();
		if (actor != null || actor.isPlacedOnMap())
		{
			if (!actor.getSkills().hasSkill("trait.pov_witcher"))
			{
				local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
				local stash = this.World.Assets.getStash();
				actor.getItems().unequip(item);
				stash.add(item);
			}
		}
	}*/

	function onUnequip()
	{
		this.accessory.onUnequip();
		this.m.Icon = "accessory/pov_vattghern_medallion.png";
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);

		local actor = this.m.Container.getActor();
		if (actor != null)
		{
			if (actor.getSkills().hasSkill("trait.pov_witcher"))
			{
				_properties.Bravery += 10;
				_properties.Threat += 10;
				this.m.Icon = "accessory/pov_vattghern_medallion.png";
			} else
			{
				this.m.Icon = "accessory/pov_vattghern_medallion_danger.png";
			}
		}
	}	
});

