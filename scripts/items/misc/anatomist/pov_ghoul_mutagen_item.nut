this.pov_ghoul_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_ghoul_mutagen";
		this.m.Name = "Nachzehrer Mutagen";
		this.m.Description = "This vile mutagen carries the essence of a ghoul\'s feral hunger and twisted vitality. Once consumed, it [color=" + this.Const.UI.Color.povTooltipRed + "]sharpens the user\'s reflexes to an unnatural degree[/color], granting them incredible speed and an unsettling presence that [color=" + this.Const.UI.Color.povTooltipRed + "]saps the courage of nearby foes[/color]. Additionally, the user becomes [color=" + this.Const.UI.Color.povTooltipRed + "]able to consume corpses[/color] at a rapid speed to recover themselves, to the horror of their allies.\n\nHowever, the mutation also exacts a grim toll: [color=" + this.Const.UI.Color.povTooltipRed + "]precision with ranged weapons is lost, melee strikes become weaker, and the body grows disturbingly fragile[/color], unable to endure punishment as it once could. Those who embrace the ghoul\'s curse become swift predators, but their newfound agility comes at a steep price.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_ghoul.png";
		this.m.Value = 500;
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

		result.push({
			id = 65,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "Mutates the body, causing severe sickness"
		});

		result.push({
			id = 65,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "Must be a Vatt\'ghern or a Mutant, and not already used this mutagen."
		});

		return result;
	}

	function onUse( _actor, _item = null )
	{
		if (_actor.getSkills().hasSkill( "effects.pov_ghoul_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Ghoul);
	}

});

