this.pov_alp_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	// "Touch The Alps, they like it!"
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_alp_mutagen";
		this.m.Name = "Mutagen: Alp";
		this.m.Description = "This mutagen awakens a supernatural awareness, granting the user an [color=" + this.Const.UI.Color.povTooltipRed + "]eerie clarity in darkness[/color]. Night holds no secrets from their gaze, and their altered eyes pierce through the gloom with unnatural precision.\n\n[color=" + this.Const.UI.Color.povTooltipRed + "]They develop a mysterious Third Eye[/color], enhancing their perception beyond mortal limits, allowing them to detect threats others would overlook. Their body, too, adapts to the realm of nightmares, [color=" + this.Const.UI.Color.povTooltipRed + "]resisting the suffocating grasp of toxic mists and foul vapors[/color].\n\n[color=" + this.Const.UI.Color.povTooltipRed + "]Enemy projectiles seem to veer just slightly off-course[/color], as if guided by unseen forces, and even if they hit, they cause less harm. \n\n However, this transformation comes at a cost: [color=" + this.Const.UI.Color.povTooltipRed + "]learning slows[/color], as if trapped in a waking dream, and the body's endurance wanes, making it [color=" + this.Const.UI.Color.povTooltipRed + "]harder to shake off exhaustion[/color].";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_alp.png";
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
		if (_actor.getSkills().hasSkill( "effects.pov_alp_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Alp);
	}

});

