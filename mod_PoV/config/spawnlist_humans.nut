if (!("World" in ::Const))
{
    ::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
    ::Const.World.Spawn <- {};
}


//Caravans (north) (south on different file - not edited now)
this.Const.World.Spawn.Caravan.MaxR = 375; // + 125
this.Const.World.Spawn.Caravan.Troops.extend([
    {
        Weight = 3,
        MinR = 400,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.Mercenary,
                Cost = 35
            }
        ]
    },
    {
        Weight = 3,
        MinR = 400,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.MercenaryRanged,
                Cost = 35
            }
        ]
    }
]);



