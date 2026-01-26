::TLW.HooksMod.hook("scripts/skills/actives/throw_balls", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.ActionPointCost = 3;
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Ignores[/color] the ranged defense bonus granted by shields."
			}
		);
		return ret;
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{	
		__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasSkill("effects.pov_goblin_mutagen"))
			{
				_properties.DamageTotalMult *= 1.18;
			}
		}	

		if (_targetEntity != null)
		{
			local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
			{
				local bonusHit = this.Math.max(1,shield.getRangedDefense());
				_properties.RangedSkill += bonusHit;
			}
		}
	}

});	