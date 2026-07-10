// Fix Legends Root not having its AP/Fatigue cost applied because of the customized rain.
::TLW.HooksMod.hook("scripts/skills/actives/legend_root_skill", function (q) {
	q.onAfterUpdate = @(__original) function (_properties) {
		this.m.FatigueCostMult = _properties.IsSpecializedInStaves
			? this.Const.Combat.WeaponSpecFatigueMult
			: 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInStaves ? 5 : 6;
		this.m.FatigueCost = 15;

		local wet = this.getContainer().hasEffect(::Legends.Effect.LegendRain)
			|| (this.Tactical.isActive()
				&& this.Tactical.getWeather().IsRaining && _properties.IsAffectedByRain);

		if (wet) {
			this.m.FatigueCost -= 10;
			this.m.ActionPointCost -= 1;
		}
	}
});
