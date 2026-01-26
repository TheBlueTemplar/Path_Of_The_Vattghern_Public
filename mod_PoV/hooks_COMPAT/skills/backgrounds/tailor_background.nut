::TLW.HooksMod.hook("scripts/skills/backgrounds/tailor_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "Each day, repair [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of max armor."
			}
		);
		return ret;
	}

	repair <- function(_toRepair)
	{
		local actor = this.getContainer().getActor();
		local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local bodyAdded = 0;
		local bodyMissing = 0;
		local repaired = false;
		if (body)
		{
			bodyMissing = body.getArmorMax() - body.getArmor();
			bodyAdded = this.Math.min(bodyMissing, this.Math.max(0, this.Math.floor(body.getArmorMax() * _toRepair)));

			if (bodyAdded > 0)
			{
				body.setArmor(body.getArmor() + bodyAdded);
				actor.setDirty(true);
			}
			repaired = true;
		}

		body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		if (body)
		{
			bodyMissing = body.getArmorMax() - body.getArmor();
			bodyAdded = this.Math.min(bodyMissing, this.Math.max(0, this.Math.floor(body.getArmorMax() * _toRepair)));

			if (bodyAdded > 0)
			{
				body.setArmor(body.getArmor() + bodyAdded);
				actor.setDirty(true);
			}
			repaired = true;
		}
		if (repaired)
			return true;
		return false;
	}

	function onNewDay()
	{
		repair(0.1);
	}

})
