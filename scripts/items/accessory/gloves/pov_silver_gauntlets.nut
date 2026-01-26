this.pov_silver_gauntlets <- this.inherit("scripts/items/accessory/gloves/legend_glove_item", {
	m = {
		RegularDamage = 8,
		RegularDamageMax = 14,
		ChokeMin = 3,
		ChokeMax = 6,
		ArmorDamageMult = 0.20, // +50 = 70%
		DirectDamageMult = 0.15, // +10 = 25%
		InventorySound = "sounds/combat/armor_halfplate_impact_01.wav"

	},
	function create()
	{
		this.legend_glove_item.create();
		this.m.ID = "accessory.pov_silver_gauntlets";
		this.m.Name = "Silver Plated Gauntlets";
		this.m.Description = "A pair of armored gauntlets with silver plated spikes on the knuckles that can certainly pack a punch, especially when these are directed to beasts and mutants.";
		this.m.Icon = "accessory/pov_silver_gauntlets.png";
		this.m.Value = 3250;
		this.m.StaminaModifier = -3;
	}

	function getTooltip()
	{
		local result = this.legend_glove_item.getTooltip();

		result.extend(
		[
			{
				id = 15,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Increases unarmed damage vs mutants, beasts, undead and spirits by [color=" + this.Const.UI.Color.PositiveValue + "]35%[/color]"
			}
		]);
		return result;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		this.accessory.onAnySkillUsed(_skill, _targetEntity, _properties);
		if (_targetEntity != null && _skill != null)
		{
			local actor = this.getContainer().getActor();
			if (actor != null)
			{
				if (_skill.getID() == "actives.hand_to_hand")
				{
					if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Beasts || _targetEntity.getFlags().has("ghost") || _targetEntity.getFlags().has("undead") || _targetEntity.getFlags().has("mutant"))
					{
						_properties.DamageTotalMult *= 1.35;
					}
				}	
			}
		}	
	}

});
