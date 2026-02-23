if (!("World" in ::Const))
{
	::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
	::Const.World.Spawn <- {};
}

::Const.World.Spawn.HostileMercenariesQuest <-
{
	Name = "Hostile Mercenaries",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	MaxR = 700,
	MinR = 100,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.PovCompanyLeader,
			Cost = 15,
			Weight = 0
		},
		{
			Type = this.Const.World.Spawn.Troops.PovRogueVattghern,
			Cost = 25,
			Weight = 0
		}
	],
	Troops = [
		{// melee
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHiredBlade,
					Cost = 30 //30
				}
			]
		},
		{// gunners
			Weight = 9,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHiredGun, 
					Cost = 30 //30
				}
			]
		},
		{// ranged
			Weight = 18,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHeadhunter, 
					Cost = 30 //30
				}
			]
		},
		{//dawg
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 6
				}
			]
		},
		{// some cool strong shit yeah
			Weight = 5,
			Types =[
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 40 //40
				},
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 40 //40
				},
				{
					MinR = 400,
					Type = this.Const.World.Spawn.Troops.Assassin,
					Cost = 30 //30
				}
			]
		},
		{//magic n shiet
			Weight = 5,
			MinR = 500,
			Types = [
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.PovRogueSeer,
					Cost = 50 //50
				}
			]
		},
	]
}

::Const.World.Spawn.HostileMercenaries <-
{
	Name = "Hostile Mercenaries",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	MaxR = 700,
	MinR = 100,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.PovCompanyLeader,
			Cost = 15,
			Weight = 0
		}
	],
	Troops = [
		{// melee
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHiredBlade,
					Cost = 32 //32
				},
				{
					MaxR = 400,					
					Type = this.Const.World.Spawn.Troops.Mercenary,
					Cost = 25 //25
				}

			]
		},
		{// gunners
			Weight = 9,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHiredGun, 
					Cost = 32 //32
				},
				{
					MaxR = 400,
	                Type = this.Const.World.Spawn.Troops.PovMercenaryGunner,
	                Cost = 25 //25
	            }
			]
		},
		{// ranged
			Weight = 18,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovHeadhunter, 
					Cost = 32 //32
				},
				{
					MaxR = 400,
					Type = this.Const.World.Spawn.Troops.MercenaryRanged,
					Cost = 25 //25
				}
			]
		},
		{//dawg
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 6
				}
			]
		},
		{// some cool strong shit yeah
			Weight = 5,
			Types =[
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 45 //45
				},
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 45 //45
				},
				{
					MinR = 400,
					Type = this.Const.World.Spawn.Troops.Assassin,
					Cost = 35 //35
				}
			]
		},
		{//magic n shiet
			Weight = 5,
			MinR = 500,
			Types = [
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.PovRogueSeer,
					Cost = 55 //55
				}
			]
		},
	]
}

// Mercs
this.Const.World.Spawn.Mercenaries.Troops.extend([
    {
        Weight = 3,
        MinR = 350,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 60
            }
        ]
    },
    {
        Weight = 7, //def 7
        MinR = 125,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovMercenaryGunner,
                MaxR = 500
                Cost = 30 //def 30
            },
            {
                Type = this.Const.World.Spawn.Troops.PovHiredGun,
                MinR = 500
                Cost = 35 //def 30
            }
        ]
    },
    {
        Weight = 7, //def 7
        MinR = 500,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovHiredBlade,
                Cost = 35 //def 30
            }
        ]
    },
    {
        Weight = 6, //def 7
        MinR = 500,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovHeadhunter,
                Cost = 35 //def 30
            }
        ]
    }
]);

this.Const.World.Spawn.BountyHunters.Troops.extend([
    {
        Weight = 2,
        MinR = 550,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 60
            }
        ]
    }
]);