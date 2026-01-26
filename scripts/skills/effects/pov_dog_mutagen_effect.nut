this.pov_dog_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_dog_mutagen";
		this.m.Name = "Mutation: Dog";
		this.m.Icon = "skills/pov_dog.png";
		this.m.IconMini = "";
		this.m.Overlay = "dog";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Strong Back[/color]: This character has enhanced back structure and musles, allowing them to carry more things. Pack animals watch out!\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Unusual Mutagen[/color]: This mutation appears to not be as invasive as the other ones, allowing this character to have this along with other mutations easily.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Increased Stubborness[/color]: This character appears to be much more stubborn than usual, showing similar symptoms to lower intellect, making learning anything new a little harder. On the other hand, that same stubborness could be channeled into a very powerful kick...";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Gets the [color=" + this.Const.UI.Color.povTooltipBlue + "]Dominant Bark[/color] Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Initiative"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Enemies are [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] more likely to attack this character."
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.Initiative += 6;
		// Debuffs
		_properties.TargetAttractionMult *= 1.15;
	}

	function isHidden()
	{
		return this.inBattleHiddenCheck();
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_dominant_bark"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_dominant_bark_skill"));
		}
	}

	function inBattleHiddenCheck()
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return false;
		}

		return true;
	}

});

