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
        MinR = 280,
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
        MinR = 280,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 60
            }
        ]
    }
]);

//Caravans (north) (south on different file - not edited now)
this.Const.World.Spawn.Caravan.MaxR = 375; // + 125
this.Const.World.Spawn.Caravan.Troops.extend([
    {
        Weight = 3,
        MinR = 350,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.Mercenary,
                Cost = 35
            }
        ]
    },
    {
        Weight = 3,
        MinR = 350,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.MercenaryRanged,
                Cost = 35
            }
        ]
    }
]);



