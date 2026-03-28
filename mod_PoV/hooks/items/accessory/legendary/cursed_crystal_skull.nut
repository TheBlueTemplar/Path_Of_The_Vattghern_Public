::TLW.HooksMod.hook("scripts/items/accessory/legendary/cursed_crystal_skull", function (q) {	

	q.create = @(__original) function ()
	{
		__original();
		this.m.Value = 2500; // up from 250
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
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]-15[/color]"
		});
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Increases all damage done by [color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color]"
		});
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Resolve reduced by [color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color]"
		});
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "User can never have [color=" + this.Const.UI.Color.NegativeValue + "]confident[/color] morale"
		});
		return result;
	}

	q.onUpdateProperties = @(__original) function (_properties)
	{
		//__original(_properties);
		this.accessory.onUpdateProperties(_properties);
		
		local actor = this.getContainer().getActor();
		actor.setMaxMoraleState(this.Const.MoraleState.Steady);

		if (actor.getMoraleState() > this.Const.MoraleState.Steady)
		{
			actor.setMoraleState(this.Const.MoraleState.Steady);
			actor.setDirty(true);
		}

		_properties.Threat += 15; // +5
		_properties.DamageTotalMult *= 1.08;
		_properties.BraveryMult *= 0.85;
	}

});

