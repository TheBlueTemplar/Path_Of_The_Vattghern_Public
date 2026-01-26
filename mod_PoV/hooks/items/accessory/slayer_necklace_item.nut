::TLW.HooksMod.hook("scripts/items/accessory/special/slayer_necklace_item", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Name = "Orc Slayer\'s Necklace";
		this.m.Description = "A necklace made out of what appear to be orc bones. Said to be the property of an infamous, unstoppable slayer.";
		this.m.Value = 1000; // up from 100
	}	

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Grants immunity to being stunned"
			}		
		);
		return ret;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.IsImmuneToStun = true;
	}

});

