this.pov_rock_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.pov_rock";
		this.m.Name = "Chunk of Rock";
		this.m.Description = "Just an unremarkable, big, heavy chunk of rock... why would anyone just carry this?";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/pov_rock.png";
		this.m.StaminaModifier = -4;
		this.m.Value = 10;
	}

	function getTooltip()
	{
		local result = this.accessory.getTooltip();
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Holding it makes you feel nice, gain [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Resolve"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/ambience/terrain/mountain_rocks_02.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);

		local actor = this.getContainer().getActor();
		_properties.Bravery += 1;
	}	

});

