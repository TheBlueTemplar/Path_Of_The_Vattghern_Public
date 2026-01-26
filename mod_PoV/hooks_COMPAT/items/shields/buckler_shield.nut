::TLW.HooksMod.hook("scripts/items/shields/buckler_shield", function (q) {
	
	q.getTooltip = @(__original) function ()
	{
		local result = __original();
		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "In battle, [color=" + this.Const.UI.Color.PositiveValue + "]increases[/color] defenses when engaged with one to three enemies."
		});
		return result;
	}

});

