local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

// YRDEN SIGN
gt.Const.Tactical.YrdenSigilParticles <- [
	{
		Delay = 0,
		Quantity = 20,            // lower budget = less stacking
		LifeTimeQuantity = 0,
		SpawnRate = 1,            // keep 1; we’ll make each “sigil particle” last longer
		Brushes = [ "pov_yrden_floor" ],
		Stages = [
			// BRIGHT phase (longer)
			{
				LifeTimeMin = 3.2,
				LifeTimeMax = 4.2,

				// brighter / more magenta range
				ColorMin = this.createColor("#a85cff"),
				ColorMax = this.createColor("#6a1fb0"),

				ScaleMin = 0.98,
				ScaleMax = 1.03,

				RotationMin = 0,
				RotationMax = 0,
				TorqueMin = 0,
				TorqueMax = 0,

				VelocityMin = 0,
				VelocityMax = 0,

				SpawnOffsetMin = this.createVec(0, 0),
				SpawnOffsetMax = this.createVec(0, 0),

				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0),

				FlickerEffect = false
			},
			// DIM phase (slow fade down)
			{
				LifeTimeMin = 2.6,
				LifeTimeMax = 3.8,

				// deeper purple / bluish variance
				ColorMin = this.createColor("#3a0a66"),
				ColorMax = this.createColor("#5a14a8"),

				ScaleMin = 0.96,
				ScaleMax = 1.00,

				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0),
				FlickerEffect = false
			},
			// FADE OUT (very smooth)
			{
				LifeTimeMin = 1.6,
				LifeTimeMax = 2.2,

				// push toward near-invisible
				ColorMin = this.createColor("#22003d"),
				ColorMax = this.createColor("#3b0a6b"),

				ScaleMin = 0.96,
				ScaleMax = 0.99,

				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0),
				FlickerEffect = false
			}
		]
	}
];

// IGNI SIGN

// Wide sweep variants (single big cone-like burst)
// Keep two versions like vanilla FireLance: screen-right and screen-left
gt.Const.Tactical.FireSweepRightParticles <- [
    {
        Delay = 100,
        Quantity = 320,              // a bit denser than FireLance
        LifeTimeQuantity = 320,
        SpawnRate = 320,
        Brushes = [
            "effect_fire_01",
            "effect_fire_02",
            "effect_fire_03"
        ],
        Stages = [
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.1,
                ColorMin = this.createColor("ffe7cf00"),
                ColorMax = this.createColor("ffeacf00"),
                ScaleMin = 0.6,
                ScaleMax = 0.95,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,

                // WIDER fan than ±0.1
                DirectionMin = this.createVec(1.0, -0.65),
                DirectionMax = this.createVec(1.0,  0.65),

                // Wider emission line (Y spread), keep X roughly similar
                SpawnOffsetMin = this.createVec(8, -19),
				SpawnOffsetMax = this.createVec(17, 19),

                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.45,
                ColorMin = this.createColor("ff813dff"),
                ColorMax = this.createColor("fec19fff"),
                ScaleMin = 0.6,
                ScaleMax = 0.95,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,

                DirectionMin = this.createVec(1.0, -0.55),
                DirectionMax = this.createVec(1.0,  0.55),

                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.45,
                ColorMin = this.createColor("fc6a52f0"),
                ColorMax = this.createColor("fcaa52f0"),
                ScaleMin = 0.85,
                ScaleMax = 1.15,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,
                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.25,
                ColorMin = this.createColor("d8380000"),
                ColorMax = this.createColor("d8380000"),
                ScaleMin = 0.85,
                ScaleMax = 1.15,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,
                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            }
        ]
    },
    {
        Delay = 200,
        Quantity = 70,               // a bit more ash for "sweep"
        LifeTimeQuantity = 70,
        SpawnRate = 26,
        Brushes = [ "ash_01" ],
        Stages = [
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.25,
                ColorMin = this.createColor("ffffff00"),
                ColorMax = this.createColor("ffffff00"),
                ScaleMin = 0.5,
                ScaleMax = 0.6,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 55,
                VelocityMax = 110,

                DirectionMin = this.createVec(1.0, -0.65),
                DirectionMax = this.createVec(1.0,  0.65),

                SpawnOffsetMin = this.createVec(-17, -19),
				SpawnOffsetMax = this.createVec(-8,  19),
            },
            {
                LifeTimeMin = 2.0,
                LifeTimeMax = 3.2,
                ColorMin = this.createColor("ffffffff"),
                ColorMax = this.createColor("ffffffff"),
                ScaleMin = 0.5,
                ScaleMax = 0.8,
                VelocityMin = 55,
                VelocityMax = 110,
                ForceMin = this.createVec(0, 30),
                ForceMax = this.createVec(0, 45)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.35,
                ColorMin = this.createColor("ffffff00"),
                ColorMax = this.createColor("ffffff00"),
                ScaleMin = 0.75,
                ScaleMax = 1.05,
                VelocityMin = 0,
                VelocityMax = 0,
                ForceMin = this.createVec(0, 30),
                ForceMax = this.createVec(0, 45)
            }
        ]
    }
];

gt.Const.Tactical.FireSweepLeftParticles <- [
    {
        Delay = 100,
        Quantity = 320,
        LifeTimeQuantity = 320,
        SpawnRate = 320,
        Brushes = [
            "effect_fire_01",
            "effect_fire_02",
            "effect_fire_03"
        ],
        Stages = [
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.1,
                ColorMin = this.createColor("ffe7cf00"),
                ColorMax = this.createColor("ffeacf00"),
                ScaleMin = 0.6,
                ScaleMax = 0.95,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,

                // Same wide fan, but X is negative (screen-left)
                DirectionMin = this.createVec(-1.0, -0.55),
                DirectionMax = this.createVec(-1.0,  0.55),

                SpawnOffsetMin = this.createVec(-32, -18),
                SpawnOffsetMax = this.createVec(-18,  18),

                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.45,
                ColorMin = this.createColor("ff813dff"),
                ColorMax = this.createColor("fec19fff"),
                ScaleMin = 0.6,
                ScaleMax = 0.95,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,

                DirectionMin = this.createVec(-1.0, -0.55),
                DirectionMax = this.createVec(-1.0,  0.55),

                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.45,
                ColorMin = this.createColor("fc6a52f0"),
                ColorMax = this.createColor("fcaa52f0"),
                ScaleMin = 0.85,
                ScaleMax = 1.15,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,
                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            },
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.25,
                ColorMin = this.createColor("d8380000"),
                ColorMax = this.createColor("d8380000"),
                ScaleMin = 0.85,
                ScaleMax = 1.15,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 180,
                VelocityMax = 320,
                ForceMin = this.createVec(0, 70),
                ForceMax = this.createVec(0, 70)
            }
        ]
    },
    {
        Delay = 200,
        Quantity = 70,
        LifeTimeQuantity = 70,
        SpawnRate = 26,
        Brushes = [ "ash_01" ],
        Stages = [
            {
                LifeTimeMin = 0.1,
                LifeTimeMax = 0.25,
                ColorMin = this.createColor("ffffff00"),
                ColorMax = this.createColor("ffffff00"),
                ScaleMin = 0.5,
                ScaleMax = 0.6,
                RotationMin = 0,
                RotationMax = 359,
                VelocityMin = 55,
                VelocityMax = 110,

                DirectionMin = this.createVec(-1.0, -0.45),
                DirectionMax = this.createVec(-1.0,  0.45),

                SpawnOffsetMin = this.createVec(-28, -16),
                SpawnOffsetMax = this.createVec(-14,  16)
            },
            {
                LifeTimeMin = 2.0,
                LifeTimeMax = 3.2,
                ColorMin = this.createColor("ffffffff"),
                ColorMax = this.createColor("ffffffff"),
                ScaleMin = 0.5,
                ScaleMax = 0.8,
                VelocityMin = 55,
                VelocityMax = 110,
                ForceMin = this.createVec(0, 30),
                ForceMax = this.createVec(0, 45)
            },
            {
                LifeTimeMin = 0.2,
                LifeTimeMax = 0.35,
                ColorMin = this.createColor("ffffff00"),
                ColorMax = this.createColor("ffffff00"),
                ScaleMin = 0.75,
                ScaleMax = 1.05,
                VelocityMin = 0,
                VelocityMax = 0,
                ForceMin = this.createVec(0, 30),
                ForceMax = this.createVec(0, 45)
            }
        ]
    }
];

gt.Const.Tactical.FireSweepBottomParticles <- [
	{
		Delay = 100,
		Quantity = 320,
		LifeTimeQuantity = 320,
		SpawnRate = 320,
		Brushes = [
			"effect_fire_01",
			"effect_fire_02",
			"effect_fire_03"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.1,
				ColorMin = this.createColor("ffe7cf00"),
				ColorMax = this.createColor("ffeacf00"),
				ScaleMin = 0.6,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,

				// Rotated from (±1.0, yFan) -> (xFan, -1.0)
				DirectionMin = this.createVec(-0.65, -1.0),
				DirectionMax = this.createVec( 0.65, -1.0),

				// Rotated "2..7 close" from X into Y (negative)
				// and rotated width from Y into X
				SpawnOffsetMin = this.createVec(-19, -7),
				SpawnOffsetMax = this.createVec( 19, -2),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.45,
				ColorMin = this.createColor("ff813dff"),
				ColorMax = this.createColor("fec19fff"),
				ScaleMin = 0.6,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,

				DirectionMin = this.createVec(-0.65, -1.0),
				DirectionMax = this.createVec( 0.65, -1.0),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.45,
				ColorMin = this.createColor("fc6a52f0"),
				ColorMax = this.createColor("fcaa52f0"),
				ScaleMin = 0.85,
				ScaleMax = 1.15,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.25,
				ColorMin = this.createColor("d8380000"),
				ColorMax = this.createColor("d8380000"),
				ScaleMin = 0.85,
				ScaleMax = 1.15,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 200,
		Quantity = 70,
		LifeTimeQuantity = 70,
		SpawnRate = 26,
		Brushes = [
			"ash_01"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.25,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.6,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 55,
				VelocityMax = 110,

				DirectionMin = this.createVec(-0.45, -1.0),
				DirectionMax = this.createVec( 0.45, -1.0),

				SpawnOffsetMin = this.createVec(-16, -7),
				SpawnOffsetMax = this.createVec( 16, -2)
			},
			{
				LifeTimeMin = 2.0,
				LifeTimeMax = 3.2,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 0.5,
				ScaleMax = 0.8,
				VelocityMin = 55,
				VelocityMax = 110,
				ForceMin = this.createVec(0, 30),
				ForceMax = this.createVec(0, 45)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.35,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.05,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 30),
				ForceMax = this.createVec(0, 45)
			}
		]
	}
];

gt.Const.Tactical.FireSweepTopParticles <- [
	{
		Delay = 100,
		Quantity = 320,
		LifeTimeQuantity = 320,
		SpawnRate = 320,
		Brushes = [
			"effect_fire_01",
			"effect_fire_02",
			"effect_fire_03"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.1,
				ColorMin = this.createColor("ffe7cf00"),
				ColorMax = this.createColor("ffeacf00"),
				ScaleMin = 0.6,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,

				DirectionMin = this.createVec(-0.65,  1.0),
				DirectionMax = this.createVec( 0.65,  1.0),

				SpawnOffsetMin = this.createVec(-19, 2),
				SpawnOffsetMax = this.createVec( 19, 7),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.45,
				ColorMin = this.createColor("ff813dff"),
				ColorMax = this.createColor("fec19fff"),
				ScaleMin = 0.6,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,

				DirectionMin = this.createVec(-0.65,  1.0),
				DirectionMax = this.createVec( 0.65,  1.0),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.45,
				ColorMin = this.createColor("fc6a52f0"),
				ColorMax = this.createColor("fcaa52f0"),
				ScaleMin = 0.85,
				ScaleMax = 1.15,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.25,
				ColorMin = this.createColor("d8380000"),
				ColorMax = this.createColor("d8380000"),
				ScaleMin = 0.85,
				ScaleMax = 1.15,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 180,
				VelocityMax = 320,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 200,
		Quantity = 70,
		LifeTimeQuantity = 70,
		SpawnRate = 26,
		Brushes = [
			"ash_01"
		],
		Stages = [
			{
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.25,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.6,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 55,
				VelocityMax = 110,

				DirectionMin = this.createVec(-0.45,  1.0),
				DirectionMax = this.createVec( 0.45,  1.0),

				SpawnOffsetMin = this.createVec(-16, 2),
				SpawnOffsetMax = this.createVec( 16, 7)
			},
			{
				LifeTimeMin = 2.0,
				LifeTimeMax = 3.2,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 0.5,
				ScaleMax = 0.8,
				VelocityMin = 55,
				VelocityMax = 110,
				ForceMin = this.createVec(0, 30),
				ForceMax = this.createVec(0, 45)
			},
			{
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.35,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.05,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 30),
				ForceMax = this.createVec(0, 45)
			}
		]
	}
];


// AARD / "AIR" SWEEP (gray-blue, dusty, faster, slightly less dense)

// RIGHT
gt.Const.Tactical.AirSweepRightParticles <- [
	{
		Delay = 60,                 // 100 -> 60 (faster)
		Quantity = 220,             // 240 -> 220 (slightly less dense)
		LifeTimeQuantity = 220,
		SpawnRate = 260,            // quicker burst feel (more instantaneous)
		Brushes = [ "effect_fire_01", "effect_fire_02", "effect_fire_03" ],
		Stages = [
			{
				LifeTimeMin = 0.06,
				LifeTimeMax = 0.10,

				// gray-blue highlights
				ColorMin = this.createColor("#9bb3c6"),
				ColorMax = this.createColor("#6f8ea8"),

				ScaleMin = 0.55,
				ScaleMax = 0.90,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,     // faster
				VelocityMax = 380,

				DirectionMin = this.createVec(1.0, -0.65),
				DirectionMax = this.createVec(1.0,  0.65),

				SpawnOffsetMin = this.createVec(8, -19),
				SpawnOffsetMax = this.createVec(17, 19),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.22,

				ColorMin = this.createColor("#4f6f8f"),
				ColorMax = this.createColor("#7fa3bd"),

				ScaleMin = 0.55,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,

				DirectionMin = this.createVec(1.0, -0.55),
				DirectionMax = this.createVec(1.0,  0.55),

				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.20,

				ColorMin = this.createColor("#b8c7d6"),
				ColorMax = this.createColor("#86a6bf"),

				ScaleMin = 0.80,
				ScaleMax = 1.10,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 210,
				VelocityMax = 360,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.08,
				LifeTimeMax = 0.18,

				// smoky tail (blue-gray)
				ColorMin = this.createColor("#2a3645"),
				ColorMax = this.createColor("#2a3645"),

				ScaleMin = 0.90,
				ScaleMax = 1.25,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 200,
				VelocityMax = 340,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 120,                // 200 -> 120 (dust comes quicker)
		Quantity = 140,             // dustier
		LifeTimeQuantity = 140,
		SpawnRate = 55,             // more dust puffs but short-lived
		Brushes = [ "ash_01" ],
		Stages = [
			{
				LifeTimeMin = 0.12,
				LifeTimeMax = 0.28,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.55,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 140,

				DirectionMin = this.createVec(1.0, -0.65),
				DirectionMax = this.createVec(1.0,  0.65),

				SpawnOffsetMin = this.createVec(-17, -19),
				SpawnOffsetMax = this.createVec(-8,  19)
			},
			{
				LifeTimeMin = 1.2,      // shorter linger (faster overall)
				LifeTimeMax = 2.0,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#c9d6e2"),
				ScaleMin = 0.60,
				ScaleMax = 0.95,
				VelocityMin = 50,
				VelocityMax = 120,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			},
			{
				LifeTimeMin = 0.18,
				LifeTimeMax = 0.30,
				ColorMin = this.createColor("#aebfd0"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.85,
				ScaleMax = 1.20,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			}
		]
	}
];

// LEFT (same colors/speeds, mirrored direction + offsets)
gt.Const.Tactical.AirSweepLeftParticles <- [
	{
		Delay = 60,
		Quantity = 220,
		LifeTimeQuantity = 220,
		SpawnRate = 260,
		Brushes = [ "effect_fire_01", "effect_fire_02", "effect_fire_03" ],
		Stages = [
			{
				LifeTimeMin = 0.06,
				LifeTimeMax = 0.10,
				ColorMin = this.createColor("#9bb3c6"),
				ColorMax = this.createColor("#6f8ea8"),
				ScaleMin = 0.55,
				ScaleMax = 0.90,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-1.0, -0.55),
				DirectionMax = this.createVec(-1.0,  0.55),
				SpawnOffsetMin = this.createVec(-32, -18),
				SpawnOffsetMax = this.createVec(-18,  18),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.22,
				ColorMin = this.createColor("#4f6f8f"),
				ColorMax = this.createColor("#7fa3bd"),
				ScaleMin = 0.55,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-1.0, -0.55),
				DirectionMax = this.createVec(-1.0,  0.55),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.20,
				ColorMin = this.createColor("#b8c7d6"),
				ColorMax = this.createColor("#86a6bf"),
				ScaleMin = 0.80,
				ScaleMax = 1.10,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 210,
				VelocityMax = 360,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.08,
				LifeTimeMax = 0.18,
				ColorMin = this.createColor("#2a3645"),
				ColorMax = this.createColor("#2a3645"),
				ScaleMin = 0.90,
				ScaleMax = 1.25,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 200,
				VelocityMax = 340,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 120,
		Quantity = 140,
		LifeTimeQuantity = 140,
		SpawnRate = 55,
		Brushes = [ "ash_01" ],
		Stages = [
			{
				LifeTimeMin = 0.12,
				LifeTimeMax = 0.28,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.55,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 140,
				DirectionMin = this.createVec(-1.0, -0.45),
				DirectionMax = this.createVec(-1.0,  0.45),
				SpawnOffsetMin = this.createVec(-28, -16),
				SpawnOffsetMax = this.createVec(-14,  16)
			},
			{
				LifeTimeMin = 1.2,
				LifeTimeMax = 2.0,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#c9d6e2"),
				ScaleMin = 0.60,
				ScaleMax = 0.95,
				VelocityMin = 50,
				VelocityMax = 120,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			},
			{
				LifeTimeMin = 0.18,
				LifeTimeMax = 0.30,
				ColorMin = this.createColor("#aebfd0"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.85,
				ScaleMax = 1.20,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			}
		]
	}
];

// BOTTOM (same parameters, rotated directions/offsets preserved from your originals)
gt.Const.Tactical.AirSweepBottomParticles <- [
	{
		Delay = 60,
		Quantity = 220,
		LifeTimeQuantity = 220,
		SpawnRate = 260,
		Brushes = [ "effect_fire_01", "effect_fire_02", "effect_fire_03" ],
		Stages = [
			{
				LifeTimeMin = 0.06,
				LifeTimeMax = 0.10,
				ColorMin = this.createColor("#9bb3c6"),
				ColorMax = this.createColor("#6f8ea8"),
				ScaleMin = 0.55,
				ScaleMax = 0.90,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-0.65, -1.0),
				DirectionMax = this.createVec( 0.65, -1.0),
				SpawnOffsetMin = this.createVec(-19, -7),
				SpawnOffsetMax = this.createVec( 19, -2),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.22,
				ColorMin = this.createColor("#4f6f8f"),
				ColorMax = this.createColor("#7fa3bd"),
				ScaleMin = 0.55,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-0.65, -1.0),
				DirectionMax = this.createVec( 0.65, -1.0),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.20,
				ColorMin = this.createColor("#b8c7d6"),
				ColorMax = this.createColor("#86a6bf"),
				ScaleMin = 0.80,
				ScaleMax = 1.10,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 210,
				VelocityMax = 360,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.08,
				LifeTimeMax = 0.18,
				ColorMin = this.createColor("#2a3645"),
				ColorMax = this.createColor("#2a3645"),
				ScaleMin = 0.90,
				ScaleMax = 1.25,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 200,
				VelocityMax = 340,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 120,
		Quantity = 140,
		LifeTimeQuantity = 140,
		SpawnRate = 55,
		Brushes = [ "ash_01" ],
		Stages = [
			{
				LifeTimeMin = 0.12,
				LifeTimeMax = 0.28,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.55,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 140,
				DirectionMin = this.createVec(-0.45, -1.0),
				DirectionMax = this.createVec( 0.45, -1.0),
				SpawnOffsetMin = this.createVec(-16, -7),
				SpawnOffsetMax = this.createVec( 16, -2)
			},
			{
				LifeTimeMin = 1.2,
				LifeTimeMax = 2.0,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#c9d6e2"),
				ScaleMin = 0.60,
				ScaleMax = 0.95,
				VelocityMin = 50,
				VelocityMax = 120,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			},
			{
				LifeTimeMin = 0.18,
				LifeTimeMax = 0.30,
				ColorMin = this.createColor("#aebfd0"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.85,
				ScaleMax = 1.20,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			}
		]
	}
];

// TOP
gt.Const.Tactical.AirSweepTopParticles <- [
	{
		Delay = 60,
		Quantity = 220,
		LifeTimeQuantity = 220,
		SpawnRate = 260,
		Brushes = [ "effect_fire_01", "effect_fire_02", "effect_fire_03" ],
		Stages = [
			{
				LifeTimeMin = 0.06,
				LifeTimeMax = 0.10,
				ColorMin = this.createColor("#9bb3c6"),
				ColorMax = this.createColor("#6f8ea8"),
				ScaleMin = 0.55,
				ScaleMax = 0.90,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-0.65,  1.0),
				DirectionMax = this.createVec( 0.65,  1.0),
				SpawnOffsetMin = this.createVec(-19, 2),
				SpawnOffsetMax = this.createVec( 19, 7),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.22,
				ColorMin = this.createColor("#4f6f8f"),
				ColorMax = this.createColor("#7fa3bd"),
				ScaleMin = 0.55,
				ScaleMax = 0.95,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 220,
				VelocityMax = 380,
				DirectionMin = this.createVec(-0.65,  1.0),
				DirectionMax = this.createVec( 0.65,  1.0),
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.10,
				LifeTimeMax = 0.20,
				ColorMin = this.createColor("#b8c7d6"),
				ColorMax = this.createColor("#86a6bf"),
				ScaleMin = 0.80,
				ScaleMax = 1.10,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 210,
				VelocityMax = 360,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			},
			{
				LifeTimeMin = 0.08,
				LifeTimeMax = 0.18,
				ColorMin = this.createColor("#2a3645"),
				ColorMax = this.createColor("#2a3645"),
				ScaleMin = 0.90,
				ScaleMax = 1.25,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 200,
				VelocityMax = 340,
				ForceMin = this.createVec(0, 70),
				ForceMax = this.createVec(0, 70)
			}
		]
	},
	{
		Delay = 120,
		Quantity = 140,
		LifeTimeQuantity = 140,
		SpawnRate = 55,
		Brushes = [ "ash_01" ],
		Stages = [
			{
				LifeTimeMin = 0.12,
				LifeTimeMax = 0.28,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.55,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 140,
				DirectionMin = this.createVec(-0.45,  1.0),
				DirectionMax = this.createVec( 0.45,  1.0),
				SpawnOffsetMin = this.createVec(-16, 2),
				SpawnOffsetMax = this.createVec( 16, 7)
			},
			{
				LifeTimeMin = 1.2,
				LifeTimeMax = 2.0,
				ColorMin = this.createColor("#c9d6e2"),
				ColorMax = this.createColor("#c9d6e2"),
				ScaleMin = 0.60,
				ScaleMax = 0.95,
				VelocityMin = 50,
				VelocityMax = 120,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			},
			{
				LifeTimeMin = 0.18,
				LifeTimeMax = 0.30,
				ColorMin = this.createColor("#aebfd0"),
				ColorMax = this.createColor("#aebfd0"),
				ScaleMin = 0.85,
				ScaleMax = 1.20,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 28),
				ForceMax = this.createVec(0, 42)
			}
		]
	}
];
