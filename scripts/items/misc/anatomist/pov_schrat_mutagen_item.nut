this.pov_schrat_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_schrat_mutagen";
		this.m.Name = "Schrat Mutagen";
		this.m.Description = "This mutagen reshapes the body into a form of unyielding resilience, reinforcing the flesh with a hardened, bark-like exterior. The skin stiffens into a [color=" + this.Const.UI.Color.povTooltipRed + "]natural armor[/color], dulling the force of incoming blows and granting an almost [color=" + this.Const.UI.Color.povTooltipRed + "]immovable stance[/color]...no push, pull, or force can shift them against their will. If suffering from a serious attack, [color=" + this.Const.UI.Color.povTooltipRed + "]saplings will sprout from the mutant\'s blood to defend them[/color].\n\n [color=" + this.Const.UI.Color.povTooltipRed + "]When bearing a shield, this fortitude is further amplified[/color], making them an unbreakable wall against attacks. However, the weight of their altered frame burdens their movements, [color=" + this.Const.UI.Color.povTooltipRed + "]sapping their stamina with each step[/color].\n\nWorse still, the very mutation that grants them durability leaves them tragically [color=" + this.Const.UI.Color.povTooltipRed + "]susceptible to fire[/color], as their transformed flesh ignites with terrifying ease. [color=" + this.Const.UI.Color.povTooltipRed + "]Without a shield to balance their reinforced body, they become noticeably sluggish, their defenses faltering[/color] when exposed to direct strikes.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_schrat.png";
		this.m.Value = 600;
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
		if (_actor.getSkills().hasSkill( "effects.pov_schrat_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Schrat);
	}

});


