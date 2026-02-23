this.destroy_flesh_location_contract <- this.inherit("scripts/contracts/contract", {
	m = { 
		Destination = null,
		Dude = null,
		Reward = 0,
		OriginalReward = 0
	},
	function create()
	{
		this.contract.create();
		this.m.Type = "contract.destroy_fles_location";
		this.m.Name = "Purge Undeath Flesh Cults";
		this.m.DescriptionTemplates = [
			"A hidden enclave festers nearby, where forbidden rites twist flesh and bone alike.",
			"Men and corpses alike are being reshaped into something profane.",
			"A cult meddles with life and death, stitching horrors in the dark.",
			"Patrols vanish. Graves are disturbed. Something foul is at work.",
			"Unholy experiments stain the earth nearby. They must be ended.",
			"The cult seeks mastery over death. They must be shown its finality.",
			"Abominations roam where scholars once stood.",
			"The earth rejects what has been created there. The flesh rejects what was its own.",
			"Their rituals warp men and corpses into golems of sinew and bone.",
			"If left unchecked, their creations will multiply. The air itself feels heavy with rot and arrogance."
		];
		this.m.TimeOut = this.Time.getVirtualTimeF() + this.World.getTime().SecondsPerDay * 7.0;
	}

	function getBanner()
	{
		return "ui/banners/factions/banner_pov_vattghern_s";
	}

	function onImportIntro()
	{
		this.importSettlementIntro();
	}

	function start()
	{
		local geistcamp = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getNearestSettlement(this.m.Home.getTile());
		//geistcamp.m.Loot.add(this.new("scripts/items/misc/anatomist/pov_witcher_potion_item"));
		this.m.Destination = this.WeakTableRef(geistcamp);
		this.m.Flags.set("DestinationName", geistcamp.getName());
		//this.m.Flags.set("RobberBaronName", this.generateName());
		this.m.Payment.Pool = 1500 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

		if (this.Math.rand(1, 100) <= 33)
		{
			this.m.Payment.Completion = 0.75;
			this.m.Payment.Advance = 0.25;
		}
		else
		{
			this.m.Payment.Completion = 1.0;
		}

		this.contract.start();
	}

	function createStates()
	{
		this.m.States.push({
			ID = "Offer",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Purge " + this.Flags.get("DestinationName") + " of Geists, %direction% of %origin%"
				];

				if (this.Math.rand(1, 100) <= this.Const.Contracts.Settings.IntroChance)
				{
					this.Contract.setScreen("Intro");
				}
				else
				{
					this.Contract.setScreen("Task");
				}
			}

			function end()
			{
				this.World.Assets.addMoney(this.Contract.m.Payment.getInAdvance());
				this.Contract.m.Destination.clearTroops();
				this.Contract.m.Destination.setLastSpawnTimeToNow();

				if (this.Contract.getDifficultyMult() <= 1.15 && !this.Contract.m.Destination.getFlags().get("IsEventLocation"))
				{
					this.Contract.m.Destination.getLoot().clear();
				}
				// Default : 115
				this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.PovFleshNecroQuest, 115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setLootScaleBasedOnResources(115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setResources(this.Math.min(this.Contract.m.Destination.getResources(), 70 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult()));

				// Add custom loot
				// 2 Random Skill Books, 2 Scrolls, 1 Exp Potion, 1 Readng Notes
				local books = [
					"scripts/items/misc/legend_armor_skill_book_item",
					"scripts/items/misc/legend_class_skill_book_item",
					"scripts/items/misc/legend_enemy_skill_book_item",
					"scripts/items/misc/legend_profession_skill_book_item",
					"scripts/items/misc/legend_trait_skill_book_item",
					"scripts/items/misc/legend_weapon_skill_book_item"
				]
				local book1 = books[this.Math.rand(0,books.len()-1)];
				local book2 = books[this.Math.rand(0,books.len()-1)];
				this.Contract.m.Destination.m.Loot.add(this.new(book1));
				this.Contract.m.Destination.m.Loot.add(this.new(book2));
				this.Contract.m.Destination.m.Loot.add(this.new("scripts/items/misc/legend_scroll_item"));
				this.Contract.m.Destination.m.Loot.add(this.new("scripts/items/misc/legend_scroll_item"));
				this.Contract.m.Destination.m.Loot.add(this.new("scripts/items/misc/potion_of_knowledge_item"));
				this.Contract.m.Destination.m.Loot.add(this.new("scripts/items/special/pov_reading_notes"));

				this.Contract.m.Destination.setDiscovered(true);
				this.World.uncoverFogOfWar(this.Contract.m.Destination.getTile().Pos, 500.0);

				this.Contract.setScreen("Overview");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				if (this.Contract.m.Destination != null && !this.Contract.m.Destination.isNull())
				{
					this.Contract.m.Destination.getSprite("selection").Visible = true;
					this.Contract.m.Destination.setOnCombatWithPlayerCallback(this.onDestinationAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Destination == null || this.Contract.m.Destination.isNull())
				{
					if (this.Math.rand(1, 100) <= 25 && this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
					{
						this.Contract.setScreen("Volunteer1");
						this.World.Contracts.showActiveContract();
					}

					this.Contract.setState("Return");
				}
			}

			function onDestinationAttacked( _dest, _isPlayerAttacking = true )
			{
				if (!this.Flags.get("IsAttackDialogTriggered"))
				{
					this.Flags.set("IsAttackDialogTriggered", true);
					this.Contract.setScreen("AttackGeistArea");
					this.World.Contracts.showActiveContract();
				}else
				{
					// This one is what starts battle
					this.World.Contracts.showCombatDialog();
				}
			}

		});
		this.m.States.push({
			ID = "Return",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Return to " + this.Contract.m.Home.getName()
				];
				this.Contract.m.Home.getSprite("selection").Visible = true;
			}

			function update()
			{
				if (this.Contract.isPlayerAt(this.Contract.m.Home))
				{
					this.Contract.setScreen("Success1");
					this.World.Contracts.showActiveContract();
				}
			}

		});
	}

	function createScreens()
	{
		this.importScreens(this.Const.Contracts.NegotiationDefault);
		this.importScreens(this.Const.Contracts.Overview);
		this.m.Screens.push({
			ID = "Task",
			Title = "Negotiations",
			Text = "[img]gfx/ui/events/event_63.png[/img]{%employer% sits rigid behind his desk, fingers steepled as though in prayer - though there is nothing holy in his gaze. %SPEECH_ON% There is a place beyond the marsh road. Once a chapel, abandoned after famine hollowed the countryside. Now lights burn within its crypt at hours when even owls keep silent. Graves nearby stand open. Bodies go missing. Not stolen for burial - stolen for use. %SPEECH_OFF% He pauses, jaw tightening. %SPEECH_ON% My patrol found more than bones. They found tables. Hooks. Stitching twine soaked black. And something half-finished that still tried to breathe. They did not stay long. Two of them did not return at all. %SPEECH_OFF% He leans forward, voice low and deliberate. %SPEECH_ON% Word reaches me that your company harbors a vatt\'ghern - one bred to hunt what should not walk. If that is true, then you are my only answer. Go to that ruin. Slay the necromancer who dares mock death, burn his fleshcraft, and bring proof that his research ends in ash. Do this, and you will be paid well. Fail… and we will soon have more graves to empty.%SPEECH_OFF% | %employer% adjusts his cuffs with visible irritation.%SPEECH_ON%There is some unpleasantness in the hills. A scholarly sect, I am told. Reclusive. Devoted to… anatomy. %SPEECH_OFF% He forces a thin smile. %SPEECH_ON%Bodies have gone missing from the paupers\' pits. Livestock too. At first I assumed wolves. Then one of the shepherd boys returned without his lower jaw, swearing he saw men stitching corpses together by lanternlight. %SPEECH_OFF% The smile fades. %SPEECH_ON% I sent soldiers. Capable men. They found an underground hall filled with diagrams and half-formed… things. Something drove them out. Something that wore a man\'s face badly. %SPEECH_OFF% He exhales through his nose. %SPEECH_ON% You travel with a vatt'ghern, do you not? If ever such a creature had purpose, it is now. End this cult. Slay their master. Reduce their abominations to carrion. Bring me proof their studies have ceased, and I will make it worth your time. %SPEECH_OFF% | %employer% stands beside a hearth gone cold, staring into ashes as if expecting them to move. He turns slowly. %SPEECH_ON% There are men who fear death. And then there are those who seek to command it. %SPEECH_OFF% %SPEECH_ON% In the ruins of the old Blackmere Monastery, a cult has taken root. They call themselves seekers of perfection. They harvest the dead. They harvest the living. They claim flesh is clay and bone is scaffold. My scouts heard chanting - not prayers, but measurements. Calculations. %SPEECH_OFF% His voice lowers. %SPEECH_ON% They are led by a necromancer of some skill. The corpses he raises do not simply stand. They are improved. Strengthened. Bound together into mockeries of design. My men fled when a stitched giant rose from their fallen comrades. %SPEECH_OFF% He meets your gaze directly. %SPEECH_ON%If your company indeed carries a vatt'ghern, send them. This is their calling. Destroy the cult. End their experiments. Bring back proof that their research dies with them. I will pay in crowns, and perhaps sleep again... %SPEECH_OFF% | %employer% wipes sweat from his brow despite the chill air. %SPEECH_ON% It began with livestock - always does, doesn\'t it? Then grave robbing. Then disappearances. And now… now we find bodies sewn together in the fields like grotesque scarecrows. %SPEECH_OFF% He swallows. %SPEECH_ON% There\'s an old laboratory carved into the cliffs near town. Scholars once studied there. Now a cult works its halls, led by a corpse-speaker who claims the flesh can be perfected through suffering. My guards saw men dragging bodies below. They heard… screaming. Not from throats alone. %SPEECH_OFF% He straightens, forcing composure. %SPEECH_ON% I am told your company keeps a vatt'ghern. If that is true, then this matter falls to you. Slay the necromancer. Break his golems. Burn whatever profane knowledge they have gathered. Bring proof. Do this, and you will have gold and the gratitude of every soul who still values being buried whole. %SPEECH_OFF% }{[color=" + this.Const.UI.Color.povEvent + "] You think to yourself that while the payment is noticably less than the usual Vatt\'ghern contract, it is made very clear that these deranged people hold very valuable research, that could prove quite useful to you.[/color]}",
			Image = "",
			List = [],
			ShowEmployer = true,
			ShowDifficulty = true,
			Options = [
				{
					Text = "{Sounds like a dangerous job, how many crowns? | What is %townname% prepared to pay for their safety? | Let\'s talk crowns. | A Vatt\'ghern\'s service has its cost}",
					function getResult()
					{
						return "Negotiation";
					}

				},
				{
					Text = "{We cannot help you here | We have more important matters to settle. | I wish you luck, but we\'ll not be part of this.}",
					function getResult()
					{
						this.World.Contracts.removeContract(this.Contract);
						return 0;
					}

				}
			],
			function start()
			{
			}

		});
		this.m.Screens.push({
			ID = "AttackGeistArea",
			Title = "Before the attack...",
			//Text = "[img]gfx/ui/events/event_54.png[/img]{While approaching the area, you are like: SKIBIDI ZOINKS TOO MANY GHOSTIES HERE OH MA GAWD, then attack anyways.}",
			Text = "[img]gfx/ui/events/event_114.png[/img]{As you near the ruin, the air grows thick with rot and bitter alchemy. Lanternlight flickers behind shattered windows, and shadows move in careful, deliberate patterns. Graves nearby lie opened with precision, not desperation. Hooks hang from beams. Tables sit beneath stained canvas. \n\n You glimpse robed figures dragging something across the courtyard - something that twitches against the pull, leaving uneven trails in the dirt. The chanting that follows is steady, measured, almost scholarly… broken only by a wet, labored breathing far too deep for any single chest. \n\n This is no rabble of grave-robbers. This is craft. Flesh shaped with purpose. Bone reinforced. Golems stitched from the unwilling, bound by a necromancer who believes death is a problem to be solved. Your men murmur uneasily, but you remain steady. A vatt\'ghern stands among you... and this is his calling! \n\n You tighten your grip on your weapon, and prepare to give the order...}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Prepare the attack!",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Volunteer1",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/pov_crusader_vs_figure.png[/img]{Just as the chanting dies and steel falls silent, you hear a hoarse voice calling from beneath collapsed stone. You find a lone soldier hiding in the crypt\'s shadow, gaunt and trembling. He says he was sent from %randomtown% with others to “inspect strange reports.” He was the only one not taken for the tables. After water and a crust of bread, he stares at the ruin and mutters he has no wish to return home in shame. If you\'ll have him, he would sooner fight beside a vatt'ghern than pretend this never happened. | Among the broken benches and burned diagrams, you uncover a soldier bound but alive. He squints at the light as you free him, explaining he was part of a patrol sent from %randomtown%. The cult kept him breathing, \"for later\" he says grimly. He has seen what lurks in the dark and knows no village levy can face it. He asks to join your company, swearing he\'ll not falter again. | As the last abomination falls, a man stumbles from hiding, armor battered but serviceable. A soldier from %randomtown%, he admits they were told this was a bandit matter. It was not. He watched his comrades dragged below and lived only by cowardice or luck - he is unsure which. He says there is nothing for him at home now but questions and ghosts. If you\'ll take him, he will earn his keep in blood. | Near the courtyard well, you find a soldier slumped against stone, freed from crude restraints. He thanks you in a voice worn thin. The cult spared him for reasons he does not wish to guess. He claims no family waits for him in %randomtown%, and no captain would believe what he has seen. He asks to stand with your company instead - to fight horrors with men who understand them.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "You are welcome to join us.",
					function getResult()
					{
						return "Volunteer2";
					}

				},
				{
					Text = "No, you should go home.",
					function getResult()
					{
						return "Volunteer3";
					}

				}
			],
			function start()
			{
				local roster = this.World.getTemporaryRoster();
				this.Contract.m.Dude = roster.create("scripts/entity/tactical/player");
				// Footman, Warrior, or Arbalester
				this.Contract.m.Dude.setStartValuesEx(this.Const.PovSoldierBackgrounds);
				// Add Trait
				this.Contract.m.Dude.getSkills().add(this.new("scripts/skills/traits/pov_hate_mutants_trait"));
				// Change Base Stats
				this.Contract.m.Dude.getBaseProperties().Hitpoints += 10;
				this.Contract.m.Dude.getBaseProperties().DailyWage -= 18;
				// Change Items (Removes main n offhand)
				if (this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
				{
					this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				}
				if (this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
				{
					this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).removeSelf();
				}
				// Change Background Description
				this.Contract.m.Dude.getBackground().m.RawDescription = "After being rescued by the grasp of deranged heretics, %name% has sworn to return the favor in the only way a soldier would know... A sturdy, reliable and trained pair of hands, in your service. This experience has provided a great amount of hate for anything unnatural.";
				this.Contract.m.Dude.getBackground().buildDescription(true);
				// Add Injury
				this.Contract.m.Dude.addLightInjury();
				this.Contract.m.Dude.addInjury(this.Const.Injury.Brawl);
				// Add Character
				this.Characters.push(this.Contract.m.Dude.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Volunteer2",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/pov_crusader_vs_figure.png[/img]{The man joins your ranks, immersing himself in a crowd of brothers who seem to take to him warmly enough for a group of paid killers. The newly hired states he\'s been soldiering his entire life, and he is awaiting your orders. You are more than happy hearing this. | The survivor grins from ear to ear as you wave him in. A few brothers ask what weapons they should give him, but you shrug and figure you\'ll see to yourself what to arm the man with. | More than happy with your reply, he enthusiastically falls within your rank, despite what he went through. You can see it though, a fire in his eyes. Hatred. You should keep your eye on him next time he sees a spirit... | Upon your acceptance, you can hear his grumbling for having lost his weapon. %SPEECH_ON%I\'Not to worry, we will find something suitable for you, and well, worst comes to pass, you have a nice set of armor on you%SPEECH_OFF% He does not know if you are joking or not. You don\'t know either.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Let\'s see about a weapon for you.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Dude.getImagePath());
				this.World.getPlayerRoster().add(this.Contract.m.Dude);
				this.World.getTemporaryRoster().clear();
				this.Contract.m.Dude.onHired();
				this.Contract.m.Dude = null;
			}

		});
		this.m.Screens.push({
			ID = "Volunteer3",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/pov_crusader_vs_figure.png[/img]{You shake your head no. The man frowns.%SPEECH_ON%Are you sure? I\'m pretty good with...%SPEECH_OFF%You cut him off.%SPEECH_ON%I\'m sure. You would be wise to return to your service, soldier.%SPEECH_OFF% | You appraise the man and figure he\'s not fit for your company.%SPEECH_ON%We appreciate the offer, stranger, but we are not looking for one of your skillset. Too...reginented. Take these supplies, and enjoy your freedom.%SPEECH_OFF% | You\'ve enough men to see you through, although you find yourself tempted to replace %randombrother% just to see the man\'s reaction to a demotion. Instead, you offer the prisoner a handshake, a few supplies, and send him on his way. Although disappointed, he does thank you for freeing him.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Off you go.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Dude.getImagePath());
				this.World.getTemporaryRoster().clear();
				this.Contract.m.Dude = null;
			}

		});
		this.m.Screens.push({
			ID = "Success1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/pov_reward_vattghern.png[/img]{You return to %townname% and are ushered quickly before %employer%. He studies your armor first, as though expecting it to move on its own. %SPEECH_ON% It\'s done, then? The chanting stopped? The… experiments ended? %SPEECH_OFF% You give him a short answer. The necromancer lies dead. The fleshworks burn. He exhales slowly, shoulders sagging. %SPEECH_ON% Good. Let death remain death. Here - your crowns, as promised. Money well spent. %SPEECH_OFF% He pushes a heavy satchel across the table. | %employer% listens in silence as you recount the ruin - the hooks, the tables, the stitched giant that fell beneath your steel. His face pales, but he nods. %SPEECH_ON% I will not ask for more detail. Only tell me this - none of it yet walks? %SPEECH_OFF% You shake your head. He sets down a coffer with trembling hands. %SPEECH_ON% Then take this, and my gratitude. The town will sleep easier knowing no one is being… \"improved\"… in the dark.%SPEECH_OFF% | The moment you enter %townname%, the bells are ringing again - not in alarm, but in relief. %employer% meets you at his door, searching your expression. %SPEECH_ON% You burned it? All of it? %SPEECH_OFF% You nod. He gives a stiff, satisfied smile. %SPEECH_ON% Good. Let their knowledge turn to ash with them. Here is your payment. And know this - if ever flesh dares defy its maker again, I will send for your vatt'ghern first. %SPEECH_OFF% | %employer% pours wine with a hand that no longer trembles. %SPEECH_ON% My scouts say the ruin stands quiet. No lights. No smoke. No… things. %SPEECH_OFF% He raises his cup slightly toward you. %SPEECH_ON% Then I suppose the necromancer\'s ambitions ended where they should have. In the grave. Your crowns, as agreed. You have done this town a service it will not soon forget.%SPEECH_OFF%He slides the satchel forward. | %employer% listens grimly as you describe the cult\'s end. When you mention the golems collapsing along with their master\'s death, he nods once. %SPEECH_ON% So it was his will that held them together. Good. A single neck to cut. %SPEECH_OFF% He unlocks a wooden chest and reveals your pay. %SPEECH_ON %Take it. And may we never again need men who understand such horrors. %SPEECH_OFF%}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns more than deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Purged a Location of Geists");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.Contract.m.Reward = this.Contract.m.Payment.getOnCompletion();
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Reward + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"reward",
			this.m.Reward
		]);
		_vars.push([
			"original_reward",
			this.m.OriginalReward
		]);
		/*_vars.push([
			"robberbaron",
			this.m.Flags.get("RobberBaronName")
		]);*/
		_vars.push([
			"totalenemy",
			this.m.Destination != null && !this.m.Destination.isNull() ? this.beautifyNumber(this.m.Destination.getTroops().len()) : 0
		]);
		_vars.push([
			"direction",
			this.m.Destination == null || this.m.Destination.isNull() || !this.m.Destination.isAlive() ? "" : this.Const.Strings.Direction8[this.m.Home.getTile().getDirection8To(this.m.Destination.getTile())]
		]);
	}

	function onHomeSet()
	{
		if (this.m.SituationID == 0)
		{
			this.m.SituationID = this.m.Home.addSituation(this.new("scripts/entity/world/settlements/situations/terrified_villagers_situation"));
		}
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Destination != null && !this.m.Destination.isNull())
			{
				this.m.Destination.getSprite("selection").Visible = false;
				this.m.Destination.setOnCombatWithPlayerCallback(null);
			}

			this.m.Home.getSprite("selection").Visible = false;
		}

		if (this.m.Home != null && !this.m.Home.isNull() && this.m.SituationID != 0)
		{
			local s = this.m.Home.getSituationByInstance(this.m.SituationID);

			if (s != null)
			{
				s.setValidForDays(4);
			}
		}
	}

	function onIsValid()
	{
		if (this.m.IsStarted)
		{
			if (this.m.Destination == null || this.m.Destination.isNull() || !this.m.Destination.isAlive())
			{
				return false;
			}

			return true;
		}
		else
		{
			return true;
		}
	}

	function onSerialize( _out )
	{
		_out.writeI32(0);

		if (this.m.Destination != null && !this.m.Destination.isNull())
		{
			_out.writeU32(this.m.Destination.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		_in.readI32();
		local destination = _in.readU32();

		if (destination != 0)
		{
			this.m.Destination = this.WeakTableRef(this.World.getEntityByID(destination));
		}

		this.contract.onDeserialize(_in);
	}

});

