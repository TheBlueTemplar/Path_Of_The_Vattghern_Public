::TLW.HooksMod.hook("scripts/skills/actives/legend_heartseeker_skill", function ( q ) {

	q.create = @(__original) function()
	{
		__original();
		this.m.DirectDamageMult = 0.45;
		if (this.m.IsPolearm || this.m.IsTwoHanded)
		{
			this.m.FatigueCost = 28;
			this.m.DirectDamageMult = 0.45; // might be too high for 2handed - test
			this.m.MaxRange = 2;
			//this.m.Description += " Has a range of 2 tiles.";
		}
	}

	q.setItem = @(__original) function(_item)
	{
		__original(_item);
		if (this.m.IsPolearm || this.m.IsTwoHanded)
		{
			this.m.FatigueCost = 28;
			this.m.DirectDamageMult = 0.45;
			this.m.MaxRange = 2;
			this.m.Description += " Has a range of 2 tiles.";
		}
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			// Legends added 10% dmg, so now I add +5%, instead of the +15% I did
			//_properties.DamageTotalMult *= 1.15;
			_properties.DamageTotalMult *= 1.05;
		}
	}
});	
