this.pov_unhold_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_unhold_mutagen";
		this.m.Name = "Unhold Mutagen";
		this.m.Description = "The Unhold Mutation grants the character an incredible vitality, with wounds healing almost instantly in battle due to hyperactive cell growth, and [color=" + this.Const.UI.Color.povTooltipRed + "]vastly increased hitpoints[/color].\n\nHowever, this [color=" + this.Const.UI.Color.povTooltipRed + "]rapid regeneration[/color] comes at a cost...[color=" + this.Const.UI.Color.povTooltipRed + "]while the body focuses on recovery, it weakens the character\'s offensive power[/color], making their attacks progressively weaker as they take more damage, though when healthy, the opposite is true. Due to increased size, the character can also perform stronger bodily attacks.\n\nAdditionally, the mutation [color=" + this.Const.UI.Color.povTooltipRed + "]significantly increases the character\'s appetite[/color], as the accelerated metabolism demands more food than usual. While they don\'t mind the extra rations, caution is advised, especially when mead is involved!";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_unhold.png";
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
		if (_actor.getSkills().hasSkill( "effects.pov_unhold_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Unhold);
	}

});

