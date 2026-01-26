::TLW.HooksMod.hook("scripts/items/accessory/alp_trophy_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 600; // up from 400
	}	

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] vision."
			}
		);
		return ret;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.Vision += 1;
	}

});

