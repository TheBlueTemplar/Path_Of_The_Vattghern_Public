if (!("World" in ::Const))
{
    ::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
    ::Const.World.Spawn <- {};
}

// CREATE NEW, CUSTOM LISTS
::Const.World.Spawn.PovGhosts <-
{
    Name = "PovGhosts",
    IsDynamic = true,
    MovementSpeedMult = 0.9,
    VisibilityMult = 0.8,
    VisionMult = 0.9,
    Body = "figure_zombie_01",
    MaxR = 480,
    MinR = 110,
    Fixed = [
        {
            Type = this.Const.World.Spawn.Troops.SwordGhost,
            Cost = 25,
            Weight = 0,
        },
        {
            Type = this.Const.World.Spawn.Troops.ArmorGhost,
            Cost = 45,
            Weight = 0,
        },
        {
            Type = this.Const.World.Spawn.Troops.PossessedWitchhunter,
            Cost = 20,
            Weight = 0,
        }
    ],
    Troops = [ // should be 42,27,11,6,9,5 (when you add soldiers)
        {
            Weight = 42,
            Types = [ // defaults: 15, 16, 18, 25, 60, 24
                {
                    Type = this.Const.World.Spawn.Troops.PossessedBanditRaider,
                    Cost = 15
                },
                {
                    Type = this.Const.World.Spawn.Troops.PossessedFootman,
                    Cost = 16
                },
                {
                    Type = this.Const.World.Spawn.Troops.PossessedBillman,
                    Cost = 18
                },
                {
                    Type = this.Const.World.Spawn.Troops.PossessedArbalester,
                    Cost = 25
                },
                {
                    Type = this.Const.World.Spawn.Troops.PossessedGreatsword,
                    MinR = 550,
                    Cost = 60
                },
                {
                    Type = this.Const.World.Spawn.Troops.PossessedMercenary,
                    Cost = 24
                }
            ]
        },
        {
            Weight = 27,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Ghost,
                    Cost = 20
                }
            ]
        },
         {
            Weight = 11,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 250,
                    Cost = 30
                }
            ]
        },
         {
            Weight = 6,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 400,
                    Cost = 50
                }
            ]
        },
        {
            Weight = 9,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendDemonHound,
                    MinR = 200,
                    Cost = 25
                }
            ]
        },
        {
            Weight = 5,
            MinR = 700,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendBanshee,
                    Cost = 65
                }
            ]
        }
    ]
};
// EDIT EXISTING LISTS

// TEST with 40 weight, 10 Cost, 50 minR
// Def Values are respectively 2, 125, 45 (change to 2?, 125, 45 -  and 275 , 55)
this.Const.World.Spawn.Zombies.Troops.extend([
    {
        Weight = 2,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.SwordGhost,
                MinR = 350,
                Cost = 45
            }
        ]
    },
    {
        Weight = 2,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.ArmorGhost,
                MinR = 675,
                Cost = 60
            }
        ]
    }
]);

// REPLACE LISTS
::Const.World.Spawn.ZombiesAndGhosts =
{
    Name = "ZombiesAndGhosts",
    IsDynamic = true,
    MovementSpeedMult = 0.8,
    VisibilityMult = 1.0,
    VisionMult = 0.8,
    Body = "figure_zombie_01",
    MaxR = 441,
    MinR = 54,
    Troops = [
        {
            Weight = 15,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Zombie,
                    Cost = 5
                }
            ]
        },
        {
            Weight = 60,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieYeoman,
                    MinR = 200,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnight,
                    MinR = 400,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieBetrayer,
                    MinR = 1200,
                    Cost = 65
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Ghost,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendDemonHound,
                    MinR = 400,
                    Cost = 25
                }
            ]
        },
        {
            Weight = 5,
            MinR = 800,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendBanshee,
                    Cost = 70
                }
            ]
        }, 
        { // PoV Additions
            Weight = 7,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 250,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 500,
                    Cost = 55
                }
            ]
        }
    ]
};

::Const.World.Spawn.ZombiesOrZombiesAndGhosts =
{
    Name = "ZombiesOrZombiesAndGhosts",
    IsDynamic = true,
    MovementSpeedMult = 0.8,
    VisibilityMult = 1.0,
    VisionMult = 0.8,
    Body = "figure_zombie_01",
    MaxR = 441,
    MinR = 54,
    Troops = [
        {
            Weight = 15,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Zombie,
                    Cost = 5
                }
            ]
        },
        {
            Weight = 60,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieYeoman,
                    MinR = 200,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnight,
                    MinR = 400,
                    Cost = 40
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieBetrayer,
                    MinR = 1200,
                    Cost = 65
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Ghost,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendDemonHound,
                    MinR = 400,
                    Cost = 25
                }
            ]
        },
        {
            Weight = 5,
            MinR = 800,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendBanshee,
                    Cost = 70
                }
            ]
        },
        { // PoV Additions
            Weight = 7,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 250,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 500,
                    Cost = 55
                }
            ]
        }
    ]
};

::Const.World.Spawn.Ghosts =
{
    Name = "Ghosts",
    IsDynamic = true,
    MovementSpeedMult = 0.8,
    VisibilityMult = 1.0,
    VisionMult = 0.8,
    Body = "figure_zombie_01",
    MaxR = 460,
    MinR = 80,
    Troops = [
        {
            Weight = 70,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Ghost,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendDemonHound,
                    MinR = 300,
                    Cost = 25
                }
            ]
        },
        {
            Weight = 10,
            MinR = 800,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendBanshee,
                    Cost = 70
                }
            ]
        },
        {
            Weight = 16,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 350,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 12,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 550,
                    Cost = 55
                }
            ]
        }
    ]
};

::Const.World.Spawn.Necromancer =
{
    Name = "Necromancer",
    IsDynamic = true,
    MovementSpeedMult = 0.8,
    VisibilityMult = 1.0,
    VisionMult = 0.8,
    Body = "figure_zombie_01",
    MaxR = 706,
    MinR = 102,
    Fixed = [
        {
            Type = this.Const.World.Spawn.Troops.Necromancer,
            Cost = 30,
            MinGuards = 1,
            MaxGuards = 2,
            MaxGuardsWeight = 25,
            Weight = 0,
            Guards = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieBodyguard,
                    MaxR = 200,
                    Cost = 6,
                    function Weight(scale) {
                        local c = 100 - (scale * 100);
                        return this.Math.max(0, c);
                    }
                },
                {
                    Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
                    MinR = 200,
                    Cost = 12,
                    function Weight(scale) {
                        local c = 100 - (scale * 100);
                        return this.Math.max(0, c);
                    }
                },
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
                    MinR = 400,
                    Cost = 25,
                    function Weight(scale) {
                        local c = 100 - ((1.0 - scale) * 100);
                        return this.Math.min(100, c);
                    }
                }
            ]
        }
    ],
    Troops = [
        {
            Weight = 20,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Zombie,
                    Cost = 5
                }
            ]
        },
        {
            Weight = 65,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieYeoman,
                    MinR = 200,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnight,
                    MinR = 400,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 10,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieBetrayer,
                    MinR = 1200,
                    Cost = 65
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Necromancer,
                    Cost = 30,
                    Roll = true
                    MinGuards = 1,
                    MaxGuards = 2,
                    MaxGuardsWeight = 50,
                    Guards = [
                        {
                            Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
                            Cost = 12,
                            function Weight(scale) {
                                local c = 100 - (scale * 100);
                                return this.Math.max(0, c);
                            }
                        },
                        {
                            Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
                            Cost = 25,
                            function Weight(scale) {
                                local c = 100 - ((1.0 - scale) * 100);
                                return this.Math.min(100, c);
                            }
                        }
                    ]
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Ghost,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendDemonHound,
                    MinR = 400,
                    Cost = 25
                }
            ]
        },
        {
            Weight = 2,
            MinR = 800,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.LegendBanshee,
                    Cost = 70
                }
            ]
        }
        {
            Weight = 6,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 250,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 500,
                    Cost = 55
                }
            ]
        }
    ]
};

::Const.World.Spawn.NecromancerSouthern =
{
    Name = "NecromancerSouthern",
    IsDynamic = true,
    MovementSpeedMult = 0.8,
    VisibilityMult = 1.0,
    VisionMult = 0.8,
    Body = "figure_zombie_04",
    MaxR = 706,
    MinR = 102,
    Fixed = [
        {
            Type = this.Const.World.Spawn.Troops.Necromancer,
            Cost = 30,
            MinGuards = 1,
            MaxGuards = 2,
            MaxGuardsWeight = 25,
            Weight = 0,
            Guards = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
                    MinR = 200,
                    Cost = 6,
                    function Weight(scale) {
                        local c = 100 - (scale * 100);
                        return this.Math.max(0, c);
                    }
                },
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
                    MinR = 400,
                    Cost = 24,
                    function Weight(scale) {
                        local c = 100 - ((1.0 - scale) * 100);
                        return this.Math.min(100, c);
                    }
                }
            ]
        }
    ],
    Troops = [
        {
            Weight = 30,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieNomad,
                    Cost = 10
                }
            ]
        },
        {
            Weight = 20,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieYeoman,
                    Cost = 10
                }
            ]
        },
        {
            Weight = 14,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
                    MinR = 250,
                    Cost = 20
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieKnight,
                    MinR = 400,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieBetrayer,
                    MinR = 1200,
                    Cost = 65
                }
            ]
        },
        {
            Weight = 5,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.Necromancer,
                    Cost = 30,
                    Roll = true
                    MinGuards = 1,
                    MaxGuards = 2,
                    MaxGuardsWeight = 50,
                    Guards = [
                        {
                            Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
                            Cost = 6,
                            function Weight(scale) {
                                local c = 100 - (scale * 100);
                                return this.Math.max(0, c);
                            }
                        },
                        {
                            Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
                            Cost = 24,
                            function Weight(scale) {
                                local c = 100 - ((1.0 - scale) * 100);
                                return this.Math.min(100, c);
                            }
                        }
                    ]
                }
            ]
        },
        {
            Weight = 6,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.SwordGhost,
                    MinR = 250,
                    Cost = 30
                }
            ]
        },
        {
            Weight = 4,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ArmorGhost,
                    MinR = 500,
                    Cost = 55
                }
            ]
        },
        {
            Weight = 20,
            Types = [
                {
                    Type = this.Const.World.Spawn.Troops.ZombieTreasureHunter,
                    MinR = 300,
                    Cost = 25
                }
            ]
        }
    ]
};