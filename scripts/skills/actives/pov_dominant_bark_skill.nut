this.pov_dominant_bark_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0
	},
	function create()
	{
		this.m.ID = "actives.pov_dominant_bark";
		this.m.Name = "Dominant Bark";
		this.m.Description = "Bark at someone...Dominantly. How would this even be useful?";
		this.m.Icon = "skills/pov_active_bark.png";
		this.m.IconDisabled = "skills/pov_active_bark_sw.png";
		this.m.Overlay = "pov_active_bark";
		this.m.SoundOnUse = [
			"sounds/enemies/wardog_charge_00.wav",
			"sounds/enemies/wardog_charge_01.wav",
			"sounds/enemies/wardog_charge_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 8;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];

		ret.push(
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Bark towards a selected direction. Assert Dominance."
			}
		);

		if (this.m.Cooldown >= 1)
		{
			ret.push(
				{
					id = 7,
					type = "hint",
					icon = "ui/icons/warning.png",
					text = "Skill is on cooldown. Turns remaining: [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Cooldown+"[/color]"
				}
			);
		}

		return ret;
	}

	function onCombatStarted()
	{
		this.m.Cooldown = 0;
	}

	function onTurnStart()
	{
		this.m.Cooldown = 0;
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
		
		local target = _targetTile.getEntity();

		if (target == null)
		{
			return;
		}
		
		if (!target.isAlive() || target.isDying())
		{
			return;
		}

		if (::MSU.isKindOf(target, "wardog") || ::MSU.isKindOf(target, "warhound"))
		{
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		} 
		else if (::MSU.isKindOf(target, "direwolf") || ::MSU.isKindOf(target, "hyena") || target.getFlags().has("pov_mutant_direwolf"))
		{
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
			target.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		}
		else
		{
			target.checkMorale(-1, 25, this.Const.MoraleCheckType.MentalAttack);
		}
		
		return true;
	}

});

