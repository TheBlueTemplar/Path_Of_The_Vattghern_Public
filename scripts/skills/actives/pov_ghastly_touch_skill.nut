this.pov_ghastly_touch_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0
	},
	function create()
	{
		this.m.ID = "actives.pov_ghastly_touch";
		this.m.Name = "Ghastly Touch";
		this.m.Description = "Focus aetherial energy at the edge of your hand, driving it into an enemy. Does some damage that completely ignores armor.\n\n Cannot do critical hits, has a cooldown of 1 turn.";
		this.m.KilledString = "Touched to death"; //hehe...
		this.m.Icon = "skills/pov_active_ghastly_touch.png";
		this.m.IconDisabled = "skills/pov_active_ghastly_touch_sw.png";
		this.m.Overlay = "pov_active_ghastly_touch";
		this.m.SoundOnUse = [
			"sounds/enemies/ghastly_touch_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Ignores[/color] the defense bonus granted by shields."
			}
		]);	
		if (this.m.Cooldown >= 1)
		{
			ret.extend([
				{
					id = 7,
					type = "hint",
					icon = "ui/icons/warning.png",
					text = "Skill is on cooldown. Turns remaining: [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Cooldown+"[/color]"
				}
			]);
		}
		return ret;
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

	function isUsable()
	{
		if (this.m.Cooldown <= 0){
			return true;
		}else{
			return false;
		}
	}

	function onUse( _user, _targetTile )
	{
		this.m.Cooldown = 1;
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.HitChance[this.Const.BodyPart.Head] = 0; // Always hit body
			// Hit Chance Mod
			_properties.MeleeSkill -= 5;
			// Skill Stats
			_properties.DamageRegularMin = 25;
			_properties.DamageRegularMax = 40;
			_properties.DamageArmorMult *= 0;
			_properties.IsIgnoringArmorOnAttack = true;	
		}

		if (_targetEntity != null)
		{
			local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
			{
				local bonusHit = this.Math.max(1,shield.getRangedDefense());
				_properties.MeleeSkill += bonusHit;
				_properties.RangedSkill += bonusHit;
			}
		}
	}

});

