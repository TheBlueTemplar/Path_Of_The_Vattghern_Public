::TLW.HooksMod.hook("scripts/skills/actives/legend_haftstrike", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
	}

	q.onUse = @(__original) function(_user, _targetTile)
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		//__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			_properties.DamageTotalMult *= 0.35;
			_properties.DamageArmorMult *= 1.20;
			_properties.MeleeSkill += -5;
			this.m.HitChanceBonus = -5;
		}	
	}

});	
