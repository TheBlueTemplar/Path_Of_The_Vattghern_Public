::TLW.HooksMod.hook("scripts/skills/backgrounds/monk_background", function(q)
{
	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}

		if (!actor.getFlags().has("PovReadLimitEducated"))
		{
			actor.getFlags().add("PovReadLimitEducated");
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can read books, with +1 to the max limit."
			}
		);
		return ret;
	}
})
