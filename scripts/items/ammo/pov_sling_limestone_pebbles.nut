this.pov_sling_limestone_pebbles <- this.inherit("scripts/items/ammo/ammo", {
	m = {},
	function create()
	{
		this.ammo.create();
		this.m.ID = "ammo.pov_sling_limestone_pebbles";
		this.m.Name = "Limestone Pebbles";
		this.m.Description = "A pouch of carefully cut and shaped limestone pebbles, meant to be used as sling ammunition. Lighter than most of other slingstones, they offer increased effective range at the cost of raw power. They are also slightly less fatiguing to use.\n\n When used, they consume and are refilled by ammunition normally, but if they run out, the slinger can still use normal stones";
		this.m.Icon = "ammo/pov_pouch_limestone.png";
		this.m.IconEmpty = "ammo/pov_pouch_empty.png";
		this.m.SlotType = this.Const.ItemSlot.Ammo;
		this.m.ItemType = this.Const.Items.ItemType.Ammo;
		this.m.AmmoType = this.Const.Items.AmmoType.SlingStones;
		this.m.ShowOnCharacter = false;
		this.m.ShowQuiver = false;
		//this.m.Sprite = "bust_quiver_01";
		this.m.Value = 1000;
		this.m.Ammo = 15;
		this.m.AmmoMax = 15;
		this.m.StaminaModifier = -1;
		this.m.IsDroppedAsLoot = true;
		this.m.AddGenericSkill = true;
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
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Weight: [color=%negative%]" + this.m.StaminaModifier + "[/color]"
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Ranged attack range increased by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color]."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/direct_damage.png",
			text = "Ranged attacks armor ignore increased by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color], and require [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] less fatigue to use."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "Ranged attacks deal [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] less damage, and are also [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] less effective against armor."
		});


		if (this.m.Ammo != 0)
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "Contains [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Ammo + "[/color] pebbles"
			});
		}
		else
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is empty. Attacks will use normal stones instead[/color]"
			});
		}

		return result;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local item = _skill.getItem();
		if (_skill.isAttack() && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Sling) && this.m.Ammo != 0)
		{
			_skill.m.MaxRange = item.getRangeMax() + 1 + (_properties.IsSpecializedInSlings ? 1 : 0);
			_properties.RangedDamageMult *= 0.85;
			_properties.DamageArmorMult *= 0.85;
			_properties.DamageDirectMult *= 1.30;
		}
	}

	function onUpdateProperties(_properties)
	{
		this.ammo.onUpdateProperties(_properties);
		local actor = this.getContainer().getActor();
		if (actor != null && this.m.Ammo != 0)
		{			
			local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.Active);
			foreach (skill in skills)
			{
				if (skill.getID() == "actives.sling_stone" || skill.getID() == "actives.legend_sling_heavy_stone")
				{
					skill.m.FatigueCost *= 0.80;
				}
			}
		} 
	}

});

