::TLW.HooksMod.hook("scripts/skills/effects/legend_dual_wield_effect", function (q) {

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "Each individual attack does [color=%negative%]-10%[/color] Melee Damage"
		});
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/pov_melee_ranged_defense.png",
			text = "[color=%negative%]-10%[/color] Melee and Ranged Defense"
		});
		return ret;
	}

	q.onUpdate = @(__original) function (_properties)
	{
		_properties.MeleeDamageMult *= 0.90;
		_properties.RangedDefenseMult *= 0.90;
		_properties.MeleeDefenseMult *= 0.90;
	}

});

