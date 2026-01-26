::TLW.HooksMod.hook("scripts/skills/actives/legend_prayer_of_life_skill", function ( q ) {

	q.create = @(__original) function()
	{	
		__original();
		this.m.ActionPointCost = 5;
		//this.m.FatigueCost = 25;
	}

	q.onUse = @(__original) function(_user, _targetTile)
	{
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		local bonus = _user.getCurrentProperties().Bravery * 0.20;

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 1)
			{
				continue;
			}

			if (a.getFaction() == _user.getFaction())
			{
				if (!a.getFlags().has("cultist") && !a.getSkills().hasSkill("effects.legend_prayer_of_life"))
				{
					local effect = this.new("scripts/skills/effects/legend_prayer_of_life_effect");
					effect.setHeal(bonus);
					a.getSkills().add(effect);
				}
			}

			if (a.getFlags().has("undead") && !a.getFlags().has("ghoul"))
			{
				if (!a.getSkills().hasSkill("effects.disintegrating"))
				{
					local disintegrating = this.new("scripts/skills/effects/legend_disintegrating_effect");
					disintegrating.m.Damage = bonus * 0.75;
					a.getSkills().add(disintegrating);
				}
			}
		}

		return true;
	}

});	