::TLW.HooksMod.hook("scripts/skills/actives/throw_holy_water", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Description ="Throw a flask of blessed water towards a target, where it will shatter and spray its contents. The blessed water will burn and debuff the undead, but will not affect other targets.";
	}

	q.getTooltip = @(__original) function()
	{
		//local ret = __original();
		local ret = this.getDefaultUtilityTooltip();
		local ammo = this.getAmmo();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]10 - 20 + 10% of its Max Hp[/color] damage [color=" + this.Const.UI.Color.DamageValue + "]3[/color] turns, all of which ignores armor"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Target will also lose [color=" + this.Const.UI.Color.DamageValue + "]15%[/color] of its main combat stats for the duration."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.DamageValue + "]33%[/color] chance to hit bystanders at the same or lower height level as well."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Only affects undead targets"
		});
		if (ammo > 0)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Has [color=%positive%]" + ammo + "[/color] use left"
			});
		}
		else
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=%negative%]Has been used[/color]"
			});
		}
		return ret;
	}

});	

//dont know how this will work with legends' hook, but should be okay, maybe
//bless u pot, used this shet for sth else