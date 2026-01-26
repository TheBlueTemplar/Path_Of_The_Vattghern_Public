if (!("World" in ::Const))
{
    ::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
    ::Const.World.Spawn <- {};
}

// Mercs
this.Const.World.Spawn.Mercenaries.Troops.extend([
    {
        Weight = 3,
        MinR = 250,
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
                Cost = 30 //def 30
            }
        ]
    }
]);

this.Const.World.Spawn.BountyHunters.Troops.extend([
    {
        Weight = 2,
        MinR = 250,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 60
            }
        ]
    }
]);


