this.pov_sling_pumice_pebbles <- this.inherit("scripts/items/ammo/ammo", {
	m = {},
	function create()
	{
		this.ammo.create();
		this.m.ID = "ammo.pov_sling_pumice_pebbles";
		this.m.Name = "pumice Pebbles";
		this.m.Description = "A pouch of pumice pebbles, meant to be used as sling ammunition. The lightest ammunition known for slings. It is not normally used to do extensive harm, being light and weak. Instead, it is meant to be shot in volume instead, easily so too, and the unique porous formation of this rock makes a powerful whistling sound, which can intimidate those weak of heart.\n\n When used, they consume and are refilled by ammunition normally, but if they run out, the slinger can still use normal stones";
		this.m.Icon = "ammo/pov_pouch_pumice.png";
		this.m.IconEmpty = "ammo/pov_pouch_empty.png";
		this.m.SlotType = this.Const.ItemSlot.Ammo;
		this.m.ItemType = this.Const.Items.ItemType.Ammo;
		this.m.AmmoType = this.Const.Items.AmmoType.SlingStones;
		this.m.ShowOnCharacter = false;
		this.m.ShowQuiver = false;
		//this.m.Sprite = "bust_quiver_01";
		this.m.Value = 750;
		this.m.Ammo = 20;
		this.m.AmmoMax = 20;
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
			icon = "ui/icons/vision.png",
			text = "Ranged attack range increased by [color=" + this.Const.UI.Color.PositiveValue + "]2[/color]."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Ranged attacks require [color=" + this.Const.UI.Color.PositiveValue + "]35%[/color] less fatigue and [color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] AP (or [color=" + this.Const.UI.Color.PositiveValue + "]-3[/color] for slingstaves) to use."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Low chance to [color=" + this.Const.UI.Color.NegativeValue + "]lower morale[/color] of enemies hit. Most effective against enemies with lower resolve."
		});

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "Ranged attacks deal [color=" + this.Const.UI.Color.NegativeValue + "]40%[/color] less damage, and are also [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color] less effective against armor."
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
			_skill.m.MaxRange = item.getRangeMax() + 2 + (_properties.IsSpecializedInSlings ? 1 : 0);
			_properties.RangedDamageMult *= 0.60;
			_properties.DamageArmorMult *= 0.90;
			//_properties.DamageDirectMult *= 1.30;
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
				if (skill.getID() == "actives.sling_stone")
				{
					skill.m.FatigueCost *= 0.65;
					skill.m.ActionPointCost = this.Math.max(1, skill.m.ActionPointCost - 1)
				}
				else if (skill.getID() == "actives.legend_sling_heavy_stone")
				{
					skill.m.FatigueCost *= 0.65;
					skill.m.ActionPointCost = this.Math.max(1, skill.m.ActionPointCost - 3)
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

		_target.checkMorale(-1, 25, this.Const.MoraleCheckType.Default);
	}

});

