this.kill_rogue_vattghern_contract <- this.inherit("scripts/contracts/contract", {
	m = { 
		Target = null,
		IsPlayerAttacking = true
	},
	function create()
	{
		this.contract.create();
		this.m.Type = "contract.kill_rogue_vattghern";
		this.m.Name = "Kill Rogue Vatt\'ghern";
		this.m.DescriptionTemplates = [
			"The people whisper that the leader\'s eyes glow in the dark. Whatever he is now, he must be put down.",
			"Steel-for-hire has become steel-for-slaughter. A rogue company stalks the roads, led by something… not quite human.",
			"They wear mail and carry banners, but fight like beasts. Their captain is said to wield signs like a vatt\'ghern.",
			"Professional killers without scruples - and a mutant tactician at their head.",
			"If this company is not stopped, they will grow from nuisance to calamity.",
			"The company marches beneath a blackened banner. Their vatt\'ghern leader twists signs into tools of terror.",
			"Hardened sellswords with nothing left to lose - and a mutant commander who knows no mercy.",
			"Rumors speak of a vatt\'ghern who abandoned his code. If true, this is no ordinary hunt.",
			"Their captain was once a monster hunter. Now he hunts men.",
			"A vatt\'ghern leads them - but not in defense of the innocent. Something twisted his path."
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
		this.m.Payment.Pool = 2225 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

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
					"Follow the tracks near %townname%",
					"Return to %townname%"
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
				local r = this.Math.rand(1, 100);

				this.Flags.set("StartDay", this.World.getTime().Days);
				local playerTile = this.World.State.getPlayer().getTile();
				local tile = this.Contract.getTileToSpawnLocation(playerTile, 5, 10, [
					this.Const.World.TerrainType.Mountains
				]);
				local party;
				party = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).spawnEntity(tile, this.Const.Strings.MercenaryCompanyNames[this.Math.rand(0, this.Const.Strings.MercenaryCompanyNames.len() - 1)], false, this.Const.World.Spawn.HostileMercenariesQuest, 80 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult(), this.Contract.getMinibossModifier());
				party.setDescription("A dangerous group of rogue mercenaries, including a Vatt\'ghern.");
				party.setFootprintType(this.Const.World.FootprintsType.Brigands);
				party.setAttackableByAI(false);
				party.getController().getBehavior(this.Const.World.AI.Behavior.ID.Attack).setEnabled(false);
				party.setFootprintSizeOverride(0.75);
				this.Const.World.Common.addFootprintsFromTo(this.Contract.m.Home.getTile(), party.getTile(), this.Const.GenericFootprints, this.Const.World.FootprintsType.Brigands, 0.75);
				this.Contract.m.Target = this.WeakTableRef(party);
				party.getSprite("banner").setBrush("banner_bandits_0" + this.Math.rand(1, 6));
				local c = party.getController();
				local wait = this.new("scripts/ai/world/orders/wait_order");
				wait.setTime(9000.0);
				c.addOrder(wait);
				this.Contract.setScreen("Overview");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Follow the tracks %direction% of %townname%",
					"Return to %townname%"
				];

				if (this.Contract.m.Target != null && !this.Contract.m.Target.isNull())
				{
					this.Contract.m.Target.getSprite("selection").Visible = true;
					this.Contract.m.Target.setOnCombatWithPlayerCallback(this.onTargetAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Target == null || this.Contract.m.Target.isNull())
				{
					this.Contract.setScreen("BattleDone");
					this.World.Contracts.showActiveContract();
					this.Contract.setState("Return");
				}
				else if (this.World.getTime().Days - this.Flags.get("StartDay") >= 5 && this.Contract.m.Target.isHiddenToPlayer())
				{
					this.Contract.setScreen("Failure1");
					this.World.Contracts.showActiveContract();
				}
			}

			function onTargetAttacked( _dest, _isPlayerAttacking )
			{
				if (!this.Flags.get("IsAttackDialogTriggered"))
				{
					this.Flags.set("IsAttackDialogTriggered", true);
					this.Contract.m.IsPlayerAttacking = _isPlayerAttacking;
					this.Contract.setScreen("Enemy");
					this.World.Contracts.showActiveContract();
				}
				else
				{
					this.World.Contracts.showCombatDialog(_isPlayerAttacking);
				}
			}

		});
		this.m.States.push({
			ID = "Return",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Return to %townname%"
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
			Title = "To kill a Vatt\'ghern",
			Text = "[img]gfx/ui/events/event_63.png[/img]{%employer% stands rigid behind his desk, jaw tight as if chewing iron.%SPEECH_ON%This isn\'t rabble work. Not bandits. Not mutants clawing in the dark. These are trained men - mercenaries. They marched under contract not three months ago. Now they march under no banner at all. Farms burned. Caravans struck with military precision. No witnesses left alive.%SPEECH_OFF% He taps a gloved finger against the map.%SPEECH_ON% They\'ve taken to the old fort in the hills. And they have a captain - a vatt\'ghern, if rumor holds. One of yours, perhaps. Or what passes for one. If that\'s true, then this is not a job for militia and pitchforks. Hunt them. Break them. Bring me proof their captain is dead. I will pay well to see discipline turned against them. %SPEECH_OFF% | %employer% exhales slowly, as though ashamed of what he must say. %SPEECH_ON% I hired them. Good coin. Good steel. Veterans. They were meant to guard the southern road. Instead, they turned on the villages they were sworn to protect. Organized raids. Coordinated strikes. They even leave sentries posted. This is no descent into madness - this is deliberate. %SPEECH_OFF% His gaze sharpens. %SPEECH_ON% Their leader… he\'s said to wield signs. Fire from the hand. Thunder in the air. A vatt\'ghern who abandoned his code. If that\'s true, then only someone of similar breeding can match him. Find their camp. Kill the captain. Scatter the rest. I want his medallion - or his head - as proof. %SPEECH_OFF% | %employer% leans over the table, lowering his voice. %SPEECH_ON% There\'s a company operating out of the northern pass. Not brigands - professionals. Shieldwalls. Rotating watch. They strike supply lines and vanish before dawn. Two of my patrols tried to track them. Both were found stripped of armor and coin, throats cut clean. %SPEECH_OFF% He swallows. %SPEECH_ON% Worse still, their commander is whispered to be a vatt\'ghern. A mutant tactician. If that is so, then I\'ll not waste more men against him. You carry such a creature in your ranks, do you not? Then prove it was worth the breeding. End this rogue captain and dismantle his pack. Payment upon proof of his fall. %SPEECH_OFF% | %employer% drums his fingers impatiently. %SPEECH_ON% This would be simpler if they were monsters. Claws, fangs, mindless hunger. But these men plan. They scout. They fall back in formation. Someone with experience commands them. Someone dangerous. %SPEECH_OFF% He gestures to a blood-marked report. %SPEECH_ON% Survivors speak of a pale man at their head, eyes blazing, casting strange signs before the charge. If that is a vatt\'ghern - then he has chosen a darker path. I will not have my lands terrorized by trained killers. Hunt them down. Slay the captain. Bring back something that proves he won\'t rise again. %SPEECH_OFF% | %employer% stares out the window before speaking. %SPEECH_ON% They call themselves a company still. Wear their old colors. March in step. But there is no contract behind them now - only plunder. Villages struck in sequence. Wells poisoned. Roads trapped. Whoever leads them understands war. %SPEECH_OFF% He turns, expression hard. %SPEECH_ON% The name I hear most is that of their captain - a vatt\'ghern. A hunter who now hunts men. I will not have such a creature building strength unchecked. Go find them. Kill him. Without his leadership, the rest will crumble. Bring proof, and you will be paid richly. %SPEECH_OFF% | %employer% grips the edge of the table so tightly his knuckles pale. %SPEECH_ON% This was not how it was meant to be. They were hired blades - disciplined, reliable. Then something changed. They stopped answering summons. Now they take what they please, and no militia dares stand against them. %SPEECH_OFF% He fixes you with a steady look. %SPEECH_ON% If their leader is truly a vatt\'ghern, then he is no common sell-sword. I need someone capable of meeting him blow for blow. End him. Disband the company by force. Bring back proof of his death so the people know this nightmare is over.%SPEECH_OFF% | %employer% folds his hands calmly, though tension flickers beneath the surface. %SPEECH_ON% Reports describe lightning leaping between men in formation. Shields split by invisible force. Soldiers breaking ranks at a gesture. These are not the acts of common mercenaries. %SPEECH_OFF% His voice lowers. %SPEECH_ON% Their captain is said to be a vatt\'ghern - a mutant commander who turned his talents from monsters to men. I will not risk my own troops against such a foe. If your company travels with one of similar kind, then this is your burden to carry. Find their camp. Kill the captain. Bring back proof, and your reward will reflect the danger. %SPEECH_OFF%}",
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
			ID = "Enemy",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/event_50.png[/img]{The rogue mercenaries meet you in formation, disciplined and silent. No taunts. No chaos. Just steel waiting for command. \n\n Sparks flicker briefly in their captain\'s hand. Your men notice. They whisper the word none want to say aloud - vatt’ghern. This will not be a simple skirmish. Killing their leader should be your priority. \n\n You prepare to give the order...}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "To Arms!",
					function getResult()
					{
						this.Contract.getActiveState().onTargetAttacked(this.Contract.m.Target, true);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "BattleDone",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_87.png[/img]{The last of the rogue mercenaries falls, their formation finally breaking as their captain collapses in the dirt. Shields falter, discipline fractures, and what was once a company dissolves into scattered steel and silence. The vatt\'ghern lies still, medallion cracked, the faint shimmer of his signs guttering out like dying embers. \n\n Without his command, the rest were only men with steel - dangerous, yes, but no longer a weapon guided by something sharper. \n\n The field grows quiet, save for the wind moving through abandoned banners and the low groans of the wounded. Whatever drove this company has ended here, in blood and mud.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Let\'s collect our pay.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Success1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/pov_reward_vattghern.png[/img]{You return to %townname% and are shown in to %employer% without delay. He studies your armor, the dried blood, the grim silence of your men. %SPEECH_ON% It\'s done, then? The rogue company? %SPEECH_OFF% You place the cracked medallion on his desk. The faintest hum dies with it. \n\n %employer% exhales slowly. %SPEECH_ON% So the stories were true… a vatt\'ghern leading them. And now he\'s dead. %SPEECH_OFF% He nods once, firmly, and pushes a heavy satchel toward you. %SPEECH_ON% You\'ve ended a growing war before it began. Your crowns, as promised. %SPEECH_OFF% | %employer% rises the moment you enter, eyes searching your faces. %SPEECH_ON% Well? Do they still march? %SPEECH_OFF% You shake your head. Their captain will not march again. \n\n The man closes his eyes briefly in relief. %SPEECH_ON% Good. Without him they\'re nothing but scattered blades. I feared what a trained company under such a… creature… might become. %SPEECH_OFF% He sets a small chest upon the table. %SPEECH_ON% You\'ve spared us that future. Take your pay, you\'ve earned every crown. %SPEECH_OFF% | You recount the battle plainly - formation, steel, the signs cast in desperation. %employer% listens without interrupting.%SPEECH_ON% A vatt\'ghern turned warlord… I hired men like that once. Never thought I\'d have to pay to have one killed. %SPEECH_OFF% He rubs his temple, then gestures to a satchel at his side. %SPEECH_ON% Still, the roads are safe again. That is what matters. Your payment is there, counted twice. %SPEECH_OFF% It was indeed correct. | %employer% stares long at the proof you bring - armor sigil, broken medallion, whatever remains of the captain. %SPEECH_ON% So it ends in mud and blood like all things. %SPEECH_OFF% He gives a thin smile. %SPEECH_ON% You\'ve done what militia and patrols could not. Perhaps there is a use for your kind after all. %SPEECH_OFF% He slides a heavy purse across the desk. %SPEECH_ON% Take it. And know you\'ve prevented something truly horrible from taking root here. %SPEECH_OFF% | %employer% pours himself a drink before you even begin speaking. %SPEECH_ON% I\'ll assume by your return that the rogue captain is no longer a concern. %SPEECH_OFF% You confirm it. The company shattered when he fell. \n\n He nods grimly. %SPEECH_ON% Leadership makes monsters out of men. Remove it, and they\'re only flesh and doubt. %SPEECH_OFF% He pushes forward your reward. %SPEECH_ON% You\'ve removed a dangerous piece from the board. Payment, as agreed. %SPEECH_OFF%}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns well deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Killed a dangerous rogue Vatt\'ghern");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] Crowns"
				});
			}

		});
		this.m.Screens.push({
			ID = "Failure1",
			Title = "Along the way...",
			Text = "[img]gfx/ui/events/event_75.png[/img]{The trail led you far.. burned camps, cold watchfires, disciplined footprints that never once strayed from formation. But somewhere along the hills, the signs vanished. No more sentries. No more tracks. Just empty wind and trampled earth. \n\n %randombrother% scans the horizon before shaking his head. %SPEECH_ON% They knew we were coming, sir. Broke camp clean. Left nothing behind. %SPEECH_OFF% \n\n A trained company does not scatter by accident. They have withdrawn with purpose, and by now they are leagues away. \n\n %employer% will not take kindly to this... and a rogue vatt\'ghern left unchecked is a problem that only grows.}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Damn this contract!",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractFail);
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Killed a dangerous rogue Vatt\'ghern");
						this.World.Contracts.finishActiveContract(true);
						return 0;
					}

				}
			]
		});
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"direction",
			this.m.Target == null || this.m.Target.isNull() ? "" : this.Const.Strings.Direction8[this.World.State.getPlayer().getTile().getDirection8To(this.m.Target.getTile())]
		]);
		_vars.push([
			"bribe",
			this.m.Flags.get("Bribe")
		]);
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Target != null && !this.m.Target.isNull())
			{
				this.m.Target.getSprite("selection").Visible = false;
				this.m.Target.setOnCombatWithPlayerCallback(null);
			}

			this.m.Home.getSprite("selection").Visible = false;
		}
	}

	function onIsValid()
	{
		return true;
	}

	function onSerialize( _out )
	{
		if (this.m.Target != null && !this.m.Target.isNull())
		{
			_out.writeU32(this.m.Target.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		local target = _in.readU32();

		if (target != 0)
		{
			this.m.Target = this.WeakTableRef(this.World.getEntityByID(target));
		}

		this.contract.onDeserialize(_in);
	}

});

