::TLW.HooksMod.hook("scripts/skills/actives/legend_field_triage_skill", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.Description = "Heal a unit for 2Hp + 1% of their Max Hp, for every 1 Medicine Used. Heals up to 20 Hp + 10% MaxHp per use.";
	}

	q.getTooltip = @(__original) function()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color], can only target damaged units."
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/asset_medicine.png",
			text = "You have [color=" + this.Const.UI.Color.PositiveValue +"]" + this.World.Assets.getMedicine() + "[/color] medicine."
		});
		return ret;
	}

	q.onUse = @(__original) function(_user, _targetTile)
	{
		local meds = this.World.Assets.getMedicine();
		local target = _targetTile.getEntity();
		local maxMedsPerUse = 10;
		local usableMeds = this.Math.min(meds, maxMedsPerUse);
		// Base healing per medicine: 2 HP + 1% of target's max HP
		local healPerMed = 2 + (target.getHitpointsMax() * 0.01);

		// Calculate maximum possible healing for this use
		local maxHeal = healPerMed * usableMeds;
		// Calculate how much HP the target is missing
		local neededHeal = target.getHitpointsMax() - target.getHitpoints();

		// Final healing amount (can't heal more than needed)
		local finalHeal = this.Math.min(maxHeal, neededHeal);
		// Calculate how many meds this healing actually costs
		local finalMeds = finalHeal / healPerMed;

		// Round up the cost and deduct from assets
		local cost = this.Math.ceil(finalMeds);
		this.World.Assets.addMedicine(cost * -1);

		// Apply the healing
		target.setHitpoints(this.Math.min(target.getHitpointsMax(), target.getHitpoints() + finalHeal));

		return true;
	}
});	

