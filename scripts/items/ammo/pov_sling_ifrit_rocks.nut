this.pov_sling_ifrit_rocks <- this.inherit("scripts/items/ammo/ammo", {
	m = {},
	function create()
	{
		this.ammo.create();
		this.m.ID = "ammo.pov_sling_ifrit_rocks";
		this.m.Name = "Shatterstones";
		this.m.Description = "A pouch of specially crafted ifrit rocks called \"shatterstones\". While they are harder than usual rocks, they have the ability of splitting apart on impact, dousing the enemy with sand, effectively distracting them. Their added weight does come with drawbacks, but they are not as bad as with other heavier rocks.\n\n When used, they consume and are refilled by ammunition normally, but if they run out, the slinger can still use normal stones";
		this.m.Icon = "ammo/pov_pouch_ifrit.png";
		this.m.IconEmpty = "ammo/pov_pouch_empty.png";
		this.m.SlotType = this.Const.ItemSlot.Ammo;
		this.m.ItemType = this.Const.Items.ItemType.Ammo;
		this.m.AmmoType = this.Const.Items.AmmoType.SlingStones;
		this.m.ShowOnCharacter = false;
		this.m.ShowQuiver = false;
		//this.m.Sprite = "bust_quiver_01";
		this.m.Value = 1500;
		this.m.Ammo = 8;
		this.m.AmmoMax = 8;
		this.m.StaminaModifier = -2;
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
			icon = "ui/icons/ranged_skill.png",
			text = "Ranged attacks deal [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] more damage, and are also [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] more effective against armor."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Enemies hit are [color=" + this.Const.UI.Color.NegativeValue + "]distracted[/color]."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Ranged attacks require [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color] more fatigue to use."
		});



		if (this.m.Ammo != 0)
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "Contains [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Ammo + "[/color] rocks"
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
			//_skill.m.MaxRange = item.getRangeMax() - 2 + (_properties.IsSpecializedInSlings ? 1 : 0);
			_properties.RangedDamageMult *= 1.10;
			_properties.DamageArmorMult *= 1.10;
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
					skill.m.FatigueCost *= 1.20;
				}
			}
		} 
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		if ( _skill == null || _skill.m.IsWeaponSkill == false )
			return;

		if (!_target.isAlive() || _target.isDying())
			return;

		local distracted = this.new("scripts/skills/effects/distracted_effect");
		_target.getSkills().add(distracted);
	}

});

