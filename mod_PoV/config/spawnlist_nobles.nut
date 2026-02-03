if (!("World" in ::Const))
{
    ::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
    ::Const.World.Spawn <- {};
}

// CREATE NEW, CUSTOM LISTS

// EDIT EXISTING LISTS
// Noble Armies
this.Const.World.Spawn.Noble.Troops.extend([
    {
        Weight = 5,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.Mercenary,
                Cost = 28
            }
        ]
    },
    {
        Weight = 5,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.MercenaryRanged,
                Cost = 28
            }
        ]
    },
    {
        Weight = 2, //def 2
        MinR = 300,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 85 //def 85
            }
        ]
    },
    {
        Weight = 3, //def 3
        MinR = 325,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovGunnerKnight,
                Cost = 80 //def 80
            }
        ]
    }
]);

// Noble Caravans
this.Const.World.Spawn.NobleCaravan.Troops.extend([
    {
        Weight = 5,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.Mercenary,
                Cost = 28
            }
        ]
    },
    {
        Weight = 5,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.MercenaryRanged,
                Cost = 28
            }
        ]
    },
    {
        Weight = 2,
        MinR = 300,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 85
            }
        ]
    }
    {
        Weight = 2, //def 2
        MinR = 325,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovGunnerKnight,
                Cost = 80 //def 80
            }
        ]
    }
]);

// Caravan W/Mercs
this.Const.World.Spawn.MixedNobleCaravan.Troops.extend([
    {
        Weight = 2,
        MinR = 300,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovNobleSeer,
                Cost = 85
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
