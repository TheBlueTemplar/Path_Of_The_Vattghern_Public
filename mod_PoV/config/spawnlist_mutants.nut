if (!("World" in ::Const))
{
	::Const.World <- {};
}

if (!("Spawn" in ::Const.World))
{
	::Const.World.Spawn <- {};
}

// Forsaken Bands
// Need to add mutant hounds here
::Const.World.Spawn.PovForsaken <- {
	Name = "PovForsaken",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 0.9,
	Body = "pov_figure_forsaken_01",
	MinR = 150,
	MaxR = 600,
	Troops = [	
		{
			// 95, 50
			Weight = 95,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovForsaken,
					Cost = 40
				}
			]
		},
		{
			// 5, 80
			Weight = 5,
			MinR = 500,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovForsaken_High,
					Cost = 70
				}
			]
		}	
	]
};

// Forsaken Contract (with "boss")
::Const.World.Spawn.PovForsakenBoss <- {
	Name = "PovForsakenBoss",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.1,
	VisionMult = 0.9,
	Body = "pov_figure_forsaken_01",
	MinR = 180,
	MaxR = 660,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.PovForsaken_Boss,
			Cost = 90,
			Weight = 0 //percentage chance after min count is met
		}
	],
	Troops = [	
		{
			// 93, 50
			Weight = 93,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovForsaken,
					Cost = 36
				}
			]
		},
		{
			// 7, 80
			Weight = 7,
			MinR = 500,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PovForsaken_High,
					Cost = 65
				}
			]
		}	
	]
};