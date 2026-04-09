::TLW.HooksMod.hook("scripts/skills/actives/legend_throw_knife_skill", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
	}

	q.onAfterUpdate = @(__original) function( _properties )
	{
		if (this.getContainer().hasPerk(::Legends.Perk.LegendPointBlank))
			this.m.MinRange = 1;

		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
		this.m.AdditionalAccuracy = 20 + this.m.Item.getAdditionalAccuracy();
		this.m.ActionPointCost = this.getContainer().hasPerk(::Legends.Perk.LegendAmbidextrous) ? 3 : 4;
		this.m.DistractedChance = _properties.IsSpecializedInDaggers ? 50 : 25;

		if (this.getContainer().hasPerk(::Legends.Perk.LegendAmbidextrous) || _properties.IsSpecializedInDaggers)
		{
			this.m.ActionPointCost = 2;
		}
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		//__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			_properties.DamageTotalMult *= 0.75;
			_properties.DamageArmorMult *= 1.20;
			_properties.RangedSkill -= 5;
			this.m.AdditionalAccuracy -= 5;

			_properties.RangedSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;		
		}	
	}

});	