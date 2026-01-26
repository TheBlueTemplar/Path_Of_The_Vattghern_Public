::TLW.HooksMod.hook("scripts/skills/backgrounds/legend_noble_shield", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "Melee and Ranged defense increased by [color=" + this.Const.UI.Color.NegativeValue + "]4[/color] when using a shield."
			}
		);
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		__original(_properties);
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (actor != null && item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			_properties.MeleeDefense += 4;
			_properties.RangedDefense += 4;
		}
	}
})
