this.pov_hate_dogs_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_hate_dogs";
		this.m.Name = "Hates Dogs";
		this.m.Icon = "ui/traits/pov_hate_dogs.png";
		this.m.Description = "\"They\'re completely unbearable… They bark, mark and generally, all they day, fart. I prefer cats, they hate the same things as me.\"";
	}

	function getTooltip()
	{
		return [
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
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] Attack and Damage against dogs."
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local fightingDogs = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (enemy.getFlags().has("mutant"))
			{
				fightingDogs = true;
				break;
			}
		}

		if (fightingDogs)
		{
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;
		} else {
			// Make this a trait so it will not be visible for the battle
			this.m.Type = ::Const.SkillType.Trait;
		}

	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if (_targetEntity != null)
		{
			if(::MSU.isKindOf(_targetEntity, "wardog") || ::MSU.isKindOf(_targetEntity, "warhound"))
			{
				_properties.DamageTotalMult *= 1.15;
				_properties.MeleeSkillMult *= 1.15;
				_properties.RangedSkillMult *= 1.15;
			}
		}
	}

});
