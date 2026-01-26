::TLW.HooksMod.hook("scripts/skills/traits/dumb_trait", function(q)
{
	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Cannot read books, and cannot learn to read them either, unless this trait is removed somehow. (Overrides other effects that might allow reading)"
			}
		);
		return ret;
	}
})
