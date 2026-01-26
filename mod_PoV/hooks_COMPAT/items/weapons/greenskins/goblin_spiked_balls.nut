::TLW.HooksMod.hook("scripts/items/weapons/greenskins/goblin_spiked_balls", function (q) {
	
	q.create = @(__original) function ()
	{
		__original();
		// Balls heheheh
		this.m.Name = "Bundle of Bolas";
		this.m.Description = "Small but dangerous - like their original owners - these iron balls are to be hurled at a target. Being made for smaller hands, more can be carried, and they can be thrown more easily.";
		this.m.Value = 300;
		this.m.Ammo = 8;
		this.m.AmmoMax = 8;
		this.m.StaminaModifier = -5;
		this.m.ArmorDamageMult = 1.15;
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Attacks [color=" + this.Const.UI.Color.PositiveValue + "]Ignore[/color] the defense bonus granted by shields."
			}
		);
		return ret;
	}

	q.onEquip = @(__original) function ()
	{
		__original();
		local flail = this.new("scripts/skills/actives/flail_skill");
		flail.m.IsThrowingWeapon = true;
		flail.m.ActionPointCost = 3;
		this.addSkill(flail);
	}

});

