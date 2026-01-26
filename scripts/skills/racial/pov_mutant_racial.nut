this.pov_mutant_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.pov_mutant";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill != null)
		{
			// Mutagen Research Retinue increases corpse drop rates
			local hasResearch = this.World.Retinue.hasFollower("follower.pov_mutagen_research");
			if (hasResearch)
			{
				_properties.DamageReceivedTotalMult *= 1.10;
			}	
		}
	}

});

