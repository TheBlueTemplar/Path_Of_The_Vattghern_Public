::TLW.HooksMod.hook("scripts/skills/backgrounds/peddler_background", function(q)
{
	q.onAdded = @(__original) function()
	{
		__original();
		local actor = this.getContainer().getActor();

		if (!actor.getFlags().has("PovEasyLearnRead"))
		{
			actor.getFlags().add("PovEasyLearnRead");
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
				text = "Can learn to read books much quicker, and without penalties."
			}
		);
		return ret;
	}
})
