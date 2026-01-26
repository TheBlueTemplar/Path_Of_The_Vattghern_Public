this.pov_direwolf_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_direwolf_mutagen";
		this.m.Name = "Beast Mutagen";
		this.m.Description = "The Beast Mutagen embodies the primal essence of wild predators, enhancing agility and resilience at the cost of discipline and heavy protection. Those infused with this mutagen experience [color=" + this.Const.UI.Color.povTooltipRed + "]greatly reduced fatigue when moving or using skills[/color], allowing them to fight with unrelenting ferocity.\n\n Their predatory instincts shine in the dark, as they [color=" + this.Const.UI.Color.povTooltipRed + "]suffer only minor hindrances from nighttime combat[/color]. Additionally, the mutagen fortifies their bodies, rendering them [color=" + this.Const.UI.Color.povTooltipRed + "]immune to bleeding wounds[/color]. During combat, [color=" + this.Const.UI.Color.povTooltipRed + "]they become more feral as they are damaged[/color]. \n\n However, this primal power comes with a drawback: the cumbersome [color=" + this.Const.UI.Color.povTooltipRed + "]weight of armor becomes even more exhausting[/color], forcing the user to rely on speed and instinct rather than heavy defenses. A perfect choice for those who embrace their inner beast.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_direwolf.png";
		this.m.Value = 400;
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
		if (_actor.getSkills().hasSkill( "effects.pov_direwolf_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Direwolf);
	}

});