# v2.3.0 "Origins" Edition

## Changelog V2.3.0 "Origins" Edition:
*Note: you might see some hook errors ("bb class targeted by pov" etc.) in the log close to their top. That is NOT an issue, so no need to report it*

### NEW FEATURES

* New Origin: **Mutants**
   * "The world is sick, and you are part of that sickness. You do not care, you have accepted it long ago. After conversing with a man of peculiar expertise, you have decided to set out in the world, together, to find like minded individuals, and get yourself what life did not grant you."
   * The aim here is to make an origin where fighting for your mutations and having multiple people who can use them is much more viable, while also offering some challenge, especially early on. You can still make a vattghern in this origin, even if its harder to do.
     * An origin where you start with 2 mutants and an anatomist (all slightly buffed). Its twist is that you cannot obtain corpses. Instead, mutagen drop rates from enemies are largely increased (2.5x)
     * Being a group mostly of mutants, you are not well liked, and as such, you start with some factions being hostile to you, sell for less, and most backgrounds will ask for more to be hired, and as wage.
     * On the other hand, finding other mutants is much easier, and you can also find anatomists, alchemists, taxidermists and inventors more frequently and cheaply as well. You can also find another background, exclusive to this scenario, which are the Forsaken (like the new enemies). They can take 3 total mutations instead of 2, and are on a strength level similar to hedge knights.
     * Finally, you will get more loot from enemies, enemy mutants will appear more often, but you will also do more damage to them. The "unstable mutations" effect will not provide debuffs to your mutants in this origin.
     * Starting supplies are mediocre
* New Origin: **Donkeys**
   * "After much deliberation, you understand that being a stablemaster simply was not your calling. Armed with your wit - and with the few better donkeys you did not sell - you decide to set out into the world."
   * More of a meme to be honest, but still tried making it actually playable and potentially fun xd
     * Start with a merchant avatar (must not die), and 3 donkeys. Donkeys get substantially buffed in this origin (+15% Hp, +10% Damage Resistance, +10% Melee Attack, +10% Resolve, -25% Food Consumed)
     * Peddlers, caravan hands and donkeys will be cheaper to hire and maintain, and you can find more of them. Your experience and trusty "steeds" allow for slightly faster map movespeed. You can also find and recruit an exclusive background: caravan guards.
     * Any other background will not want to bother joining your bizzare company and thus ask for much more money. You also cannot hire outlaws.
     * You also start with lower tools and ammo, but decent money.
* Both of the two new backgrounds added are origin exclusive, so they will appear only in their respective origins
   * ...But, if you play the random solo/trio/party scenarios, these backgrounds might appear there on your starting roster     

### OVERHAUL

* The different cultist backgrounds in the cultist origin got some love, like other backgrounds

### IMPROVEMENTS

* PoV has now its own Wiki! In the github
* PoV in-game wiki now has an additional entry, highlighting that fact

### BALANCE / TWEAKS

* Forsaken grant less xp when killed
* Brigand Gunners will spawn *slightly* later
* Rogue seers will spawn later in game
* The mercenaries that appear in caravans, will now appear later
* Slight increase to Alps HP
* Hyenas get +1 Ap
* Hollenhunds will deal more damage (+5% before day 75, +10% after)
* Skeletons and Mummies have 2 - 3% more chance to get the "Potent Reanimation" effect
   * That effect grants slightly more HP and Dmg resistance
* Donkeys Melee Defense reduced by 5
* Heavy gladiator armor updgrade: +1 Weight
* Kick skill: capped damage bonus from armor raised from 450 armor to 600. Also gets +5% dmg vs armor
* Rustungheist: -10 Armor on Beginner diff
* Noble and Rogue seers: slightly less HP scaling on Legendary
* The "Too many corpses" event has slightly higher chance of happening
* Bront base damage reduced by 5
* PoV mutant background has now very slightly less base Resolve and Initiative
* Enemy Schrat Mutation: -5 Armor
* Minor Flesh golems have more HP and Attack, but slightly less Defense
* Greater flesh golems have more threat, less initiative
* Hyena pack mentality now scales up to 25 entities, instead of 20
* Serpentine agility grants +4 Mdef and +2Rdef when engaged with only one enemy (So a total bonus of 14/7 now, from 10/5)
* Hates mutants trait was slightly buffed
* Reduced the Trial of the Grasses death chance by 20% across all difficulties (to allow earlier vattghern, so they can pick the new perks)

### MISC

* Even more preparation done for upcoming Legends versions
* Alchemists want mutagen encounter can now happen even if you have a very small party
* Monster hunter trait will appear a bit more often on bros

### FIXES

* Vast array of typos fixed
* Miller background had a 60% Hp bonus, instead of 6%, lmao
* Named Feuerbushe had wrong stats (weaker than intended), fixed
* Fixed Extremophile trait tooltip to display correct info

## Changelog V2.2.3 "Make it Rain" Edition:

### BALANCE

* Iftit mutations tweaked
   * Vattghern and mutant ifrit mutagens grand more armor
   * They also have lower penalties (to compensate for the new armor system penalties)
   * Enemy ifrit mutation has same buffs (they already were higher than player), but also reduced penalties

### FIXES

* Rain debuff will no correctly apply and go away when it needs to. No more climate change!

### MISC

* Tweaked the rain effect icon art
* Some more preparation was done, for future PoV compatibility with other mods and new legends versions

## Changelog V2.2.2 "Make it Rain" Edition:

### NEW FEATURES

* 2 New Traits
   * **Trailblazer**: Character gets bonus stats when fighting in forests and mountains. Also grants some party movement speed on these terrains
   * **Extremophile**: Character gets bonus stats when fighting in snow and deserts. Also grants some party movement speed on these terrains

### OVERHAUL / REWORKS

* **Rain Overhaul**
   * Whenever you start a battle and its raining, most entities will get the rainfall effect
     * This effects reduces vision (-1), ranged skill (-15%), and increases fatigue costs (+15%)
     * Some entities (beasts, some undead, and some mutants) are resistant to this effect, and will not get it
   * When its raining, ALL entities get 30% flame resistance
   * Some Player mutations (alp, direwolf) grant resistance to rain
   * Wildmen are also immune to rain
   * Also, heavy cloaks and the crusader cload grant resistance to rain
* **Falling Damage** 
   * That damage was tweaked, increasing its damage by 150%, making pushing enemies down much more viable, especially at large heights (2 - 3) 
* **Tweaked PoV's Armor Rework**
   * High armor values used to reduce ALL armor ignoring damage, even if that damage was from for example magical origins
   * Now, some handpicked active skills will ignore armor normally. These are:
     * (Vanilla) : nightmare, ghost touch
     * (PoV) : bront sign, pov ghost touch
     * (Legends) : banshee touch, redback dagger puncture, vala warden attacks
     * (SSU & Rotu) : smoke and mirrors, electric attack, chain lighting, ghost phase through, ghost spear strike
   * Notably, physical armor ignoring attacks will still have their damage reduced, mostly includes puncture attacks, and choke. They are still effective, but will require more effort
* The "lucky" trait now also adds 2% headshot chance      

### BALANCE

* Crusaders cloak was slightly buffed
* Flesh golem roaming parties: should have less numbers, and greater flesh golems appear later in them
* Silvering kit: Durability loss of silver weapons reduced from 20% to 15%, value increase buffed from 15% to 20%
* Rustungheist (armor ghost): +5 Armor
* Forsaken are stronger in auto battles (on map vs other parties). Thus, they will be also braver
* Hyena fur cloak armor reduced from 20 to 5, as its meant as a light armor (attachment) piece
* Swan pauldrons ranged defense bonus raised from +3 to +5

### FIXES

* Fixed a rare issue between PoV and Fotn when using named goblin spiked ballz
* Fixed a crash related to the new PoV Banner skill
* Fixed a very rare issue with the scholar perk, where if you got that without knowing to read, you couldnt read (now you can)

### MISC

* Added 2 more loading screen tips related to the rain
* On a sidenote, PoV also has its wiki under active development, check the wiki in PoV's github

## Changelog V2.2.1 "Armored" Edition:

### FIXES / TWEAKS

*This is a new system, so its bound to have issues, and will definetly need some rebalancing, open to feedback*
* The new armor overhaul was a liiiitle bit bugged. Fixed some stuff around it
   * It will properly not apply when playing with Fotn
   * The damage resistance calculations were also wrong, and were fixed
* Tweaks:
   * The damage of direct damage SKILLS (like puncture or PoV bront) will now be reduced against users with very high armor (this is a necessary change, in order for armor to be able to reduce damage with 100% armor penetration)  
   * This does not apply to effects though, like miasma, poison, bleed etc
   * The player-side penalties of losing armor were slightly reduced
* Sidenote:
   * These armor rework effects do not apply just to worn armor, but natural armor as well (monster fur/scales, ifrit mutation etc.)

## Changelog V2.2.0 "Armored" Edition:

### OVERHAUL / REWORKS

*The main focus of today's patch is a broad rework of the armor system! Instead of changing the values of the individual armor pieces, ive changed how being armored reacts to taking damage instead! General philosophy is to make armor a LITTLE bit more believable.*
* **Armor Mechanics Rework!**
   * All armor will now grant a resistance against direct damage (the AP part of skills)
     * That resistance depends on current armor. So as it gets reduced, resistance is lowered
     * That resistance grows quickly, but it grants diminishing returns as armor gets higher
     * On 500 armor, this bonus is capped to +35% resistance
     * There are seperate resistances depending on body parts (body/head). Head resistance has a cap of 30% instead
     * The diminishing returns are not necessarily a drawback, as when having higher armor, losing some of it will result in less resistance loss
     * (Rough example - Random Numbers: from 500 to 400 armor -5% resistance. from 200 to 100 -12%)
   * There is also a new drawback to stacking armor though...
     * As a character takes armor damage, aside from having the bonus resistances reduced, they also get a linearly scaling penalty (as having the armor being bent, broken etc slowly makes it more of a hinderance than an asset)
     * That penalty Reduces the wearers Melee and Ranged defense, and also increases their fatigue Cost
     * Its severity depends on how much % of total armor (Head + Body) is lost. Low loss = low penalty
     * When current armor is over 85% of its total durability, then there is no penalty
     * After that, penalty starts from a minimum of 5% and can grow up to the following:
     * Max penalty varies between 15% and 35%.
     * These numbers depend on maximum combined armor, with the minimim penalty on 200 armor, and the maximum one at 1000.
     * Keep in mind, that its rare to get so low armor that you will actually reach these numbers. But it still is a substantial penalty!
     * Anyone with less than 200 armor will not be affected by that penalty at all (helping lightly armored bros - and to make up for the reduced resistance)
   * These changes are explained on the campaign and in battle by a new effect that will appear on any bro that does not have 0 armor
   * A few important things to note:
     * These effects apply to BOTH the player AND the enemies.
     * Players get slightly less bonuses AND penalties from what is described above (to make up for the player being smart, and using this system better, but also add some nice counterplay)
     * The appearance of these tooltips is optional (in case one does not want to see them). They can be toggled in PoV mod options. Disabling them DOES NOT DISABLE the effects, only their tooltips.
     * This effect also has an adaptive name and icon, showcasing the condition of the effect and its armor (stuff like "good","breaking","ruined" etc.)
     * Direct damage skills, like Puncture, Poisons, or the Bront Sign, work normally, unaffected by these damage resistances
   * Regarding compatibility with other mods
     * All these changes will not apply if you are Running PoV + Fotn (fotn has its own balance)
     * As for SSU, you are recommended to enable SSU Tweaks in PoV Mod options, as this now also removes SSU's armor encumburance effect, allowing PoV's version to take over    

### BALANCE

*An effort was done to prevent reaching huge amounts of armor penetration with ranged with just a few skills/perks. Made it still be possible, but harder to achieve*
* AP Bolts and Arrows nerfed
* Crossbow Mastery grants +10 additive armor pen, instead of +20
* The Shortbow perk's further buff to armor pen and broadhead arrows was remove (rest of perk is intact) 
* Yrden sign can now prevent a hexe mutant from hexing someone
* Enemy Seers will spawn slightly later ingame
   * They also have very slightly less HP
* The donkey thing is fun, but damn they need some nerf. They lose some little HP (translates to - dmg too)   

## Changelog V2.1.1 "Birthday" Edition:

### NEW FEATURES

* **Raise The Banner!!**
   * A new skill added to the Company Banner item
   * Functions similarly to the rally skill, but a much stronger, yet taxing, effect.
   * The design of the skill is to have a powerful ability you can use if things get dire, but it comes with a cost. The skill's effects are:
     * Attempt to rally, cure charm or sleep, and raise morale of allies in 8 tile radius
     * Also attempt to reduce the morale of enemies in the same radius
     * All chances depend on user's resolve, plus a penalty of 5 for each tile of distance
   * Using the skill has a 3 **day** cooldown, and during that time, the user's resolve is also reduced
   * Cooldown is 2 days, if the user has the Inspiring Presence Perk
   * Of course, this skill comes with its own art, effects, and sound

### OVERHAUL / REWORKS

* A slight retouch was done to the dagger weapons, mainly to make higher tier daggers a more valid choice, between them and the qatal
   * All knives (excluding qatal) saw an increase to damage (~+5), and value
   * They also saw much increased armor penetration
   * The qatal is still the stronger version dps wise, but now the rondel dagger is much more of a competition
   * The shiv was left untouched
   * The legendary obsidian dagger was similarly buffed.
   * Redback dagger was buffed in version 2.0.0 already
* The Goedendags now get the Cudgel skill (the one great maces have)
   * It has increased fatigue cost though (20 instead of 15)  
   * So now, great maces are still performing better with their skill, but Goedendags offer more utility
   * To further balance things out (and differentiate 2 high tier weapons more):
     * Great flanged mace is 5% more effective against armor
     * Military Goedendag is 5% less effective against armor
* The Swordstaff gets the "Heartpiercer" and "Lunge" skills
* Vala dress now offers half armor (60 for 0 weight was too much, too exploitable. 30 for 0 is still very nice)

### BALANCE

* Enemy forsaken parties will include slightly less forsaken
* Mutants settlement situation: Much more possible to actually find mutants in that settlement
* Caravan hands were slightly buffed

### FIXES

* Fixed (for real, this time) an error between PoV and Fotn, about PoV's new guns

## Changelog V2.1.0 "Birthday" Edition:

### NEW FEATURES

* **PoV Settlement Situation Tooltips**
   * Now all situations (vanilla,legends,pov and other mods) will have tooltips better explaining their effects
   * This can be disabled in PoV mod settings, no restart required
   * This was done cause I wanted a better, PoV-Integrated version of these QoL mods. The other reason is that these same mods had some issues with PoV's new situations, so id rather do my own version, which I have control and responsibility of
   * This makes other mods that do that incompatible - if enabled in PoV
* **2 New Vattghern Perks**
   * One is about fighting champion enemies
   * The other is about increasing mutation limit and reducing mutagen sickness time   

### IMPROVEMENTS - QoL

* Gunner Knights (Flammenritter) should now behave much more agressively - as they should
* Enemy Donkeys were either too agressive in some cases, or too inactive in others. Tweaked their stats for a middle approach. Now they will fight, but mostly if cornered, or an enemy is close
* Armor and Sword ghosts will be a litte more "straightforward" in fights, and attempt to flank slightly less
* There are two main, but different tabard types ingame, did you know it? Know you will as they are named differently
* Sureshot trait's ranged penalty halved (-5 from -10)
* Improved the tooltips of the vattghern trait and mutagen, to describe the new perks acquired
* Some new PoV traits may affect the title that a bro spawns with (eg "the Hater")
* The noble mixed caravan (the one with mercenaries too) will now also include mercenary gunners
* Piercing shot perk will now increase the attack range of new PoV firearms

### BALANCE

* Due to recent PoV rebalance, the "strafing run" skill was removed from crossbows
* Mutation Aftermath now greatly reduces sign intensity (-75%)
* Both Hexe mutations now also increase sign intensity (+10 / 20%)
* Fleshcultist boss Tabard item buffed, to make it more unique
* Flammenritter were buffed, made more of a threat (more hp and some stats)
* Enemy seers were slightly weakened - their damage was kinda overtuned (less dmg)
* Dumb trait is no longer a pure negative, now it also grants damage resistance (+15%) when a dumb bros head is hit
* Wildmen were given some love, and have now buffed unarmed damage (10%), and a combat bonus in forests (5%)
* Enemy forsaken parties will spawn with very slightly more forsaken (like +1 / 2 at most)
* Axii Sign base baffle chance slightly reduced (-5%)
* Igni Sign damage was buffed (+15 min. dmg)
* The brawler background unarmed damage bonus was increased (from +5% to +15%)
* Flesh golem roaming parties will now spawn much earlier (day 15 instead of 50) due to their recent balance changes
   * The event announcing that adjusted accordingly

### FIXES

* The company banner (and shield/tabard) textures should now apply correctly 
* Fixed pov miasma skill tooltip, to reflect latest balance changes (in V2.0.0)
* Fixes an error with the PoV Charge skill causing a crash
* Fixes an error with the Bront Sign skill causing a crash
* Fixed some typos in new pov skills and perks, and the nomad background
* Fixed the gunner knights always spawning as champions
* Fixed an issue with using handgonnes, when playing with Fotn mod

### MISC

* Some work done for future compatibility
* Added 5 more loading screen tips
* PoV logging improved on some parts
* As always, memed a bit

## Changelog V2.0.0 "Birthday" Edition:

### NEW FEATURES

*Some of the features I present here are further analyzed in the PoV discord server, in `#progress_report` channel. This section will also have a seperate "ENEMIES" section, cause I added quite a few so they get their own spot*
* Before we begin, let me highlight that fire damage has much more presence in pov, both in enemies and the player. Many things get weakness or resistance to fire, and now there are more stuff that can do fire damage, so its overall becoming more important. Keep that in mind regarding game balance.
* **New Mechanic: Vatt'ghern Signs** Aka. Fantasy Gang Signs
   * This is a big big part of the new PoV Update...as Vattgherns now have limited access to magic!
   * There is also a new stat added, called **Sign Intensity** All characters start with 0, but this number can increase
     * Sign Intensity directly increases a sign's overall power, including its damage, but also its chance to afflict enemies with specific effects
     * It can be increased by: The vattghern trait (scales up like other stats), items, perks and other effects
   * Signs are added via perks, as now **Vatt'ghern have an additional perk tree (with currently 4 perks)**
     * Making someone a vattghern also grants them access to these perks
     * Signs themselves have a shared cooldown between them, with a base value of 2 turns. (can be reduced)
   * *Here are what these perks are, and what they do*:
   * **Defense Signs** (tier 1)
     * Grants the Quen and Yrden signs, and also +2% sign intensity
   * **Control Signs** (tier 2)
     * Grants the Aard and Axii signs, and also +2% sign intensity
   * **Offense Signs** (tier 3)
     * Grants the Igni and Bront signs, and also +2% sign intensity
   * **Signs Mastery** (tier 4)
     * Grants +20% sign intensity, -25% fatigue and -1 Ap costs for signs, and -1 to their cooldown 
   * *About the Signs themselves:*
     * **Quen**: Grants a shield, that blocks an amount of damage once. That damage is then reflected on the attacker. Damage blokced and reflected scales with Sign intensity (SI)
     * **Yrden**: Marks an area with the yrden trap, debuffing enemy stats, and also preventing the use of some special abilities (like the enemy mutant ones). Cast range and duration scale with SI
     * **Aard**: AOE attack (like handgonne), 1 range. Deals minor blunt damage. with a chance to push back and stagger enemies. Damage and effect chances scale with SI
     * **Axii**: Single Target sign, seperate chances to baffle, daze and stun an opponent. Chances scale with SI
     * **Igni**: 1 Range sweep fire attack, deals good damage, with a chance of causing enemies to burn, for 20% of damage dealt. (And burn also debuffs some of their stats). Damage and burn chance scale with SI
     * **Bront**: An original inspiration of mine, functions like the chain lighting attack you might have seen in other mods like rotu. Deals armor ignoring damage, which chains to other opponents, and also causing a negative morale check to them. Damage, chain amount, and morale check difficulty all scale with SI.    
* A new player background (recruitable) was added: **The Mutant**
   * The Mutant is a combat oriented background, capable of both melee and ranged. It has access to mutations, but they are not as stable and refined as the vattghern ones.
   * Starts with a random mutation (you can see which one if you "try out" before you hire them), and it can get one more, by using a mutagen on it!
   * To balance things out, it has a unique trait with some light/moderate debuffs
   * Also, these mutations themselves are not as strong as the vattghern ones, but still follow the same logic. Usually they have slightly reduced benefits, and/or slightly increased penalties
   * Finally, they are incapable of becoming a vattghern (they are already deeply mutated)
     * Generally High HP, but Low Resolve (generally strong, but not as much as a hedge knight for example)
     * They are of "Medium" cost and wage
     * They start with simple but decent equipment
   * They can be rarely found in any settlement, with an increased chance for the settlements containing a black market
   * You also have a chance to recruit them for free, after doing a certain new contract...
* **2 New settlement situations** were added:
   * One is directly related to the aforementioned mutants, anc can appear on almost any settlement, and is more likely to appear during any crisis. Its effects are: less items on sale, increased buy and sell prices, but also adds mutants to possible recruit pool
   * The other one is about alchemists visiting a settlement. This makes selling your mutagens, corpses and monster parts there more viable, and also adds some alchemist related backgrounds in the recruit pool 
* Remember the **Seer**? Now he's recruitable, though hes now an old guy.
   * He will ask you to join in a camp encounter, should you be powerful enough
   * For balance, and not to overshadow the seer origin, PoV's seer was made weaker (less stats, gets the old trait), and should be considered a support mage, with dps potential if you specifically build for it.
* **2 New Vattghern Mutations**
   * This is actually the rework of the past "Strain" Mutation, which was now split in 2:
   * **Necromancy Mutation**
     * This is the old "Strain Mutagen". It no longer grants the "aura of rot", but instead, grants the **Raise Dead** skill
   * **Rot Mutation**
     * This is a brand new mutation, that grants the "aura of rot" passive, but also the **Corpse Explosion** active skill (the one fault finders use)
     * It also increases health, but its debuffs are reduced initiative and defenses, on top of weakness to fire
   * To facilitate the rot mutation, now the flesh golem faction was fleshed out (hehe) with 3 corpse items in total (2 of them new). Corpses can drop from flesh golems, greater flesh golems and fault finders, all granting a chance to get the new rot mutagen, along with other goodies
   * The enemy mutations remain unaffected by this new thing     
* A new retinue/follower was added, **Mutagen Research Tools**
   * It increases corpse and mutagen drop rates by 20%, and makes enemy mutants take 10% more damage. 
   * It also increases the appearance rate of enemy mutants by 15%
   * To unlock, it requires: having obtained at least on mutagen, have in your party one of the following: Alchemist, Taxidermist, Anatomist, Inventor, Druid, Vattghern (background, not trait), and also 4750 gold to buy it.
* **Sling Ammunition**
   * Sling ammunition can be used with slings, consuming ammo upon use. But, if this ammo runs out, people can still use slings with normal stones!
   * There are 4 new sling ammunition options, 3 can be found in fletchers, and 1 is craftable, here are their names and what they do:
   * *Limestone Pebbles*
     * Light and shaped rocks, they allow higher effective range, higher velocity (+ armor pen) and slightly less fatigue to use, but at the cost of damage and dmg vs armor
   * *Basalt Stones*
     * Heavy, hard rocks, meant to maximise damage but at a steep cost. They Increase damage and dmg vs armor by 20%, but at the cost of 2 range, and +40% fatigue required to use!
   * *Pumice Stones*
     * Super light and porous, they are not that damaging, but they are meant to be fired at a high volume. They provide +2 range, and less ap (-1 to -3, dependig on weapon and skill) and -30% fatigue to use. They also make an intense sound while flying at high speed, offering the capability of scaring those of weak heart (weak morale check on hit). On the other hand, they have much less damage and dmg vs armor
   * *Ifrit Rocks*
     *  Hard rocks, but not as heavy as basalt, capable of breaking into pieces upon contact, breaking down to sand that can distract enemies. They also offer additional damage, effectiveness against armor. Their drawback is that they must be crafted by shimmering stones (from ifritrs), and they are few in number (8). They also cost slightly more fatigue to use, but with no ranged penalty
* New Ammo: **Silver Arrows, Bolts and Bullets**
   * All these offer additional damage against beasts and undead, and also mutatns
   * Attacks with this ammo can also injure these enemies easier
   * On the downside, they are less effective against armor, and do less damage against other enemies
   * All can be quite expensive to buy. They are found at fletchers and black markets
   * Finally, they do not have "large" quiver variants, making them limited in bigger battles    
* New Contract: "Kill Forsaken Leader" (see details below, in the new enemies section)     
* New Weapon: **Feuerbusche**
   * Very similar to the original handgonne, main differences are: less damage and durability, more weight, but also much more effectiveness against armor
   * Also has a named variant
   * Both can be found on some new pov enemies, and rarely sold
* New Weapon: **Feuerspeier**
   * An expensive and strong firearm. Its aoe attack being the same with the firelance, but allowing for slightly more range.
   * Deals pure fire damage
   * High damage and armor effectiveness, but quite low armor penetration. Chance to hit is relatively low
   * Has an increased chance to hit head
   * Also allows for 2 Melee attacks (like a hybrid weapon). "Improvised Strike" and "Heavy Thrust". Both these attacks are stronger than what you will see on other ranged weapons
   * Has a named variant as well, which also improves the aforementioned attacks.
   * Also, this weapon can shoot in melee too.
   * Can be found on a strong new enemy, and very rarely sold
* New Weapon: **Rough Staff**
   * Just like the mystic staff, just a weaker variant overall, but much more viable against armor (with melee attacks)
   * Has a named variant, which buffs all spell damage! 
   * Both can be found on another new PoV enemy!   
* New shield: **Steel Buckler**
   * Steel bucklers are a direct upgrade to the simple bucklers, or the mummy small shields. They offer greater protection (and improved passive def) at the cost of weight, but they have much more durability, giving buckler builds more viability now, as previously they were far too easy to break. 
   * They can be bought in armorsmiths of the north! There are 3 different art variants.
   * They also have a named variation, which can be bought, or looted from certain champions that might wield them. They also have 3 art variants.
* New Gauntlet: *Silver Gauntlets**
   * Similar statline to the spiked gauntlet, but its slightly weaker and more expensive
   * Its important part though, is that its very efficient against mutants, undead, and beasts, granting +35% unarmed damage, and increased injury chance
   * They can be found wherever you would find other gauntlets   
* Oathtakers now get a new trait - "Oathsworn": granting them a random *minor oath* each week
   * Minor oaths are lesser effects of the oaths you can get in the Oathtakers origin
* Added **New Main Menu Music**!
   * Also plays when starting with the vattghern origins
   * Toggleable in PoV Mod Settings      
* A brand **new company banner**! "Rose"     
* A new pov "story" event, directing the player to do a vattghern contract (part of a yet WIP expansion to pov)    
* A **new meme mutagen** was added....woof woof.
* **Donkeys can now FIGHT**...dont underestimate them, lest you get kicked where you don't want to.
* Added a new semi-meme encounter, commemorating a great communication ive once had in PoV discord server

### NEW FEATURES: ENEMIES

*An important note for the newly added enemies, is that most of them will not spawn on day 1, especially in large numbers (unless stated otherwise). There has been lots of effort into making these enemies gradually appear as you also get stronger.*
* Major new enemy: **The Forsaken**
   * I say "major", cause this enemy comes with its own new location, loot, and even a new vattghern contract
   * Inspired by SSU's desperados, they are heavy hitters, but mutated to the point that they have lost all sanity and humanity! The design goal is to add a scary and strong new enemy, to keep players on their toes in the early/mid game. This enemy should kinda work like a benchmark, for when a player gets strong enough. Here are the details:
     * They are similar to SSU's desperados. Heavy armor, heavy hitters, but can be tired out, stunned etc.
     * They always have at least 2 mutations! (meaning also an opportunity for getting mutagens...)
     * They may drop a new corpse, which when dissected, has a change to grant a random mutagen!
     * Their locations and parties hold more valuable loot than your typical bandit nobodies
     * There is randomness in their equipment, some weapons they can get are weaker than others
     * They also get a unique visual effect to highlight their wild mutations
     * These enemies can also become champions, making them much stronger
     * In lategame, more stronger variants of this enemy will be spawning
   * When/where they appear:
     * They are part of the bandit faction, and as such, they will take over a few of the bandit locations
     * Their spawn rate (both location and roaming party - wise) is scaled over days passed, starting from 10% of all bandit locations and parties on day one, to 25% on day 200
     * They can also be found roaming the map, with a similar chance based formula
     * The new location they spawn in has some custom and unique art, you will be able to tell it apart on the map!
   * **Forsaken Vattghern Contract**
     * A new vattghern contract was also added, to go to a location and kill a leader of the forsaken, along with his minions.
     * For this contract, you can also hire some support, in the form of mercenaries (works similarly to the poachers you can get in another quest)
     * The catch here is: the contract is about killing the enemy leader (see screenshot, also new effect). He is a very beefed up forsaken champion, usually with 4 mutations
     * The reward though, is very well worth it, as he is equipped with a named weapon, a T2 named armor, and T2 named helmet! The champion can also drop legends masterwork crafting items! Worth the kill!
     * Winning this battle also gives a chance for a mutant with better stats wanting to join you for free! And if the mercenaries survive, the quest giver might be thankful.
     * The contract adds the ambushed trade routes situation in a settlement, until resolved. An important detail, and opportunity...
     * Finally, the party accompanying their leader, has a slightly higher chance of containing champions.
* **New Enemy: Seers**
   * Yes, you read right, eemember the seer background? Now you can find them rarely in some enemy groups. With skills like magic missile, entice, stun, daze, etc, they are bound to be a menace.
   * They are lightly armored, with perks like nimble, and rely on the damage and disruption their magic can cause.
   * Most variants are equipped with a new magic staff, which is a slightly weaker variant of the normal seer staff.
   * They can also become champions, which gives them much more power, and a named version of the new staff (which increases spell damage)
   * They have a small chance of dropping ancient scrolls!
   * There are 2 Variants of this enemy:
   * **Rogue Seer**
     * A self-serving seer that for one reason or the other has gone rogue, now putting his skills in different use.
     * Generally, its slightly more tanky and less damaging than the other variant
     * Can be part of enemy brigand parties and camps
     * Can also be part of mercenary groups!
   * **Noble Seer**
     * A nice and proper seer, if not a little pompous
     * Is a lighter, but more damaging variant
     * Is found in noble parties
* **New Enemy: Gunners**
   * Brigands and mercenaries are adapting, and now they have access to guns of their own!
   * They come with a new kind of handgonne, that while dealing less damage, it is far more effective against armor (considering that in the north, people are dressed like tin cans)  
   * They also can become champions, with a named version of the aforementioned gun, and with some interesting additional perks!
   * They also come in 2 Variants:
   * **Brigand Gunner**
     * Pretty self explanatory, these ones are wearing medium armor, and also decent in melee.They can be quite the threat if you let them
     * Can be found in roaming brigand parties and camps
   * **Mercenary Gunner**
     * Stronger and slightly better equipped than their brigand counterparts, they are also a threat to take note of!
     * They can be found in enemy mercenary companies, and bounty hunters!
* **New Enemy: Flammenritter**
   * A spicy new enemy: "Flame Knights"
   * They come equipped with a new kind of handgonne, the Feuerspeier, that you can read about in the New Features section!
   * The enemy wielding this new weapon is a skilled, heavily armored knight, able to afford such a rare and expensive armament!
   * They are pretty capable in both melee and ranged combat (and have nice drip on top) 
   * They can also become champions, making them one of the most dangerous enemies PoV adds
   * Of course, they appear as part of noble armies    
* Mercenaries can appear in noble parties
* Lost Treasure Hunters can appear in southern necromancer parties

### OVERHAUL / REWORKS

*Many systems were extensively reworked, including: background effects, shields, all ranged weapons, craftable items from monster parts, many perks and legends skills, tier V armor attachments, and more... These reworks will be present in most cases, unless you are playing with the Fotn mod, where they are overwritten for best compatibility*
* **Monster Craftables and Armor Attachments Rework** (~40 Items Changed)
   * All armor attachments, weapons, shields, and accessories that are craftable from monster parts were buffed, with the intention of making them a more viable choice, compared to what you can buy
   * The buffs are especially big on stuff that requires more rare materials
   * On a sidenote, the ancient armors you could restore were also buffed to be more viable
   * Specifically, Monster trophies and legendary items were buffed the most!
   * Some of these items were also marked as "precious", so you dont sell them on accident 
   * About the armor attachments, all tier V armor attachments were reworked, with edits to most of their stats and values, with the intention of: Differentiationg them from each other more, giving some less used one an additional highlight, and in general, made most of them weaker when compared to their craftable counterparts, to reward crafting.
     * Specifically, the "pauldron" items were the workst offenders, where they all were doing pretty much the same thing, with extremely minor differences (+- 5 armor, 1 fatigue etc.). Now all pauldron items have different uses, and pricepoints (almost like a tiered system between them)  
* **Backgrounds Rework** (~80 Backgrounds total)
   * Most recruitable backgrounds now come with some minor thematic effects (buffs most of the time). Woodcutters will be better with axes for example. The intention behind this is to add a little bit of flavor, uniqueness and roleplay
   * Not all effects are made equal! Some rare bckgrounds enjoy unique benefis
   * An example is the new minor oaths system for oathtakers (see at the New Features section)
* **Shields Rework**
   * On top of the new shield item added, shields were slightly reworked, so they can be more viable equipment.
   * Specifically, I focused on the damage aspect, where the shield bash and buckler bash skills now do more damage depending on the shield's max condition. This is unlocked by the relevant shield perks.
   * Shield expert now further increases that damage. And the schrat mutation can boost it more.
   * These skills also have by default increased effectiveness against armor, as their attacks are essentially from blunt instruments.
   * So, I think at this point you may notice how these changes can combine into an interesting build. As for example, the ambidexterous perk makes you attack automatically with your buckler, if you are equipped with one! Of course, this may not be able to compete with pure dps builds, but it should offer more usefulness and utility to shield tanks, or light duelist type characters!
* **Skill Books Rework**
   * In general, I liked the new skill books addition, but it did feel "shallow" to use. So I did add some depth to the book reading mechanics!
   * People will now need to "know how to read", to benefit from skillbooks
   * Depending on different backgrounds, perks and traits, the readable books limit can be either 1,2,3 or infinite! 
   * Most educated backgrounds already know, and this is highlighted in their background tooltip. On top of that, ppl with the bright trait can also read.
   * Some very few exceptions: people with brain damage, dumb trait, or wildmen cannot read, and they cant learn to read either
   * The other backgrounds can "learn to read". This can either happen by picking the "student" perk, or by a special new camp encounter, where an educated member can help teach someone else.
   * Learning to read takes a few days, and usually gives a debuff to the one learning, but after that, they can benefit from skill books too! They also get a small permanent xp boost, as a little bonus!
   * On a minor note, skill books now have new art (different book color by type, like armor, weapon, class etc.) and are now also slightly more expensive
* **Ranged Weapons Rework** (~45 Items changed)
   * Let me just say that this would be SUPER LONG if I wrote in detail, so ill try to keep this part compact. Look at PoV Server, at the progress_report channel for more details
   * Here is my general design around it: Make some usually disregarded weapon choices more viable, town down the latest ranged weapon superiority with recent legends updates, and also provide some new spicy stuff. Here comes:
   * **Throwing Weapons**
     * Most thrown weapons allow for melee attacks, usually a weak variant of the weapon's type. So Throwing axes would get "Weak Chop". The damage of these skills can be improved with relevant perks
     * Also reworked the goblin bolas, to make them an actually viable choice among the others, now they require less ap to use, and have slightly more ammunition. Also, there was a named version of them made
     * Throwing axes get the "Ranged Split Shield" skill, if the user has the "Shield Breaker" perk. The skill functions like the throw spear skill, targeting enemy shields. 
   * **Bows**
     * Their damage, armor penetration and armor effectiveness was slightly lowered, with the higher tier weapons getting less nerfs (so now higher tier weapons are even more worth getting, and dangerous to fight against). Some bows were treated differently:
     * The wonky bow was nerfed a lot, its practically useless now
     * The masterwork bow on the other hand, was buffed to the point that its now on par, or even better than named bows, getting increased damage, armor pen and range.
     * The composite bow was also changed, it is now the most efficient option for damaging armor, and decently strong, resting between the hunting and war bow in strength
   * **Handguns**
     * Slightly increased damage against armor, but also slightly reduced the weapons durability
     * 2 New handgonne weapons were also added to PoV, as part of new enemy additions. Details in New Features
     * Also, handguns were made to be more weighty
   * **Crossbows**
     * Now all crossbows have 6 range (the weaker ones had 5 before)
     * Their damage remains the same, but their damage vs armor was very slightly lowered.
     * Instead of all crossbows having flat 50% armor penetration, now the weaker ones have 40, going up to 50 with the stronger ones
     * The goblin crossbow specifically was changed differently to differentiate it more from the heavy crossbow, and is now weaker in armor penetration, but much stronger in armor effectiveness (95%)
     * Named Crossbows will now do more damage with the "improvised strike" skill
   * **Slings**
     * Slings were essentially treated in 2 categories, the one handed and the staff sling variants
     * Both see reduced damage, armor effectivness and especially armor ignore. The buffs are especially larger on the staff slings, as I think they were previously overtuned
     * These changes might sound like "too much" but slings were pretty dominant lately, and I believe they overshadowed some other weapon choices (and enemies)
     * On the other hand, I gave players a new toy for slings: **Sling Ammunition** (Described in New Features)
   * **Special Ammunition Rework**
     * In general, both the armor piercing and broadhead arrows and bolts were significantly altered, to make them more viable to use, increasing the power of both their strengths and their weaknesses
     * Armor piercing ammo does less damage and is less effective against armor, but offers higher injury chance, and more armor penetration
     * Broadhead ammo is meand for lightly armored opponents, so while easily stopped by armor, it does more damage overall
* **Soft Skills Rework** (~ 10 Skills Total)
   * Some legends and vanilla skills, new and old, were tweaked. Some are indirectly described in the aforementioned sections.
     * The monk prayer skills cost less ap and fatigue
     * The "hartseeker" skill now does more damage and has higher armor penetration
     * The company banner item also gets the heartseeker skill  
     * Improvised Strike: Increased damage and armor effectiveness. Added the skill on handgonnes too. This skills damage is further increased, and fatigue costs reduced, when having the crossbow mastery perk.
* **Soft Perks Rework** (~ 35 Perks total)
   * By soft I mean that the perk system was left largely unchanged, I only made small changes, tweaks and additions where I felt like :). A big drive behind these changes was to give the perks interaction with legends camp mechanics, so now some perks can for example increase a character's "Gathering" skill.
   * Most changes are indirectly described in the aforementioned overhauls, so here ill focus on only some new stuff (tldr)
     * Ore hunter, Pathfinder, Herbcraft, Medicine perks, bags and belts, woodworking, bard perks, cooking perks, falcon: All grant some camp benefit, or world movespeed, or stash space
     * Recuperation perk reduces chance to get drunk, and prevents the hangover effect
     * Pugilist perk: Further improves kick skill, with increased damage, that now also scales with current body armor!
     * Field Triage: Active skill was buffed, now does a heal with both a flat value and one based on max Hp
     * Thrust Master: Also slightly increases damage with Javelins and Thrown spears     
* **Holy Water Rework**
   * No longer requires a retinue to refill, now just costs ammo
   * Its damage is changed, instead of doing flat damage, it now does less flat damage, but with % Health damage on top. This way, lower health enemies (like skeletons) will take slightly less damage from it, but most other undead, or undead mutants, especially with high hp, will take more
   * On top of that, the holy water effect now reduces the target's damage done and increases the damage they take.     

### QoL / IMPROVEMENTS

* **When Dissecting corpses in crafting tent, you will now see in the camp report exactly what items you got**
* **Vastly improved Pov's compatibility with Fotn** (PoV's overhaul changes wont apply when playing with them both)
* Compatibility with Accessory Companions was improved
* Compatibility with Fantasy Bros was improved
* Many **new popups were added**, explaining mechanics and what happens, when using the trial of the grasses, mutagens, or skill books.
* Vattghern trait tooltip will not display wage multiplier, if the Vattghern is paid 0 money 
* Having a vattghern in your company can now unlock some retinues
* All mutagen tooltips and item descriptions were improved
* Improved compatibility with latest legends updates
* Also, in the process of preparing for some new legends updates and compat with them
* All bucklers tooltips improved, to describe their additional effect
* The tooltips of PoV origins were reviewed and improved

### BALANCE / TWEAKS

* **Vatt'ghern Tweaks**
   * Making a vattghern is slightly easier, as the mood penalty of using the trial of the grasses was reduced a bit
   * Mutation sickness duration slightly reduced
   * The "Vatt'ghern" trait is visible in combat, to keep track of effects like regeneration
   * Vattghern Trait's wage increase now scales with kills like the other vattghern starts, starting lower but ending higher. Meant for a more smooth and believable transition and actually a buff to supporting vattgherns, who dont get many kills (like the hexe one)
* **All new PoV's Enemies now have improved scaling with difficulty, and time passed**
   * New formulas were used, for a more smooth and controlled effect, which I can edit easily
   * Especially in Legendary, enemies will be formidable indeed!   
* Unhold mutation now also buffs unarmed damage
* Schrat Mutation now also increases shield skill damage
* Flesh golems no longer get battleheart, nimble, or anchor, but they do get increased health now
* The vattghern miasma skill now has 2 turns cooldown, instead of being usable just once per battle (applies to enemy undead mutants too)
* The lindwurm acid of the player mutations was buffed
* Some of the weaker enemy mutations (like beast) were buffed
* Alcohol distillation time now varies depending on items used (less alcoholic items = more time)
* With the *SSU Tweaks* setting enabled, enemy scaling will be slower when playing with SSU!
* Beasthunters, Ranger, Poachers origins start with some additional goodies
* Increased the fatigue cost of the "PoV Charge" skill - blame snow :)
* Enemy Hex mutation buffed a bit - also blame snoe :)))
* Slightly increased mutants spawn rate in lower combat difficulties
* Arena Armor attachments removed from armorsmiths
* You will now be offered a better price for your mutagen, in the mutagen sale event!
* Vattghern medallion now also grants +5% damage vs mutants, beasts, undead

### ART

*Of course, this is about changes or tweaks to existing art, for as you can imagine with so many new things tons of shit were added*
* Improvements to main menu, origin and some events art
* Improved the rustungeist art perspective

### MISC

* 20 More PoV loading screen tips were added
* Vattghern (and the new mutant background) can now appear in random company scenarios
* Memed with the hates everything perk a little bit (new possible trait unique to it)
* Enforces a more recent legends version
* As always, memed around :))

### FIXES

* Fixed some enemy mutants getting 2 special prefix names instead of 1
* Fixed Rot mutation affecting allies (wardogs could do that xd)
* Resolved potential issues with some new PoV Events
* Fixes a minor issue with mutagen upgrades

## Changelog V1.1.9 "Afterparty" Edition:

* Solved an issue with the basilisk mutagen granting much more fatigue recovery than intended (issue was around for like 7 months xd)
* Also, improved the mutagen's effects a bit, slightly buffing its buffs and nerfing its debuffs
* Steps are being taken to improve compatibility with mods like fantasy bros. Not much present in this version, but in the next big update expect better compat.

## Changelog V1.1.8 "Afterparty" Edition:

### NEW STUFF
* A new event was added, ill not saying much the shadows are watching
* As a thank you to the community members of PoV, who were active and/or helpful, their names are now immortalised in the mod. The next recruit or bandit champion might be someone you know
   * I also memed with character names a bit
* Also, some names were added for towns, castles, world locations, noble houses and mercenary companies
* 35 New Loading screen "tips" were also added 

### BALANCE
* Ghouls were buffed
* Alps, Direwolves were slightly buffed
* Goblins nerfed across the board, nerf scales with combat difficulty, in Legendary is light, in beginner its big
* Pov's buffs on flesh golems were greatly toned down
* Rustunggheists (Armored Ghosts) were toned down a bit
* Crafting materials for the trial of the grasses should be found more often and slightly cheaper on alchemists and black markets
* The following starting scenarios have some additional starting items: poachers, ranger, beast hunters, anatomists

### IMPROVEMENTS
* Improved the original Main Menu art
* The "camp report" text and art were redone

### MISC
* Removed the X-mas decoration (hats and main menu art)
* 3 new unique names for enemy mutation combinations

## Changelog V1.1.7 "Merry X-Mas" Edition:

* Updated Main Menu Art!
* Added a new thematic celebratory hat! (vanity layer)
   * Has 2 variants
   * All scenarios start with 2 of these hats, one for each variant
   * More can be found in marketplaces
   * They also come with a few minor bonuses
* (Clarification) If you do not want to see the main menu art, you can toggle it in mod options -> PoV   

## Changelog V1.1.6 "Fix me Daddy" Edition:

* Improved the main menu screen xmas art!

## Changelog V1.1.5 "Fix me Daddy" Edition:

* Added some xmas decoration in the main menu screen!

## Changelog V1.1.4 "Fix me Daddy" Edition:

* Fixed an error with the flesh golems

## Changelog V1.1.3 "Fix me Daddy" Edition:

* Another fix for the vattghern medallion. Was not a "fatal" issue

## Changelog V1.1.2 "Fix me Daddy" Edition:

### BALANCE
* Vattghern Background gets +4 Threat, and an improved tooltip
* Mortar shell damage greatly increased, effectiveness against armor doubled
* Strain Mutagen XP gain increased from +20% to +30%
* Goblin mutation tweaked:
   * Also reduces AP and Fat cost of reloading ranged weapons
   * Ranged damage bonus increased to +30% when using goblin spiked balls
* Buffed the "ghost plates" armor attachment
* Buffed Hollenhunds (decent bonus to HP and attack, slight bonus to mdef - buffs increase after day 70)
* Darkflight cannot be used by player/enemy mutants if they are rooted, or under the holy water Effect
* Vampire mutagen debuffs reduced from 15% to 10% when fighting at day
* Adjusted enemy mutation appear chance with scaling option enabled
* Tooltip of the silvering kit tweaked to better explain the damage bonus and penalty application conditions
* Reduced Distilled Alcohol item value by half (you could get an infinite money loop before)

### IMPROVEMENTS
* Tweaked splash art of the "New Company (PoV)"
* Tweaked art of the "Rotten Flesh Ammo Bag"
* Improvements to Various Mutagen tooltips
* Vampire mutation tooltip properly explains the addition of the darkflight skill

### FIXES
* Enforces Latest Legends Version (includes many fixes)
* Rot mutation will now not apply to allies (so your mutant wardogs will now not iflict that on you)
* Fixed an error caused by a missing item
* Fixes a "holy fire" skill crash due to missing sound files


## Changelog V1.1.1 "Fix me Daddy" Edition:

* Fixes a fatal issue with version 1.1.0
* Enemy mutation scaling option tweaked, early game starts with less mutation chance for a smoother start, but as game progresses chances gets higher, for hopefully more interesting gameplay at lategame 
   * (For example, on day 5 mutation chances are -30%, day 60 base chance, day 100 +10%, day 150 +25%, day 260+ +75%!)
   * Additionally, with this option enabled, after day 120 mutagen drop rates will be slightly lower, to compensate for more mutants appearing (you should still get slighly more drops with this option enabled)

## Changelog V1.1.0 "Fix me Daddy" Edition:

### BALANCE 
* Enemy undead mutants HP penalty increased, resolve increased
* "Purify Location" vattghern contract's reward increased by 3.5x
* Spawnlist of that contract slightly optimised, for a more balanced encounter
* Lindwurm player mutation was buffed to be even more effective against armor. Also added a slight flat mdef penalty
* Swertgeister were buffed, with 25% more HP, and a slight boost to attack and initiative
* Rustungheists were buffed (and fixed), gaining +100 Body and Head armor, +25 Resolve (for fearsome), +5 Attack, but Halved ranged defense
* Saplings spawining in early game via an enemy mutation were weakened, losing attack, HP and defense (medium nerf until day 30, small until day 50)
* Enemy Possessed enemies morale and resolve were buffed (were too easy to route)
* Corpse drop rate of ifrits slightly lowered (was slightly overtuned)
* Corpse drop rate of many "swarm" type enemies increased (I lowered it too much in previous version, but now its still lower than pre 1.0.0)
* The Fear/Hate Mutants traits were tweaked to be more interesting and impactful
* Death chance of using the trial of the grasses raised by 10% (I lowered it more than intended in 1.0.0)
* Player Ghoul Mutation's Penalty to ranged skill halved (to allow for some hybrid style skill/perk usage)

### IMPROVEMENTS
* Enforces Latest Legends Build
* Autopsies of corpses named more consistently ("experiment" -> potion brewer, "autopsy" -> field triage) 
* Tooltips describing effects both flat and percentile at the same time were made more clear
* Vattghern background can no longer spawn with "dumb" or "superstitious" traits
* Sale value for mutagens slightly randomised in a certain event
* Some item names and tooltips were changed to be more accurate/consistent
* The "Holy flame" skill tooltip now hints on some additional interactivity
* The two vattghern ambitions will not be available on origins where you start with a fully geared vattghern (no duplicate vattghern swords)
* PoV's "Intro" Event rewritten to be more to the point, and descriptive

### FIXES / TYPOS / MISC
* Player controlled mutants will not receive dynamic new names - caused a ui bug
* (Credits to Pot) Fixed a fatal error with the Spider Upgraded mutation
* Many, many typos on many different tooltips, events etc. (Credits to TYN, Lite, Dimon)
* (Credits to Chopeks) Removed double calls of the same function in a few files
* Fixed an issue occuring when enemy ghoul mutants use "Gruesome Feast"
* Orc Bersekrers and Elites now properly get special injury effects (they didnt before)
* Geisthasser trait will no longer spam icons in battle (lets make snow happy)
* Attempted to fix the new PoV banners not properly appearing ingame sometimes
* Fixed the "SSU Tweaks" option not properly working
* Fixed ifrit mutations armor not properly applying on player and enemies
* Fixed vattghern medallion sprite not appearing in battle on the one who wears It
* Fixed the infamous dissapearing vattghern medallion!
* Fixed a crash caused by using the Charge skill form the orc mutation, while having the ambidexterous Trait
* Fixed various HP reducing effects causing low HP enemies to have 0 HP, crashing the game
* Fixed rustunggheists being oneshot with direct damage skills (like shatter armor)
* The "Consecrated" effect is now handled by pov in a way that is more compatible (Previously, there were conflicts with SSU)
* PoV's github page also improved, with more clear instructions, a new License, and some other helpful files

## Changelog V1.0.0 Public Release:

### NEW STUFF
* Compatibility with new Legends Update 19.2
   * Newly added enemies - added into the eemy mutation system
   * Perks of the vattghern background updated
   * The vattghern background was also made much more useful in camp activities
* A new contract type - vattghern contracts.
   * These can only be available if you have a vattghern, AND also have more than 525 renown.
   * The first conctract added: To cleanse a location full of geists
   * Completing it also gives a chance to recruit a soldier background bro, footman, warrior, or arbalester!
* New enemies: The Possessed!
   * These enemies are possessed by geists, and fight against you, having improved skill thanks to the unnatural influence on them
   * 7 Varitants: Possessed Bandit Raider, Footman, Billman, Arbalester, Witch hunter, Mercenary, Greatsword
   * These enemies are variants of existing ones, but with unique visuals, tweaked sounds, and a new effevt making them stronger
     * They are part of the new contract, and can also appear in undead armies during the undead crisis

### BALANCE
* Slightly buffed the Swertgeist and the Rustungheist
   * Increased base stats, added a few new perks
   * Also improved their ai in combat
* Buffed the infused plates craftable item

### FIXES
* Correctly enforce new legends version!
* A few typos here and there
* Fixed a crash, thanks to a weird interaction between PoV and MC
* Fixed a few errors caused by PoV's edits of Rotu
* Fixed the coat with acid skill not applying the effect
* Improved the rustungheist art (better perspective)

## Changelog V0.4.1 Pre-Release:

### NEW THINGS
* Added a custom new PoV Banner! (With also shield sprites, and all related company stuff)
* Also added a new PoV Tabard (can be painted in tent, variation of the common tabard)

### BALANCE - TWEAKS
* Swertgeister will spawn slightly less often

### FIXES
* Lots of groundword for upcoming dependency updates
* Fixed an issue of PoV attempting to mutate stuff while in world map
* Fix to PoV's brushes (metadata files typos)
* Fixed some hooks when playing with Rotu
* Corpse Items were re-implemented properly (mostly code improvements)
* Fixed 2 of PoV's crafting recipes not working properly (Medallion and ToG)

## Changelog V0.4.0 Pre-Release:

Obviously not save compatible lol
Big, big changelog this time. Things will be divided into many subcategories - Go and look at whichever interests you :)

### NEW ENEMIES
* Added two new "ghost"/spirit type enemies. All with new custom effects, animations, sounds, art, mechanics and drops.
* Both of these enemies can appear wherever you would normally encounter geists, and during undead crisis in any undead party
* Swertgeist (Sword Ghost)
   * A gheist enemy with a twist - its melee. Has single and aoe melee attacks with an atherial 2H Sword. Attacks have high armor penetration.
   * At the same time, it has very high defenses and damage resistance (aetherial effect), until it attacks. 
   * After attacking, it becomes "Corporeal", open to attack. When taking damage while having this effect, it becomes aetherial again.
   * Holy Water and the Concecrated effect make it stay corporeal!
   * Has the fearsome, overwhelm, feint and some other interesting traits.
   * Gets stronger as ingame days pass (stats), and in legendary difficulty
   * Difficulty wise, it is meant to be almost as challenging as the banshee, if not slightly more difficult
* Rustunggheist (Possessed Armor)
   * The other new geist enemy, also with a twist -  its tanky and armored. A spirit possessing a big set of armor, attacking enemies with it, while protecting itself.
   * It has 4 different melee attacks, all using the armor itself (punch,kick,headbutt). Its attack damage depends on its current armor, and the attacks themselves can stagger,baffle,daze or stun, depending on skill and part hit (head/body)
   * The only way to kill it, is to attack one of its 2 body parts when they have less than 10 Armor. So you have to destroy its armor to banish it
   * Instead of damaging it, holy water and concecrated effects reduce its damage done, and increase its damage taken by all sources.
   * Has the fearsome, steel brow, and battleforged perks
   * Gets stronger as ingame days pass (stats), and in legendary difficulty
   * Meant to be a more rare, and challenging encounter

### MUTAGENS REWORK - EMENY MUTATIONS
* Enemy Mutations are now always active - no longer optional.
* Enemy Mutations also now appear appropriately to enemies (they did not do that fully before...)
* Enemy Mutations Scaling: Enemy mutations will appear more often as days pass - optional, on by default. Special interaction with chaos mode -
* Buying mutagens should be slightly cheaper
* Tweaked all player and enemy mutations, adding them unique skills and passives (usable by both player and enemy AI).
   * Purpose is for each mutation to add at least one new skill and/or effect
   * Mutations with new skills/effects: Ghoul,Schrat,Undeath,Vampire,Beast,Hexe,Ifrit,Serpent,Unhold,Donkey
* All mutations and their previous skills/effects were rebalanced, to be more interesting and impactful
* All mutations items and effects text reviewed to be more descriptive
* Added mutation Upgrades!
   * From corpses of legendary monsters (like the white wolf), one may now get a "Mutation Upgrade"
   * These are meant to upgrade existing mutations, so Direwolf Mutagen Upgrade can only be used by one with the Direwolf Mutation
   * Usually these vastly improve the existing mutation, while limiting by a lot its negative aspects
   * Mutation upgrades can also rarely drop from champion monsters (if those exist, like with the MC mod)
* Because of the increased power of the mutations, enemy mutants will appear slightly less often
* Mutagen drop rates made more reasonable (lowered - mutagens are supposed to be rare)

### STORYTELLING - PROGRESSION
* Added a few events that will guide the player into the PoV mod, in a nice thematic way
* Added an "intro" event that fires at the beginning of any playthrough, giving general information about PoV (can be disabled in options)
* At the beginning of most playthroughs (all non-PoV origins), corpse drops, mutagen drops and sales, and some crafting recipes and unique items will be "locked"
   * Player will have to do specific things, outlined by said events and ambitions to progress
   * Briefly, player's milestones should be: Kill a mutant, get a mutagen, craft the trial of the grasses, get a Vattghern, gather materials for a vattghern sword!
   * Each time such a milestone is complete, an event will inform the player, and guide them to the next step!
   * For example: killing the first mutant in a playthrough unlocks corpse and mutagen drops! as well as related events.
* PoV's origins have all these milestones complete, as you start with a vattghern.

### ORIGINS
* New Vattghern Background -  To flesh out existing and new PoV origins, and tweak starting stats, equipment, perks, and available perks.
* "Path of the Vattghern" Origin tweaked, its penalties made less serious.
* Added 2 New PoV Origins and tweaked the existing one for 3 total, each serving their own purpose
   * PoV Solo origin: Like the Vanilla "Lone Wolf" origin - but you start with a strong vattghern instead. Simple origin for now, with planned features for the future.
   * New Company (PoV): Almost the same with the normal New Company origin, tweaked for more interactivity and storytelling
     * Start with a retired soldier, a woodsman, and a poacher.
     * They start with set talents, slightly boosted stats and specific equipped items. Also start with some very basic supplies.
     * To balance out the additions, start with half the money and 25% less medicine, compared to the normal "New Company" scenario
     * The main idea behind this origin is that I liked playing "the new company" scenario, but did not like the 0 event and camp interactivity of the "companion" backgrounds 
* All PoV Origins (except for the New Company one) also get slightly increased corpse and mutagen drops from enemies (+ 10 - 15%)
   * Rangers, Beast Hunters, Anatomists origins also get a similar bonus

### TRAITS
* Pluviophile - Gain some nice bonuses to resolve and initiative while fighting in rain! (And immunity to rain penalties - if and where those apply)
* Geisthasser - Hate VS Spirits kind of trait, granting a big resolve bonus, and some melee attack. Also slightly buff allies resolve in a 2 cell radius while in battle against geists

### EVENTS & AMBITIONS
* Added a new ambition to craft a vattghern sword - unlocked when you have a vattghern over lvl.11 (the ambition clearly states what is needed to be complete)
* Ambition to get a vattghern now appears more organically, when you would most likely want to go through with it.
* Added a nice little event related to a new crafting item: Distilled Alcohol (see below)
* New Intro events for the new PoV origins (see below, again :p) 

### ITEMS REWORK
* Reworked of the Vatt'ghern Sword (Including new art - again)
   * Generally Buffed, only slightly weaker than a greatsword on paper, but more versalite, and stronger against mutants, undead and monsters
   * Can now get it in any origin, via a special ambition to "craft" it
   * Only the vattghern can properly wield it. Others can too, but will be debuffed while holding it (bringing it down almost to longsword level strength)
* Reworked the Vatt'ghern medallion
   * Can only be equipped by a vattghern
   * Once you get your first one, you also unlock its crafting
     * You need one silver and one iron ingot to craft it

### NEW ITEMS
* Silver Bars - New "Trade" Item
   * Have high value, and can mainly spawn in settlements with gold mines, and ore smelters
   * Is also craftable, by melting two of Silverware of Silver Bowls, with a bro that has the "Spare Tools" perk (added in perk's description too)
   * Other than trade, they are mightly useful for some new recipes, and ambitions (like to get the vattghern sword)
* Spectral Armor Patch - A new armor attachment, that you can get via a new enemy (Rustunggheist)
   * Gives some good amount of armor, and 30% Damage resistance against spirits, and 10% dr against other undead
   * Can be crafted using an iron ingot and "spectral armor shards" - special loot that you can get by dissecting a Rustunggheist Corpse
* Distilled Alcohol - A new crafting item
   * Can be crafting by combining any of 2 alcoholic items (15 Recipes in total!)
   * Usable for the crafting of important things, like the Trial of the Grasses (thing of it like the "alcohest" from witcher games)
   * You can also buy it from alchemists, or rarely find it as loot from roaming flesh golem parties!

### TRIAL OF THE GRASSES 
* Death Chance lowered across the board by 10%
* Removed the requirement of the Vampire Dust item to craft it
* Replaced it with a requirement for the new "Destilled Alcohol" Item

### MODS INTERACTIONS
* Rotu: Jotunn, Pink & Blue Horrors, now part of the enemy mutation system
* Fotn - optional (In PoV Mod Settings): Some balance tweaks
* SSU - optional (In PoV Mod Settings): 
   * Removed Sequences
   * Remove random sequence effects on enemies 

### PoV WIKI - MOD SETTINGS
* The mod settings page of PoV was re-improved, with much more detailed and clear in what they do settings
* Also added a brand new wiki for the mod, integrated in the settings page (Wiki tab)
   * There, you can find a TLDR of the most important info for PoV

### ART
* Many mutagen items art redone
* Revisited some old event art from early versions
* Improved the Vattghern Eyes
* New icon for "Beastslayer" trait
* New Art for the Vattghern Sword!
* Also new art for all of the sword's skills!
* Some effect arts and icons were improved

### IMPROVEMENTS
* Lots of re-organisation of my code (like y'all care :( )
* Most of pov's active skills now have appropriate overlays
* Misanthropist needs 23 less kill to become a psycho
* Perk descriptions that pov adds should properly appear with any other mod combined (SSU, Fotn etc.)
* Added Perk descriptions to adrenaline and spare tools, for what they do in PoV
* Vattghern trait tooltip now shows available mutations until you hit the limit
* Vattgherns have a higher chance to survive being struck down (+33%)
* Corpse Drops rates reduced across the board - for better balance and to accomondate new changes
* Alchemist retinue no longer prevents corpses from being used when crafting (was too OP)
   * To compensate, it now increases corpse and mutagen drop rates by 15% (multiplicative)
* Antidote now cures new poisons added by PoV (mutant poison, rot etc.)

### FIXES
* As always, a fuckload of typos
* Fixes to some new traits not appearing
* Fixed a crash caused by Rot Bullets
* Fixed wrong sound playing when using A hexe mutagen (sounded like a goblin)
* Fixed a case where the enemy hexe mutation could cause an infinite loop (oops)

### MISC
* Memed, a lot this time. You may see
* Hey sos <3

## Changelog V0.3.15 BETA:

### NEW ADDITIONS
* Added a brand new enemy mutation to the enemy mutations roster: rot! (With now a total of 17 Possible Mutations)
   * Its effect is quite similar to the "Unbearable Stench" passive that I added previously to PoV, granting an melee range aoe debuff to enemies
   * Its drawback is that while it turns an enemy into a strong melee debuffer, it slows it down, reduces its resolve, and slightly reduces its defense, and gives weakness to fire
   * Enemies who bear that mutation have a chance to drop the "Strain" mutagen
   * The player can also obtain this effect, via the "Strain" Mutation
   * Due to this being now a mutation, zombies cannot have a chance to obtain this effect via other means (previously they could get it)
* Expanding the dynamic enemy renaming system from the enemy mutations.
   * Now, other than the default title enemies gain when getting their first mutation (eg.: "cunning" for goblin) now there is also another possibility
   * If an enemy rolls more than one mutation, and two of those happen to belong to a "Set", the enemy will get a more rare, "special" name
     * Example, an enemy with the Sandgolem and Schrat mutations, will now receive the "Impenetrable" title.
     * Currently, there are 20 such combinations and possible titles, and Im looking to expand them, any ideas very appreciated!
* ANIMATIONS!!!
   * Now, the green glow of enemy mutants will be animated (soft fade in and out, with scale change). 
   * Also, enemies with the rot mutation or the unbearable stench effect will also have their "stench" effect in battle animated

### IMPROVEMENTS/TWEAKS
* The green bust sprite that the mutants have, will now be more visible if they are champions, and will show up in the turn order preview!
* Chaos Mode and Enemy Mutations Systems are now more independent from each other
   * With Chaos Mode enabled, now enemies will receive fully random mutations only. Not in addition to what they could roll normally (as it was before)
   * To compensate, mutation chances of the enemy chaos mutations were slightly raised 
* The in battle art of PoV's "Mace/Whip" weapons was improved to be less....weird
* The "Mace Whip" was more appropriately renamed to "Whip Flail"

### BALANCE
* The Scaling of enemy mutations (how often they appear) was tweaked to be more reasonable
* The Stench effect

### FIXES
* Fixed a typo in the "Many corpses" event
* Fixed Schrats not being able to mutate
  
## Changelog V0.3.14 BETA:

### IMPROVEMENTS/TWEAKS
* The PoV Scenario was tweaked
   * Penalties of the origin reduced
   * Other than beast slayers, valas and people with "hates beasts", now the origin also has bonuses when recruiting druids, and people with the "hates mutants" and "hates everything" traits
   * Starting supplies now include one unhold corpse (for thematic reasons, and as an opportunity for experimentation for new PoV players)
* All of PoV's new encounters were properly re-implemented
* All events, encounters and ambitions text reviewed and improved, with fixed typos
   * Respact the genda - All gender references in text should now be accurate
* PoV Settings page further improved. Added better description for some options to avoid issues
   * Added some information in the PoV server, about recommended mod settings
* All mutagen item tooltips improved
* Mutagen items preview in crafting screen should be better (no more text overflow)

### BALANCE
* Vattghern Unhold Mutation Revisited - Added a risk/reward aspect to it
   * Now, when between 75 - 100 %HP, grants linearly scaling bonus damage based on the vattgherns max HP
     * Maximum Damage Bonus is 8% of Vattghern's max HP when on 100% Hp (So A 150HP Vattghern would receive 12% Bonus Damage). Bonus caps at 20% Damage
   * WHen Between 1 - 74 %HP, grants linearly scaling damage penalty, going up to -45% when on 1%HP
     * As an example, a vattghern on 50%HP would receive a -15% Damage Penalty 
* Both Vattghern and Enemy Goblin mutations were buffed. On top of past effects, they also grant +12% Ranged Damage
* The "Foul Stench" effect was slightly nerfed in its severity
* The Damage penalty against humans from the "Beast Slayer" trait was halved

### FIXES
* Vast array of typo corrections
* Fixed a minor error of a missing .png
* Fixed an error with the schrat mutation's "no shield" effect

## Changelog V0.3.13 BETA:

### NEW ADDITIONS
* 2 New Events and 1 New Encounter!
   * Beast Mutated vattghern may now tame a wolf through a camp encounter
   * One event is about the additional scaling PoV adds to its mutations (see below) 
   * The other event might help you gather more of the required materials for the trial of the grasses
* Enemy mutations now appear more often in lategame (starting from day 70). (Optional, can be disabled in PoV Mod Settings)
* A new option was added in PoV Settings "MC Tweaks". Off by default. If enabled and player has the MC mod loaded, it currently tweaks some things for balance, and removes the "Possess" skill from enemy geists (it annoyed me)
* The third eye skill from the Vattghern Alp Mutation now also grants a party wide buff, in addition to its increased vision. Cost more ap and fat though.
* Some of PoV's new effects will now spawn an in battle icon when added in battle (poisoned, rot etc.)
* Memed a bit. Maybe some unhold mutants were mutated *too much*. Also, catapults. 
* The vattghern trait now also shows how many more **normal** mutations the vattghern can get.
* A brand new PoV Title Screen!

### IMPROVEMENTS/TWEAKS
* The PoV Mod Settings page was improved, with more descriptive tooltips and new options.
* Improved some icons and tooltips (art and text).
* The Player mutations system code was made more dynamic 
* Logging was improved. May not flood logs as much

### BALANCE
* Ifrit mutations were slightly reworked to make them more viable for the player, and more dangerous on an enemy.
   * In the past, they gave damage resistance only on direct HP damage. Now they grant total damage resistance, which means they also reduce armor damage
   * Overall armor increase and damage resistance increased for both player and enemy. The penalties were balanced accordingly
* Attempted to make crafting the trial of the grasses a little easier
   * Corpse drops from enemy necrosavants slightly increased
   * Some of the ingredients of the ToG that could be found in some shops will now appear slightly more often, and with a little better prices
   * The aforementioned event
* The Vattghern "weave net" skill from the Spider mutation now costs less AP and fatigue
* Roaming flesh golems should spawn more consistently (and a little bit more often), their parties will also have better loot

### FIXES
* The "Hates Everything" trait now properly changes traits every 7 days (it was 2!!)
* Enemy corpses now drop properly
* Fixed error related to descriptions of Field Triage, and Potion Brewer
* Sounds are now played properly on successful, failed, or prohibited player mutations
* A few typos were also spotted and fixed

## Changelog V0.3.12 BETA:

* Reworked the art of the Orc Mutagen item and relevant effects
* The debuffs of the Undead Pain from Injury effect is now a stronger debuff
* "Color" was renamed to "color" in code
* Color tags are now dynamic in pov (they were made into const)
* Minor fixes to some enemy hooks related to Rotu

## Changelog V0.3.11 BETA:

* On game launch, you will now be notified of PoV updates!
* PoV Origin Assassin should now have correct perks
* Fixed the "Ghastly Touch" skill not having cooldown

## Changelog V0.3.10 BETA:

* Fixed an issue with the enemy vampire mutation dropping its mutagen
* Fixed Ghost mutation not applying properly
* Fixed enemy Alps and Direwolves not getting mutations

## Changelog V0.3.9 BETA:

### NEW ADDITIONS
* A new active skill was added "Ghastly Touch". Does armor ignoring damage, with slightly reduced hit chance, and one turn cooldown.
* This skill is added to both the Vattghern and the Enemy "Spirit" mutation (etherial attacks for the enemy)
### FIXES
* Fixed the Vattghern Serpent Mutation causing a crash when loading a battle.
### BALANCE
* The "Third Eye" active from the vattghern alp mutation was tweaked, now costs more AP and Fatigue. Grants vision in a slightly smaller radius (still very large, 15 hex)
* The HP penalty of the vattghern serpent mutation was slightly reduced
  
## Changelog V0.3.8 BETA:

* Fixed Trial of the grasses not working properly
* Fixed mutations not making the correct sound on successful mutation

## Changelog V0.3.7 BETA:

* Added some new Rotu enemies into the enemy mutation system
* Fixed the enemy mutation system, and fatal errors that it could rarely cause
* Fixed a minor brush error
* Attempt to fix an issue related to the enemy hexe mutation effect
* Restored the mutation limit for the vattghern

## Changelog V0.3.6 BETA:

* Fixed a typo and improved the vattghern goblin mutation tooltip
* Fixed an issue with the racial of frost unholds not appearing

## Changelog V0.3.5 BETA:

### FIXES
* Fixed an error with the Goblin Vattghern mutation, also tweaked its effects
* The effects applied by "coat with acid" and "coat with vattghern poison" were tweaked, so they can apply poison to all targets of an AOE attack.
### BALANCE
* Some enemy mutations were mostly buffed, to make them more interesting on enemies (schrat,lindwurm,ifrit,beast,skeleton,unhold,serpent,ghost,vampire) will explain interesting specifics below
   * Enemies with the schrat mutation will be far more resilient while holding a shield
   * Enemies with the skeleton mutation also have some resistance to cutting damage, in addition to their previous piercing resistance. They have slightly rediced Hp though
   * Enemies with the vampire mutation will receive a decent buff during night battles, but a minor debuff during day battles
### MISC
* Some descriptions of enemy corpse items were improved

## Changelog V0.3.4 BETA:

FIXES
* Actually Fixed an issue with effects adding infinite armor (ifrit, schrat enemy/player mutations) (failed in 0.3.3)
* Added some more fallbakcs in code, to avoid potential issues.
BALANCE
* Number of mutations on the vattghern, now slightly increase their vattghern trait stats!
* Flesh Golem Corpses now no longer have a chance to drop the "large red worm" mutagen component
* Now the "Coat weapon with acid" skill, slightly increases armor damage while active
ART
* Revisited the Vattghern trait icon and the trial of the grasses item icon
* Revisited the Vattghern medallion art
MISC
* Added an encounter, notifying the player for when the enemy golem parties start roaming

## Changelog V0.3.3 BETA:

* Improve the way that the enemy Spider and Orc Mutations add skills to entities. (Did not work correctly)
* Fixed a fatal issue related to the enemy hexe mutation (needs testing)
* Fixed an issue with effects adding infinite armor (ifrit, schrat enemy/player mutations)

## Changelog V0.3.2 BETA:

* Fixed crash when fighting Goblins
* Added a fallback function to the enemy mutation system, to maybe prevent some future shit

## Changelog V0.3.1 BETA:

* Improved the descriptions of all mutagen items
* Improved the Vattghern and Misantrhopist Trait Icons
* Fixed "Hates Everything" Perk incorrectly applying hate perks

## Changelog V0.3.0 BETA:

Oooh Boy, bunch of new stuff were added. This is the biggest update yet, and is the groundwork for my public release.
That said, i will devide what i dit into Categories for this one

### NEW SYSTEMS & ADDITIONS
* Descriptions for some of the mod's systems were improved, mainly:
   * Mutation Sickness Trait now better describes how it works (the more you get, the less they last for)
   * Corpses will hint a little better as to what they need to be dissected
   * The "Field Triage" and "Potion Brewer" perks have now updated tooltips, describing their function in PoV
* Reworked the Flesh Golem Enemy!
   * Buffed so they are much more sturdy, but also slower and weaker in defense. Also weak to fire.
   * Added into the enemy mutation system (with appropriate mutations)
   * They also get the new "Unbearable Stench" ability. A passive AOE poison/debuff
   * They have new corpse drops, with unique new crafting, loot and special items (Grafted Flesh, Ivory Spine Shard, Rot Essence)
   * There is the possibility for enemy roaming parties of flesh golems! (Belong to undead "zombie" faction)
* Special Item Framework
   * Made a framework for a new "loot" item type, special loot. They have their own distinct art effects.
   * These can only be obtained via corpse dissection, with low chances
   * They can be used for special crafting recipes, to get powerful items, or sold at a high price in towns, combining the propertie of crafting and loot drops.
* New Ammunition for handgonnes: "Rotten Flesh Ammo", craftable from the newly added items!
* The mod's injury system was slightly reworked. Now, not all entities will react the same to be injured, namely:
   * All debuffs that are got upon being injured now last for 2 turns instead of 1
   * Most will still just receive the "Severe Pain" Debuff upon injured, but:
   * Orc Bersekrers, and entities with the orc mutation (player and enemy) will receive a buff instead, granting them increased aggression!
   * Undead, if and when they are injuted, will now receive the "Destabilised" debuff, which instead of reducing their damage and action points, it will reduce their defences and increase their damage taken instead!
* The spider mutation was buffed, with the addition of the "Weave Net" Skill. Similar to what the spiders do ingame, Spider Vattghern and enemy mutants can now use this skill too, and from a slightly longer range!
* Enemy mutants with the orc mutation can now use the "Orc Charge" skill, same as with the orc mutated Vattghern
* A new skill was added to the Player vattghern with the lindwurm mutation, "Coat With Acid". By inflicting damage to themselves and their weapon, they coat it with corrosive acid, which can be then used to damage enemies and apply them the corrosive acid debuff, damaging their armor over 3 turns.
* All Wardogs, Warhounds and Warwolves are now part of the enemy mutation system
* All Enemy Mutated Enemies will now have dynamic new names during combat. Think of like a bandit rabble with the orc mutation can be now called "Savage Bandit Rabble"
* Unhold Corpses did not fully work correctrly before, now different unhold types will drop different corpses (frost unhold -> frost corpse). Also, bog unholds now have fire resistance instead of weakness.

### ART
* All of the aforementioned additions have their own new art.
* Full Rework of all of PoV's events art
* Some assets improved in quality. Mainly the "Trial of the Grasses"

### TRAITS
* Added Hates Everyone Trait, every week, the brother gains 2 different hate perks, all available from a pool of all the hate perks ingame (Legends, PoV, and Vanilla). Cannot have the same perks as the previous ones when rerolling
* Upgraded Charming Perk, obtainable via an event

### EVENTS
* A bro who has the hates everyone trait, may interact with a bro who does not have any hate perks, granting them one for free
* An event between the hexe mutant bro and a crusader bro
* A special interaction event between a charming bro and a hexe mutant, upgrading the charming trait of said bro
* With all these additions, the mod now boasts 14 New Events, and 6 New Encounters!!
* Enemy Mutation chances slightly tweaked. Weaker enemies will have slightly lower mutation chances, and stronger enemies slightly higher.

### BALANCING
* Fire resistance of many beasts tweaked, beasts weak to fore damage will also receive more damage to their armor, not just their HP (its their fur that burns after all)
* Enemy Zombies and Undead can now also have the "Unbearable Stench" Effect, which has a medium difficulty based chance to appear on them.
* Slightly increased Vampire corpse drop rates
* Enemy Hexe mutation was nerfed, now should be less punishing
* Enemy Spider, Orc, Beast, Basilisk, Skeleton, and Unhold mutations were buffed, either with better stats or new skills
* Some Player Mutations Buffed: Spider (new skill) , Wurm (new skill), Strain ("Unbearable Stench" Passive), Skeleton (better stats) and Orc (Better Stats).
* The "Nyctophobia" Trait was toned down, now less punishing and grants slight resolve bonus during daytime
* The "Path of the Vattghern" origin was tweaked, with the addition of some useful starting items (more start supplies, medicine, and a random mutagen)
* The "Old" trait that the starting vattghern has was turned into a unique trait, with far less severe penalties.

### MISC
* PoV's mod options were improved (more readable)
* Also, a new option to toggle my main menu art was added (so people could use other art, like ROTU or Vanilla), thanks Necro!
* Hate/fear mutants traits now will not spawn if the enemy mutation system is disabled in options!
* improved Corpse Dissection Tooltips, now more precise with their descriptions, and added new icons to the food and value drops
* Some Corpse autopsies can drop new value items: Hexe (Jade Brooch), Necromancer & Vampires (Ancient Scroll)

### MODDER STUFF
* The Mod's Enemy Mutation System was pretty much rebuilt from the ground up. (That was 220+ files...) Now it is far more dynamic and modular, which means that other mods could now hook into PoV and create their own enemy mutations!
* Autopsy and Corpse Items were fully reorganised into their own respective folders.
* Logging of some of the mod's systems was improved

### TYPOS/FIXES
* As always, a plethora of typos were found and fixed
* Fixed an issue with injuries, that some people had
* Unhold Corpses now drop correctly
* Improved SSU Compatibility
