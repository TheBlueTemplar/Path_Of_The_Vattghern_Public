::TLW.HooksMod.hook("scripts/items/accessory/legend_demon_banshee_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 1750; // up from 1000
		this.m.IsPrecious = true;
	}	

	q.getTooltip = @(__original) function()
	{
		//local ret = __original();
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
			id = 10,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Initiative"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Fatigue Recovery Rate"
		});
		result.push({
			id = 13,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]."
		});
		return result;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		//__original(_properties);
		this.accessory.onUpdateProperties(_properties);
		_properties.Initiative += 20;
		_properties.FatigueRecoveryRate += 2;
		_properties.Threat += 5;
	}

});

