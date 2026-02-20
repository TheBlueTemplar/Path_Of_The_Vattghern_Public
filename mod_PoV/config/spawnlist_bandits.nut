if (!("World" in ::Const))
{
    ::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
    ::Const.World.Spawn <- {};
}

// Bandit Armies ('boss' - contract only)
this.Const.World.Spawn.BanditArmy.Troops.extend([
    {
        Weight = 7,
        MinR = 175,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 20
            }
        ]
    },
    {
        Weight = 3,
        MinR = 375,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 75
            }
        ]
    }
]);

// Bandit Boss (idk wut dat iz)
this.Const.World.Spawn.BanditBoss.Troops.extend([
    {
        Weight = 5,
        MinR = 175,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 20
            }
        ]
    },
    {
        Weight = 3,
        MinR = 350,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 75
            }
        ]
    }
]);

// Bandit Defenders
this.Const.World.Spawn.BanditDefenders.Troops.extend([
    {
        Weight = 4,
        MinR = 175,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 25
            }
        ]
    },
    {
        Weight = 2,
        MinR = 350,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 80
            }
        ]
    }
]);

// Bandit Raiders (Use this to test -> Return Item Contract)
this.Const.World.Spawn.BanditRaiders.Troops.extend([
    {
        Weight = 4, // def 4
        MinR = 200,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 25 // def 25
            }
        ]
    },
    {
        Weight = 2, // def 2
        MinR = 400,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 80 // def 80
            }
        ]
    }/*,
    {
        Weight = 50, // def 0 TEST ONLY
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.Direwolf,
                Cost = 20 // def 80
            }
        ]
    }*/
]);

// Bandit Scouts
this.Const.World.Spawn.BanditScouts.Troops.extend([
    {
        Weight = 4, // def 4
        MinR = 200,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 25 // def 25
            }
        ]
    },
    {
        Weight = 1, // def 1
        MinR = 370,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovRogueSeer,
                Cost = 80 // def 80
            }
        ]
    }
]);

// Bandit Hunters (Early game shit, empty for now)
this.Const.World.Spawn.BanditRoamers.Troops.extend([
    {
        Weight = 3, // def 4
        MinR = 200,
        Types = [
            {
                Type = this.Const.World.Spawn.Troops.PovBanditGunner,
                Cost = 28 // def 28
            }
        ]
    }
]);

