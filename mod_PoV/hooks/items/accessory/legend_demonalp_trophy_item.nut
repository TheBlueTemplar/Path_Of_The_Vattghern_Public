::TLW.HooksMod.hook("scripts/items/accessory/legend_demonalp_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 2499; // down from 2500
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
			icon = "ui/icons/xp_received.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]15%[/color] Experience Gain"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] Vision"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/pov_time_of_day.png",
			text = "Not affected by nighttime penalties."
		});
		return result;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		//__original(_properties);
		this.accessory.onUpdateProperties(_properties);
		_properties.XPGainMult *= 1.15;
		_properties.Vision += 2;
		_properties.IsAffectedByNight = false;
	}

});

