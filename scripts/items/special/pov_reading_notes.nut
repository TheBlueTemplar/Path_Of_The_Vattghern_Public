this.pov_reading_notes <- this.inherit("scripts/items/item", {
	m = {
		Item = null
	},
	function create()
	{
		this.item.create();
		this.m.ID = "special.pov_reading_notes";
		this.m.Name = "Reading Notes";
		this.m.Description = "Notes on spare paper. Contain simple letters, tied to sketches of objects, some simple words, simple grammar rules and even some exercises. With the help of an educated fellow, and some spare time, one could learn to read using this, though the process wouldnt necessarily be pleasant.";
		this.m.Icon = "special/pov_reading_notes.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 750;
		this.m.IsPrecious = true;
	}

	function getTooltip()
	{
		local result = this.item.getTooltip();
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/scroll_01.png",
			text = "Use on a capable brother so they can learn to [color=" + this.Const.UI.Color.PositiveValue + "]read[/color]. This will give them the \"learning to read\" effect, and when that expires, the brother will know how to read. For most people, this effect will last for a few days and come with negative effects."
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Requires having an [color=" + this.Const.UI.Color.PositiveValue + "]educated[/color] fellow in your company to use. (People who already know how to read)."
		});
		return result;
	}

	function onUse( _actor, _item = null )
    {	
    	local brothers = this.World.getPlayerRoster().getAll();
    	local educated = [];
    	foreach( bro in brothers )
        {
            if (bro.getFlags().has("PovCanRead"))
            {
                educated.push(bro);
            }
        }

        if (educated.len() == 0)
        {
        	::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
        	::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("There is noone to teach this character to read."));
        	return false;
        }

        // if knows how to read, or cant learn to read
		if (_actor.getFlags().has("PovCanRead") || _actor.getSkills().hasTrait(::Legends.Trait.Dumb) || _actor.getSkills().hasSkill("injury.brain_damage") || _actor.getBackground().getID() == "background.wildman")
		{
			::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot benefit from using this item."));
			return false;
		}

		if(!_actor.getFlags().has("PovCanRead"))
		{
			_actor.getSkills().add(this.new("scripts/skills/effects/pov_learning_to_read_effect"));
		}

		::Sound.play("sounds/scribble.wav", ::Const.Sound.Volume.Inventory);
		return true;
    }
});

