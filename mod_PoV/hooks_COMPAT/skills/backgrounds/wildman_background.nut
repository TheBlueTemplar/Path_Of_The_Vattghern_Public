::TLW.HooksMod.hook("scripts/skills/backgrounds/wildman_background", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Cannot Read Books, and it would be a waste of time to try and change that."
			}
		);
		return ret;
	}
})
