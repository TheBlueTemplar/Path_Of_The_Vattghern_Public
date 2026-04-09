::TLW.HooksMod.hook("scripts/skills/effects/legend_constrained_effect", function (q) {

	q.getTooltip = @(__original) function()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Builds up [color=" + this.Const.UI.Color.NegativeValue + "]3[/color] more Fatigue for each tile travelled"
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]1[/color] Additional Action Point per tile moved"
			}
		];
		return tooltip;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		_properties.MovementFatigueCostAdditional += 3;
		_properties.MovementAPCostAdditional += 1;
	}

});

