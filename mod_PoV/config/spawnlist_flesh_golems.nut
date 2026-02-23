if (!("World" in ::Const))
{
	::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
	::Const.World.Spawn <- {};
}

// Flesh Golems + Necros Quest Armo
// 1 Necro w/bodyguards + 1 Fault finder w/bodyguards
// 40% Zombies (30% Knights, 10% Betrayers)
// 50% Flesh Golems (35% Small, 15% Big)
::Const.World.Spawn.PovFleshNecroQuest <-
{
	Name = "PovFleshNecroQuest",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 800,
	MinR = 175,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 25,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Weight = 0,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					MaxR = 300,
					Cost = 10,
					function Weight(scale) {
						local c = 100 - (scale * 100);
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					MinR = 300,
					Cost = 20,
					function Weight(scale) {
						local c = 100 - ((1.0 - scale) * 100);
						return this.Math.min(100, c);
					}
				}
			]
		},
		{
			Type = this.Const.World.Spawn.Troops.FaultFinder,
			Cost = 25,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Weight = 0,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 12,
					function Weight(scale) {
						local c = 100 - (scale * 100);
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 12,
					function Weight(scale) {
						local c = 100 - (scale * 100);
						return this.Math.max(0, c);
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
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 25
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
					MaxGuards = 1,
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
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FaultFinder,
					Cost = 25,
					Roll = true
					MinGuards = 1,
					MaxGuards = 1,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
							Cost = 12,
							function Weight(scale) {
								local c = 100 - (scale * 100);
								return this.Math.max(0, c);
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
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
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 25
				}

			]
		},
		{
			Weight = 15,
			MinR = 700,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GreaterFleshGolem, 
					Cost = 65
				}
			]
		}
	]
};

::Const.World.Spawn.PovFleshGolems <-
{
	Name = "PovFleshGolems",
	IsDynamic = true,
	MovementSpeedMult = 0.7,
	VisibilityMult = 1.0,
	VisionMult = 0.7,
	Body = "pov_figure_fault_finder_01",
	MaxR = 600,
	MinR = 100,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.FaultFinder,
			Cost = 15,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Weight = 0,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 10,
					function Weight(scale) {
						local c = 100 - (scale * 100);
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 10,
					function Weight(scale) {
						local c = 100 - (scale * 100);
						return this.Math.max(0, c);
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 80,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LesserFleshGolem,
					Cost = 20
				}

			]
		},
		{
			Weight = 20,
			MinR = 700,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GreaterFleshGolem, 
					Cost = 65
				}
			]
		}
	]
}