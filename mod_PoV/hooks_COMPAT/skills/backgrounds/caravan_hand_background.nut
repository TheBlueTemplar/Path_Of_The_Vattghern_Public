::TLW.HooksMod.hook("scripts/skills/backgrounds/caravan_hand_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "The fatigue and initiative penalty from wearing armor is decreased by [color=" + this.Const.UI.Color.NegativeValue + "]7%[/color]."
			}
		);
		return ret;
	}

	getPenalty <- function()
	{
		local actor = this.getContainer().getActor();

		local bodyitem = actor.getBodyItem();

		if (bodyitem == null)
		{
			return 0;
		}
	
		local armorFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Body);
		local helmetFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Head);
		local totalPen = armorFatPen + helmetFatPen;
		local penalty = totalPen * 0.07;
		return -1 * penalty; // well its a bonus here DUH
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		_properties.Stamina += this.getPenalty();
		_properties.Initiative += this.getPenalty();
	}
})
