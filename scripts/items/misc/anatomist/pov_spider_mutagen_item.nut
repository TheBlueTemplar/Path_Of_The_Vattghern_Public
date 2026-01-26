this.pov_spider_mutagen_item <- this.inherit("scripts/items/misc/anatomist/pov_anatomist2_potion_item", {
	m = {},
	function create()
	{
		this.pov_anatomist2_potion_item.create();
		this.m.ID = "misc.pov_spider_mutagen";
		this.m.Name = "Spider Mutagen";
		this.m.Description = "This mutagen reshapes the body into a venomous predator, making every strike drip with toxic potency. The user becomes [color=" + this.Const.UI.Color.povTooltipRed + "]immune to poison[/color], their altered physiology thriving where others would falter. [color=" + this.Const.UI.Color.povTooltipRed + "]Every attack delivers a dose of venom[/color], sapping the strength and reflexes of their foes, leaving them sluggish and vulnerable.\n\n[color=" + this.Const.UI.Color.povTooltipRed + "]Against already poisoned enemies, their strikes land with enhanced lethality[/color], rewarding patience and persistence in combat. However, their reliance on venom comes at a cost...[color=" + this.Const.UI.Color.povTooltipRed + "]against untainted foes, their blows lack the same raw power[/color], forcing them to either adapt and ensure their prey is always envenomed. \n\n They also get the ability to weave some amounts of silky web, which can be used to [color=" + this.Const.UI.Color.povTooltipRed + "]snare their foes[/color], making them vulnerable to attack.";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/pov_potion_spider.png";
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
		if (_actor.getSkills().hasSkill( "effects.pov_spider_mutagen_upgraded"))
		{
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			::World.State.m.CharacterScreen.m.JSHandle.asyncCall("openPopupDialog", ::Legends.tooltip("This character cannot get the base mutation effect, when its upgraded version is active. Nice try."));
			return false;
		}
		return ::TLW.MutatePlayer.mutatePlayer(_actor, ::TLW.PlayerMutation.Spider);
	}

});

