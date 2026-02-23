this.kill_rogue_vattghern_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "kill_rogue_vattghern_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 25;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		/*if (!_faction.isReadyForContract())
		{
			return;
		}*/

		if (!_faction.isReadyForContract(this.Const.Contracts.ContractCategoryMap.kill_rogue_vattghern_contract))
		{
			return;
		}

		if (_faction.getSettlements()[0].isIsolatedFromRoads())
		{
			return;
		}

		// Only on (half) pro renown
		if (this.World.Assets.getBusinessReputation() < 525)
		{
			return;
		}

		// Check if vattghern is in party
		local brothers = this.World.getPlayerRoster().getAll();
		local vattghern_candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("trait.pov_witcher"))
			{
				vattghern_candidates.push(bro);
			}
		}

		if (vattghern_candidates.len() == 0)
		{
			return;
		}

		if (this.World.getTime().Days <= 10 && this.Math.rand(1, 100) < 60 || this.Math.rand(1, 100) > 40)
		{
			return;
		}

		// Default 1
		this.m.Score = 1;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/kill_rogue_vattghern_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		this.World.Contracts.addContract(contract);
	}

});

