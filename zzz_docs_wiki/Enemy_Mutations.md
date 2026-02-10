# Enemy Mutations
*Mutation Effects are not just limited for player use, but can also appear on enemies, granting them select sets of buffs, passive and/or active skills, but also granting them debuffs. This allows both an increased tactical challenge, but also opens up new windows for counterplay.*

-----
### Enemy Mutation Mechanics
* All enemy mutants get the "mutant" flag, allowing various interactions with them, like some weapons, items, ammo, skills and traits that give bonuses or penalties when attacking/fighting against them.
* The effects of the enemy mutations themselves depend on the mutation type, and usually inherit properties of the entity that inspired them. (eg: Undeath mutation -> "Undead" effect!)
* Enemy mutations also grant at least one passive effect or active ability to the enemies who get them
  * Refer at the table at the bottom of this document for specific reference to enemy mutations.  
* Enemy mutants have some distinct characteristics that set them apart: Unique name prefix, in battle visual effect, and of course the effect of the mutation itself
  * The names themselves depend on the specific mutation. Each one grants a unique prefix (So, a Footman who get the hexe mutation will be called a "Cursing Footman"). The names are also green colored
    * If enemies have multiple mutations, and some of them form a specific combination, then they will get a unique prefix instead, with a different, dark brown color
  * The visual effect in battle includes a green effect on their bust, and a soft, animated green glow
  * The name of the effect itself in the tooltip, will also be green
* Enemy mutants also have a chance to drop their relevant mutagen when killed (eg: spirit mutant can drop spirit mutagen). Refer to the Mutagen Drops section below for details
* The mutations that appear or enemies are only semi random, as different enemies have diffrent "pools" of mutations to choose from. In general:
  * Some mutations benefit only melee entities (like the orc one), and as such will not appear on ranged ones. Same thing for "ranged-only" mutations (like goblin)
  * Some other mutations are also "location based". People in the north cannot have mutations of beasts from the south. This is mainly about barbarians, and the mutations they cant have are the ifrit and serpent ones
  * Similarly, people of the south cant have the unhold mutations
  * In general, the mutation groups are divided into (All, South, North), and also the following groups: (Melee, Ranged, Swarm, Tank) Depending on enemy type, and what would most benefit them. (so group examples can be TankNorth, or RangedSouth etc.)
  * Beasts are an exception on this rule, as the mutation groups for each beast kind are tailored specifically for them. Of course, beasts cannot have their own mutation (no alps with alp mutation)
-----
### Appearance of Enemy Mutations
* The appearance of enemy mutations depends on multiple different factors, like the game's combat difficulty, mod settings, and other mechanics of PoV
   * As PoV is balanced around Expert combat difficulty, the numbers presented all represent their "base" values, set in Expert difficulty. Examples will be provided for the full range of these numbers too.
   * Mutation chances also differ between different enemies, with stronger or rare enemies usually having higher mutation chances.
   * There are also some exceptions present, as some enemies will always have mutations, and other will always have none.
   * Note that the following multipliers presented **stack on top of each other**
* For most enemies, **base mutation chance is between 8% and 11%**. Overall, base chances can range from 5% to 17%.
   * These chances are then modified according to the game's combat difficulty in the following manner (Multiplicative):
     * Beginner:     -35%
     * Veteran:      -20%
     * Expert:       Default
     * Death March:  +75%
* So, an enemy with 10% base mutation chance, will have ~6% chance to mutate on easy difficulty, but 17% on death march
* **If the Enemy Mutation Scaling optional setting is enabled** (it is on by default) Mutation chances will also get an additional modifier, depending on the current day of the run
  * In general, mutation chances start 25% lower on day 1, reach their default values on day 50, and then keep scaling up to day 260, with a maximum bonus of +75%.
  * Some more specific numbers: (Day range - Modifier)
    * Day 1 - 15    ->   -25%
    * Day 15 - 30   ->   -15%
    * Day 30 - 50   ->   -10%
    * Day 50 - 80   ->   Default
    * Day 80 - 120  ->   +10%
    * Day 120 - 180 ->   +20%
    * Day 180 - 260 ->   +40%
    * Day 260++     ->   +75%
  * So as an example, an enemy with 10% base mutation chance, on legendary difficulty, on day 200, will have a final mutation chance of 24%
  * The purpose of the mutation scaling is to increase the appearance, and by extention the challenge offered, of the enemy mutation system, as the game progresses
  * This setting can be safely enabled/disabled during a playthrough
* Mutation chances can also increase if the player has the "Mutagen Research" retinue
  * The increase is an additional 15%
  * So, following the previous example, on day 200, on legendary difficulty, with this retinue, mutation chance will rise to 28%
* Finally, when starting a new game, only until the first enemy mutation appears, the chance will be increased by a flat 30%
  * This is meant to almost guarantee that in the first battle of any run, one enemy mutant will appear. This is necessary, to kick off PoV's mechanics and special events from the start.
-----
### Multiple Enemy Mutations
* If an enemy rolls and successfully gets a mutation, it also makes a roll to get a second one!
  * Chance is 2 times the final mutation chance with which the enemy mutated (so its base chance + modifiers, multiplied by 2)
    * If that enemy is a champion, the second mutaion chance multiplier is 3 instead of 2
  * So for example, an enemy that mutated with a 15% final chance, has 30% chance to roll a second mutation, or 45% if it is a champion
  * These numbers may sound large, but keep in mind that we are talking about multiple rolls that have to succeed in order
    * To go with the example above, think of an enemy with 15% final chance to mutate. For it to get 2 mutations (so successfully roll a 15% and 30% check), mathematically it has 4.5% chance of this happening
    * If, for the same example, the enemy is a champion, the chance mathematically is 6.75% instead
    * Having said that, double mutations are supposed to be a rare event, unless you are well into late game with high scaling, legendary difficulty and see lots of champions
-----
### Mutagen Drops
* Enemy mutants have a chance to drop their relevant mutagen when killed (eg: spirit mutant can drop spirit mutagen).
* Just like the enemy mutation appear chance, the rates are dynamic and affected by the games difficulty, and a few other factors
  * Base mutagen drop chances range from 1.8% to 2.2% (difference between somewhat more rare mutations, compared to less rare)
  * Depending on game difficulty, these chances are multiplied:
    * Beginner:     +75%
    * Veteran:      +25%
    * Expert:       Default
    * Death March:  -25%
  * Keep in mind, that in lower difficulties less mutants appear (which translates to less rolls for a mutagen drop), and vice versa for higher ones, so in reality, across all difficulties, mutagen drops range around 2% with these modifiers.
* Some starting scenarios get an additional modifier to the mutagen drop chances:
  * PoV "Path of the Vatt'ghern": +15%
  * PoV "Solo Vattghern:" +20%
  * "Poachers": +15%
  * "Beast Slayers:" +10%
* If the player has the mutation scaling setting enabled, mutation chances will be slightly lowered on the high end of scaling, to compensate for the big increase of appearence of enemy mutations. These modifiers are:
    * Day 120 - 180 ->   -10%
    * Day 180 - 260 ->   -20%
    * Day 260++     ->   -30% 
* Also, Mutagen Drop chances can also increase if the player has the "Mutagen Research" retinue, by +20%
* Finally, if Chaos Mode is enabled (see below), there is a final modifier of -60%, as with chaos mode on many many more mutations will appear
* Important note: Until you kill your first mutant, mutagen drop rates are always 0! (so first time killing a mutant will never drop a mutagen)
----- 
### Chaos Mode
* An optional PoV setting, off by default.
* It pretty much adds lots of chaos to the game, as enemies have no mutation limit, and they can also roll ANY mutation (ignoring the mutagen groups I talk about above)
  * Seeing an enemy with like 5 mutations is not that uncommon
* The mutation system here works differently. Each enemy has a set chance to get EACH possible mutations, so all enemies roll for each different mutation once.
  * Chances are difficulty based:
    * Beginner:     3%
    * Veteran:      4%
    * Expert:       5%
    * Death March:  8%
* These chances are further modified by the Enemy Mutation Scaling setting in the following way (steeper curve in general, also easier early game):
  * Some more specific numbers: (Day range - Modifier)
    * Day 1 - 15    ->   -45%
    * Day 15 - 30   ->   -25%
    * Day 30 - 50   ->   -10%
    * Day 50 - 80   ->   Default
    * Day 80 - 120  ->   +15%
    * Day 120 - 180 ->   +35%
    * Day 180 - 260 ->   +60%
    * Day 260++     ->   +100%
* Mutation chances can also increase if the player has the "Mutagen Research" retinue
  * The increase is an additional 15% 
-----

# Enemy Mutations Table
| Mutagen Name | Effects (Boosts) | Effects (Drawbacks) | Added Skills (Description) | Tips | Effect Icon |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Alp's Resistance** | `Immunity` to Night and Rain debuffs. `50-70%` Resistance to ranged weapons (Depends on weapon, low - bow, high - thrown spear) | `-5` Fatigue Recovery | None | Can be a nuisance if it appears in Ranged enemies. Use melee against it. | <img width="56" height="56" alt="pov_alp_mutant" src="https://github.com/user-attachments/assets/f4bae751-98fd-40b3-b5d0-61cf06c2908f" /> |
| **Basilisk's Focus** | `+10%` chance and `+14%` damage on head hits. | `-14%` body damage, `+15%` fatigue cost for all skills. | None | Can be super dangerous with the right weapon combination. Steel brow is good against it | <img width="56" height="56" alt="pov_basilisk_mutant" src="https://github.com/user-attachments/assets/fbc57c12-1368-4438-af43-7f8732a5c758" /> |
| **Beastly Endurance (Direwolf)** | `Immunity` to rain and bleeding, `-50%` fatigue cost for movement, `-25%` fatigue costs, `+15%` fatigue, `+6% +4` Melee skill, `+10%` initiative, `half` night penalties | **Armor Penalty:** `+30%` increased penalty to fatigue and initiative from wearing armor. | Attacks `cause bleeding` equal to `10% + 4` of damage inflicted. Also gets Adrenaline rush | This is considered a strong mutation. Enemy should be focused down quickly. | <img width="56" height="56" alt="pov_direwolf_mutant" src="https://github.com/user-attachments/assets/1da6997c-f296-49f4-8e3e-cfa140f4d159" /> |
| **Etherial Attacks (Spirit)** | `+15%` + **`5`** flat armor penetration on all attacks.Also gain `+20%` + **`5`** flat Ranged Degense | `-50%` armor damage dealt to enemy armor. Get Undead and spirit flags | **`Ghastly Touch:`** A close-range strike that completely ignores all enemy armor | Tools and skills that are effective against undead will also work here. Avoid ranged. Nimble recommended | <img width="56" height="56" alt="pov_geist_mutant" src="https://github.com/user-attachments/assets/70ce91a1-9913-4b99-b635-61041f6e3299" /> |
| **Ghoulish Hunger (Nachzehrer)** | **`Frenzy:`** Gains stacking buffs to M. Skill, M. Defense, and Initiative as enemies die in battle. **`+8` Threat** | `-20%` ranged skill, `-8%` melee damage, `-33%` injury threshold. Gets the `Undead` flag | **`Gruesome Feast:`** Consumes a corpse on the user's tile to restore considerable HP, and gain a buff. | Make use of the lower injury threshold. Try to prevent the use of Gruesome Feast. Preferably kill early in battle. Use tools and skills that are effective against undead | <img width="56" height="56" alt="pov_ghoul_mutant" src="https://github.com/user-attachments/assets/9077f1cd-72d2-4932-bfb3-ab7fcbffaa76" /> |
| **Goblin's Cunning** | `-2` fatigue for movement, `+15%` Ranged Skill, `+15%` Ranged Defense, `+15%` ranged damage. | `-35%` Max HP, `-20%` Melee Defense, `-20` Bravery, `+15%` penalty from armor. | Enhances several mobility and ranged weapon skills with lower costs and higher precision. | Make use of the mutation's fragility. Can be a big threat on the right enemy | <img width="56" height="56" alt="pov_goblin_mutant" src="https://github.com/user-attachments/assets/5e20b980-a334-46fe-baf8-b4f1b25550b6" /> |
| **Hexen Curse** | None | None | **`Hex:`** (Passive) when attacked, hexes an Opponent. When damaged, opponent takes direct damage, equal to `65%` of the HP that was lost in that attack. Also reduces the maxHP of the hexed by hald of that damage for this battle. Effect lasts for 2 turns. Overkill damage counts, with a reduction of `75%`. | The Yrden sign prevents the hex from applying. Getting the effect on Fodder bros works. Healing can negate that damage. Doing LOTS of initial damage before getting the effect (on one hit) also helps, as the remaining HP will be little | <img width="56" height="56" alt="pov_hexe_mutant" src="https://github.com/user-attachments/assets/00e35505-9beb-4c79-b4a3-b503f6494cfb" /> |
| **Wurm's Acid** | `+20%` armor damage. `Immune` to acid damage. | `-10` Melee Defense and `-5` Ranged Defense | **Counter:** Acid blood damages the armor of adjacent attackers who inflict HP damage. | Prefer ranged attacks, polearms, or acid immunity. Make use of the lower defenses | <img width="56" height="56" alt="pov_lindwurm_mutant" src="https://github.com/user-attachments/assets/0b0e156b-6662-4430-8e01-b7ea7b2f10bb" /> |
| **Orcish Agression** | `+12%` overall damage. `+14% + 10` Melee Skill | **Defense:** `-12%` / `-6` flat Melee and Ranged Defense, `-3` Melee Defense for each surrounding enemy. | **`Charge:`** A melee attack that stuns the enemy on hit. Grants the `Raging Pain` passive (temp stat boost when injured). | Make use of the lower defenses, try to surround. Stunning and reducing stats can help a lot. | <img width="56" height="56" alt="pov_orcber_mutant" src="https://github.com/user-attachments/assets/58043117-711c-4214-b45e-421fc303a92b" /> |
| **Aura of Rot** | `+6` Threat, `+5%` HP | `-15%` Initiative, `-4` M./R. Defense, `+30%` fire damage taken. | **`Rotten Stench:`** AOE 1 tile aura that poisons and debuffs any enemy that comes close. | Kill it with fire! And dont get too close... | <img width="56" height="56" alt="pov_flesh_golem_mutant" src="https://github.com/user-attachments/assets/05d8f4fe-a049-4350-8b96-4974882bd7c9" /> |
| **Ifrit's Durability** | `+100` natural armor (Head/Body), `+15%` Total Damage Reduction. | `-30%` Initiative, `+10%` fatigue costs, `-10%` fatigue, `-2` Fatigue Recovery. | **`Throw Dirt:`** Throws sand at an enemy, inflicting the Distracted debuff (-`30%` M.Skill/R.Skill, `-3` Vision, `-10%` Dmg) | Attack its armor effectively, and it will only be debuffed pretty much. In combination with other mutations, it can make an enemy extremely tanky! | <img width="56" height="56" alt="pov_ifrit_mutant" src="https://github.com/user-attachments/assets/277215d4-bef9-422c-9f04-d1233163afea" /> |
| **Barkskin (Schrat)** | **Defense & Stability:** Immune to knockback/grab. `+40` natural armor (H/B). With a shield, gains `+10% + 8` Defenses, `+15%` Dmg Res | `+50%` movement fatigue cost, `+300%` fire damage taken. | (passive) **`Sapling Sprout:`** Spawns an allied Sapling (up to ``3`` times, triggered by taking `>15%` max HP damage). | Fire is huge here. Also make sure you can deal with the spawned saplings with aoe/extra attacks. If it has a shield, break it to weaken it | <img width="56" height="56" alt="pov_schrat_mutant" src="https://github.com/user-attachments/assets/34a2446f-7931-4154-be7d-5b75187d63f6" /> |
| **Serpent's Finesse** | `+15%` Initiative | `-4` Melee Defense per surrounding enemy. | **`Serpentine Hook:`** Pulls target enemy/ally `1` tile closer. Enemies hit are Staggered (`4` AP/`25` Fat, `2` turns cooldown). Grants (passive) ``Serpentine Agility`` (Defense scales with Initiative, gains bonus Def vs `1` enemy). | Surround it, or attack with ranged | <img width="56" height="56" alt="pov_serpent_mutant" src="https://github.com/user-attachments/assets/33ea8d54-76df-40bf-bd39-1ebd83e78370" /> |
| **Undeath** | `+25%` Max Fatigue, `+50%` Resolve,  `40%` piercing damage resistance, `25%` Cutting Damage Resistance, `+20` Morale Check bonus. | `-15%` HP, `20%` Fire weakness, get `Undead` flag | **`Disturbing Miasma:`** Creates a zone that reduces enemy ranged capabilities and deals damage over time (Once per combat, `6` AP/`15` Fat). | Use tools and skills that are effective against undead, be ready to dodge the miasma. |  <img width="56" height="56" alt="pov_skeleton_mutant" src="https://github.com/user-attachments/assets/aadb693b-c24c-444d-87e5-8c94be37b010" /> |
| **Spider's Glands** | `Immune` to poison. `+15%` damage and `+10%` attack to poisoned enemies. | `-12%` damage to non-poisoned enemies. | Attacks apply **Mutant Poison** (`9` Dmg, `2` turns, `-10%` init/dmg, `-4` Def, `-1` Vis). **`Weave Web:`** Ranged attack that snares an enemy, applying the Rooted effect (`4` AP/`25` Fat, `2` tile range). | Poison immunity pretty much full counters this mutation. | <img width="56" height="56" alt="pov_spider_mutant" src="https://github.com/user-attachments/assets/cfce78cc-fd2e-4761-99a0-4f18a7eb3cb3" /> |
| **Unhold's Vigor** | Heals `10%` HP/turn, `+50% +30` Max HP. `+8%` Damage. | Damage penalty (up to `-50%`) scaling as HP gets lower. | **`Headbutt:`** A melee attack whose damage scales with current HP, causes Stagger, and can Daze weaker targets (`4` AP/`15` Fat, `2` turns cooldown). | Pretty much a DPS check. Reducing HP also reduces damage done, make use of this. | <img width="56" height="56" alt="pov_troll_mutant" src="https://github.com/user-attachments/assets/11df9677-fc05-4433-a141-63a9f17f5713" /> |
| **Vampirism** | `Immune` to night penalties, gains `+10%` to all combat stats/fatigue at night. Heals `30%` of inflicted HP damage (capped at `40%` Max HP). | **Day Combat:** `-10%` to all combat stats/fatigue during the day. Has the `Undead` flag | **`Darkflight:`** Teleports to a nearby tile, with reduced AP/Fatigue cost at night (`5` AP/`20` Fat). | Use tools and skills that are effective against undead. Yrden sign or stuns and roots prevent darkflight. **Keep your backline safe!**| <img width="56" height="56" alt="pov_vampire_mutant" src="https://github.com/user-attachments/assets/bdc1d810-a335-4475-9609-8d120f4e931a" /> |


