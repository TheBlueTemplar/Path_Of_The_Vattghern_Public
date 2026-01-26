::TLW.HooksMod.hook("scripts/items/tools/holy_water_item", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		this.m.Description = "A flask filled with water blessed by a man of the gods. Can be thrown at short ranges. Damages , debuffs and disrupts special abilities of the undead. \n\n This item is refilled after each battle, consuming 20 ammunition per use.";
	}

	q.getTooltip = @(__original) function ()
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

		result.extend([
			{
				id = 66,
				type = "text",
				text = this.getValueString()
			},
			{
				id = 64,
				type = "text",
				text = "Worn in Offhand"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Range of [color=%positive%]" + this.m.RangeMax + "[/color] tiles"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]10 - 20 + 10% of its Max Hp[/color] damage [color=" + this.Const.UI.Color.DamageValue + "]3[/color] turns, all of which ignores armor"
			},	
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Target will also lose [color=" + this.Const.UI.Color.DamageValue + "]15%[/color] of its main combat stats for the duration."
			}
		]);
		
		return result;
	}

	q.consumeAmmo = @(__original) function ()
	{
		//__original();
		this.m.AmmoCost = 0;
		this.weapon.consumeAmmo(); // to prevent scavenger retinue from recover ammo part
		this.m.AmmoCost = 20;
	}

	q.getAmmo = @(__original) function ()
	{
		//__original();
		return this.weapon.getAmmo();
	}

	q.setAmmo = @(__original) function (_a)
	{
		//__original();
		this.weapon.setAmmo( _a );

		if (this.m.Ammo > 0)
		{
			this.m.Name = "Holy Water";
			this.m.IconLarge = "tools/holy_water_01.png";
			this.m.Icon = "tools/holy_water_01_70x70.png";
			this.m.ShowArmamentIcon = true;
			this.m.Description = this.m.OriginalDescription;
			this.m.Value = m.OriginalValue;
		}
		else
		{
			this.m.Name = "Holy Water (Used)";
			this.m.IconLarge = "tools/holy_water_01.png";
			this.m.Icon = "tools/holy_water_01_70x70.png";
			this.m.ShowArmamentIcon = false;
			this.m.Description = "A spent and shattered flask of holy water. This item is refilled after each battle, consuming 20 ammunition per use.";
			this.m.Value = 50;
		}

		this.updateAppearance();
	}

});

