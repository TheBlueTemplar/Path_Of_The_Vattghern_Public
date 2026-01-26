this.destroy_forsaken_location_contract <- this.inherit("scripts/contracts/contract", {
	m = { // SUPER INTERESTING CONTRACT TO STUDY - CONTRACT TUTORIAL / EXAMPLE / TEMPLATE
		Destination = null,
		Dude = null,
		Reward = 0,
		OriginalReward = 0,
		Peddler = null
	},
	function create()
	{
		this.contract.create();
		this.m.Type = "contract.destroy_forsaken_location";
		this.m.Name = "Kill Forsaken Leader";
		this.m.DescriptionTemplates = [
			"Attacks by violent mutants are only getting worse, someone must put a stop to it.",
			"Mutants - Barely human anymore - are prowling on the vicinity of this village, terrorising locals.",
			"Patrols have been lost, and no vengeance has been dealt. Someone must deal with these forsaken.",
			"Forsaken by life itself, they must be put to rest. It\'s but a mercy",
			"A task worthy of a vatt\'ghern - a ruin filled with the forsaken!",
			"Locals dissapearing, terror spreading - someone must put a stop to this",
			"The people here would sure pay lots to rid themselves of this forsaken plague.",
			"The mutants have found a strong leader...it must be put down!",
			"People terrified and lost - and the source is known...it must be purged!",
			"Attacks getting more frequent and organised. These forsaken are growing into a huge threat."
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
		local myTile = this.World.State.getPlayer().getTile();
		local forsaken = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getSettlements();
		local lowestDistance = 9999;
		local best;

		foreach( loc in forsaken )
		{
			local dist = myTile.getDistanceTo(loc.getTile());

			if (dist < lowestDistance && (loc.getTypeID() == "location.pov_bandit_ruins"))
			{
				lowestDistance = dist;
				best = loc;
			}
		}

		this.m.Destination = this.WeakTableRef(best);
		this.m.Flags.set("DestinationName", this.m.Destination.getName());
		this.m.Payment.Pool = 2000 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

		if (this.Math.rand(1, 100) <= 75)
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
					"Destroy the forsaken of " + this.Flags.get("DestinationName") + " and their leader, %direction% of %origin%"
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
				this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.PovForsakenBoss, 115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setLootScaleBasedOnResources(115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setResources(this.Math.min(this.Contract.m.Destination.getResources(), 70 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult()));
				this.Contract.m.Destination.setDiscovered(true);
				this.World.uncoverFogOfWar(this.Contract.m.Destination.getTile().Pos, 500.0);

				this.Contract.setScreen("Overview");
				this.Flags.set("Cut", this.Contract.beautifyNumber(this.Contract.m.Payment.getOnCompletion() * this.Math.rand(15, 20) * 0.01));
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				if (this.Contract.m.Destination != null && !this.Contract.m.Destination.isNull() && this.Contract.m.Destination.isAlive())
				{
					this.Contract.m.Destination.getSprite("selection").Visible = true;
					this.Contract.m.Destination.setOnCombatWithPlayerCallback(this.onDestinationAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Destination == null || this.Contract.m.Destination.isNull() || !this.Contract.m.Destination.isAlive())
				{
					// Default chance 40 (for recruit)
					if (this.Math.rand(1, 40) <= 100 && this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
					{
						this.Contract.setScreen("Volunteer1");
						this.World.Contracts.showActiveContract();
					}

					this.Contract.setState("Return");
				}

				if ( !this.Flags.get("IsMercsDialogShown"))
				{
					this.Flags.set("IsMercsDialogShown", true);
					this.Contract.setScreen("Mercs1");
					this.World.Contracts.showActiveContract();
				}
			}

			function onDestinationAttacked( _dest, _isPlayerAttacking = true )
			{
				if (!this.Flags.get("IsAttackDialogTriggered"))
				{
					this.Flags.set("IsAttackDialogTriggered", true);
					this.Contract.setScreen("AttackForsakenArea");
					this.World.Contracts.showActiveContract();
				}else
				{
					// This one is what starts battle
					this.World.Contracts.showCombatDialog();
				}
			}

			function onActorKilled( _actor, _killer, _combatID )
			{
				if (this.Flags.has("NumMercs"))
				{
					// check if the guests are still alive
					for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
					{
						if (_actor.getID() == this.Flags.get("Mercenary" + i))
						{
							this.World.getGuestRoster().remove(_actor);
						}
					}
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
					if (this.Flags.has("NumMercs"))
					{
						// check if the guests are still alive
						local survivors = 0;
						local Mercs = [];
						for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
						{
							if(!::MSU.isNull(::Tactical.getEntityByID(this.Flags.get("Merc" + i))))
							{
								survivors++;
							}
						}

						if (survivors == this.Flags.get("NumMercs"))
						{
							this.Contract.setScreen("MercsSurvival1");
						}
						else if (survivors > 0)
						{
							this.Contract.setScreen("MercsSurvival2");
						}
						else
						{
							this.Contract.setScreen("MercsSurvival3");
						}
					}
					else
					{
						// Go straight to success screen if we didn't hire the Mercenaries
						this.Contract.setScreen("Success1");
					}

					this.World.Contracts.showActiveContract();
				}
			}

			function onActorKilled( _actor, _killer, _combatID )
			{
				if (this.Flags.has("NumMercs"))
				{
					// check if the guests are still alive
					for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
					{
						if (_actor.getID() == this.Flags.get("Merc" + i))
						{
							this.World.getGuestRoster().remove(_actor);
						}
					}
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
			Text = "[img]gfx/ui/events/event_63.png[/img]{%employer% shuts a ledger with a sharp crack.%SPEECH_ON%This has gone beyond banditry. The forsaken out of the old watchpost don\'t scatter like animals anymore. They march. They raid with purpose. Someone - something - is leading them.%SPEECH_OFF% He leans forward.%SPEECH_ON%Survivors speak of a towering brute, flesh swollen and armored in scavenged iron, barking orders in a voice that sounds like stone dragged over bone. When it appears, the others follow without question. Kill that leader, and the rest may finally break. I\'m told your company keeps a vatt'ghern. If that\'s true, this hunt is yours. Clear the watchpost, slay their chieftain, and bring back proof.%SPEECH_OFF% | %employer% traces a scar along his forearm as he speaks.%SPEECH_ON%We thought them mindless at first. Then they started setting ambushes. Blocking roads. Hitting wagons where guards are weakest. That doesn\'t happen without direction.%SPEECH_OFF% His jaw tightens.%SPEECH_ON%There\'s one among them - bigger, older, twisted beyond recognition. The men call it the Captain. It wears a rusted helm fused to its skull and fights like it remembers drilling soldiers. As long as it lives, the raids will continue. I need a vatt'ghern to put it down. Kill the leader, cleanse the watchpost, and bring proof. Coin will follow.%SPEECH_OFF% | %employer% gestures to a blood-stained report on the table.%SPEECH_ON%These attacks are too coordinated to be chance. The forsaken strike fast, withdraw cleanly, and leave nothing behind but bodies. Scouts swear they saw one of them directing the others, pointing, roaring commands.%SPEECH_OFF% He exhales.%SPEECH_ON%That thing is the heart of the rot. A mutant grown strong enough to dominate the rest. Bandits can be scattered. This… must be killed. Word is your company has a vatt'ghern - a hunter made for such work. Go to the watchpost. Slay the leader. Bring me proof so I know the roads are ours again.%SPEECH_OFF% | %employer% folds his arms, voice hard.%SPEECH_ON%The forsaken aren\'t just looting anymore. They\'re organized. Someone\'s keeping them fed, armed, and angry. One of my caravan guards lived long enough to describe it - a massive creature, once a man, screaming orders while tearing a mule in half.%SPEECH_OFF% He shakes his head.%SPEECH_ON%As long as that beast leads them, trade will bleed and farms will burn. I don\'t need mercy. I need results. If your company truly carries a vatt'ghern, send them. Kill the chieftain in the watchpost and bring back proof. The rest will fall apart without it.%SPEECH_OFF% | %employer% lowers his voice, glancing toward the door.%SPEECH_ON%They follow it like hounds. No hesitation. No fear. It\'s stronger, smarter, and far crueler than the rest. Whatever humanity it once had has rotted into something that understands only dominance.%SPEECH_OFF% He meets your gaze.%SPEECH_ON%If you face the forsaken, you must face their master. A vatt'ghern should know how to hunt leaders, not just beasts, yes? Go to the watchpost. Slay the chieftain and cleanse the den. Bring proof, and this region might finally breathe again.%SPEECH_OFF%}",
			Image = "",
			List = [],
			ShowEmployer = true,
			ShowDifficulty = true,
			Options = [
				{
					Text = "{Their leader huh? How much is the pay? | What is %townname% prepared to pay for their safety? | Let\'s talk crowns. | A Vatt\'ghern\'s service has its cost}",
					function getResult()
					{
						return "Negotiation";
					}

				},
				{
					Text = "{We cannot help you here | This is beyond us. | I wish you luck, but we\'ll not be part of this. | You want us dead or what? No!}",
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
			ID = "AttackForsakenArea",
			Title = "Before the attack...",
			//Text = "[img]gfx/ui/events/event_54.png[/img]{While approaching the area, you are like: SKIBIDI ZOINKS TOO MANY GHOSTIES HERE OH MA GAWD, then attack anyways.}",
			Text = "[img]gfx/ui/events/pov_forsaken.png[/img]{As you approach the camp, you really understand what you are getting yourself into. The stench of death and rot is penetrating, you would not even need a map to spot this place. You notice the enemy leader, a hulking mass barely looking like a man, dressed in expensive armor, likely what was stolen from his prior victims. \n\n You would not consider such a fight normally, but with a Vatt\'ghern it\'s a different story. Knowing you will fight many mutants, you prepared the tools you have gathered accordingly. \n\n The men stand ready...}",
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
			Text = "[img]gfx/ui/events/pov_killed_mutant.png[/img]{As the fighting dies down and the last echoes fade, a hoarse voice calls out from the ruins. You follow the sound and find a man crouched behind fallen stone, skin marked by strange scars and unnatural growths, but his eyes still clear. He hasn\'t eaten in days and his water is gone. After you give him what little you can spare, he lowers his head and asks - quietly, almost ashamed - if he might join your company. He says there is nothing left for him, and no place he can return to now. | Searching the ruins, you come across a half-dead soldier bound in rusted chains. His body bears signs of mutation, but not the wild corruption of the forsaken. Once freed and given food, he explains he hails from %randomtown% and was sent with others to deal with bandits. They were captured instead. The forsaken tried to break him, to make him like them. He asks to follow you, saying he\'d rather fight beside the men who saved him than return home marked as a freak. | Amid the wreckage, you find a man still breathing, nailed to a post as if forgotten. His flesh is altered, hardened in places, twisted in others, but his voice is steady. He says he was kept alive for a reason - as a trial, perhaps, or a lesson. The others were not so lucky. He comes from %randomtown%, but doubts he would be welcomed there now. After a long pause, he asks if you\'d take him in. He swears his sword arm is still strong. | One of the captured men stirs as the battle ends. Unlike the forsaken, his mind is his own, though his body bears their mark. He thanks you in a low voice, saying the pain never stopped, but the madness never came. A soldier by trade, he admits no one will be waiting for him, and that his past was rough even before this. He asks to join your company, eager to stand with those who ended his torment, certain he has nowhere else to go.}",
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
					Text = "Apoligies, but no.",
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
				this.Contract.m.Dude.setStartValuesEx(this.Const.PovMutantBackgrounds);
				// Add Trait
				//this.Contract.m.Dude.getSkills().add(this.new("scripts/skills/traits/pov_hate_ghosts_trait"));
				// Change Base Stats
				this.Contract.m.Dude.getBaseProperties().Hitpoints += 5;
				this.Contract.m.Dude.getBaseProperties().Bravery += 10;
				this.Contract.m.Dude.getBaseProperties().DailyWage -= 15;
				// Change Items (Removes main n offhand)
				/*if (this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
				{
					this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				}
				if (this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
				{
					this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).removeSelf();
				}*/
				// Change Background Description
				this.Contract.m.Dude.getBackground().m.RawDescription = "%name% bears signs of mutation, but his will remains intact. Whatever the forsaken tried to make of him failed. After being rescued by your company, he joined in, swearing he will be a great asset to the group. His past is irrelevant, for here, his unnatural curse is more of a gift. \n\n Grateful for your help, and bolstered by his recent experiences, he has higher health and resolve than usual, and demands less money.";
				this.Contract.m.Dude.getBackground().buildDescription(true);
				// Add Injury
				this.Contract.m.Dude.addHeavyInjury();
				this.Contract.m.Dude.addInjury(this.Const.Injury.Brawl);
				// Add Character
				this.Characters.push(this.Contract.m.Dude.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Volunteer2",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/pov_killed_mutant.png[/img]{The man joins your ranks without hesitation, slipping into the crowd of brothers who accept him readily enough for a band of paid killers. He says he\'s been soldiering most of his life and waits for your orders with a stiff nod. You find no reason to doubt him. | The survivor breaks into a wide grin as you wave him over. A few brothers glance at his warped flesh but say nothing. Someone asks what weapon he should be given. You shrug - you\'ll decide that yourself soon enough. | He accepts eagerly, falling into formation as if he\'d never left it. Whatever the forsaken did to him, it didn\'t break his spirit. Still, there\'s something burning behind his eyes, despie what he went through. | Upon your acceptance, the man mutters about having lost his weapon in the chaos. You clap him on the shoulder.%SPEECH_ON%Not to worry. We\'ll find something that fits your hands. And if not… you\'ve got to put these mutated hands to work.%SPEECH_OFF% He blinks, unsure whether you\'re joking. Truth be told, you are not so sure either.}",
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
			Text = "[img]gfx/ui/events/pov_killed_mutant.png[/img]{You shake your head. The man\'s shoulders slump, just a little.%SPEECH_ON%Are you certain? I can still fight. I swear it.%SPEECH_OFF% You cut him off before he can say more.%SPEECH_ON%I\'m certain. Find another road, friend.%SPEECH_OFF% He nods stiffly, hiding the disappointment poorly. | ou study the man for a long moment - the scars, the warped flesh, the look in his eyes. Whatever he survived, you decide he\'s not fit for your company.%SPEECH_ON%We\'ll pass. You\'re free now. That\'s worth more than a contract.%SPEECH_OFF% He hesitates, then thanks you quietly before turning away. | You already have enough men, and more mouths would only slow you down. For a brief moment, you consider dismissing %randombrother% just to see the look on the man\'s face. Instead, you offer the survivor a firm handshake and send him on his way. Disappointed but grateful, he thanks you for saving his life. | The man waits for your answer, hope written plainly across his face. You deny him with a simple gesture.%SPEECH_ON%I am sorry, but you are not needed in this company, enjoy your freedom.%SPEECH_OFF% He exhales slowly, then straightens.%SPEECH_ON%Then… thank you. For not leaving me there.%SPEECH_OFF% He gathers what little he has and disappears down the road.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Let\'s move on.",
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
			Text = "[img]gfx/ui/events/pov_reward_vattghern.png[/img]{You return to %townname% and present yourself to %employer%. Your report is brief and to the point: the watchpost is cleared, the forsaken are dead, and their leader will not be giving orders again. The man listens in silence before nodding once and handing over your payment.%SPEECH_ON%I figured someone with your… particular skillset could handle it. The roads are already quieter. Money well earned.%SPEECH_OFF% | %employer% greets you at his door, a heavy satchel already in hand.%SPEECH_ON%Let me guess - the raids stopped?%SPEECH_OFF% You tell him the chieftain is dead and the rest scattered like animals without a master. He tosses the satchel your way without hesitation.%SPEECH_ON%I don\'t need proof beyond that. If you lied, the wagons would still be burning.%SPEECH_OFF% | As you finish your report, %employer% exhales deeply and wipes his brow with a cloth.%SPEECH_ON%All of them? And the big one too?%SPEECH_OFF% You nod. He lets out a short, relieved laugh.%SPEECH_ON%You have no idea what that\'s worth to this place. Trade, taxes, sleep… all of it. Your crowns, as promised.%SPEECH_OFF% He places a satchel on the desk. It weighs true. | %employer% sips from his goblet, studying you over the rim.%SPEECH_ON%I won\'t pretend I\'m fond of mutants, vatt\'ghern or otherwise. But my caravans are moving again, and my farmers aren\'t sharpening pitchforks every night.%SPEECH_OFF% He slides a satchel across the table.%SPEECH_ON%That earns you coin, whether I like it or not.%SPEECH_OFF% |%employer% leans back in his chair, fingers steepled.%SPEECH_ON%They followed that thing like dogs, didn\'t they? Figures. Cut off the head and the body dies.%SPEECH_OFF% He nods toward a chest in the corner.%SPEECH_ON%It\'s all there. Count it if you must. I know I would.%SPEECH_OFF%You do count it, and it is indeed all there. | The man\'s desk is buried beneath ledgers and reopened trade contracts. He beams as he speaks.%SPEECH_ON%Farmers back in the fields, wagons on the road, and no shrieking mutants stealing grain in the night! It\'s a fine day.%SPEECH_OFF% He starts tossing coin purses your way, one after another.%SPEECH_ON%I could\'ve used a satchel, but this felt more satisfying.%SPEECH_OFF% You catch each without comment, blood still drying on your blade.}",
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
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Killed a Forsaken leader");
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
		this.m.Screens.push({
			ID = "Mercs1",
			Title = "At %townname%",
			Text = "[img]gfx/ui/events/event_07.png[/img]{A group of rough-looking sellswords flags you down on the road. They say they\'re between contracts and short on coin, but not on nerve. Word of the forsaken chieftain has spread, and they\'d rather face it alongside a seasoned company than alone. They ask if you\'d consider letting them join the hunt. Their price is %cut% crowns. | You are stopped by a small band of mercenaries, who don\'t waste time on pleasantries. There\'s a dangerous contract on the table, and they want in. Whether it\'s for coin, glory, or survival, they claim they\'re ready to fight whatever waits in those ruins — if have %cut% crowns to spare.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Deal.",
					function getResult()
					{
						return "Mercs2";
					}

				},
				{
					Text = "We can do it on our own, and keep the money.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				local brothers = ::World.getPlayerRoster().getAll();
				local peddlerBackgrounds = ["background.peddler","background.legend_trader","background.legend_commander_trader"];
				foreach( bro in brothers )
				{
					if (peddlerBackgrounds.find(bro.getBackground().getID()) != null)
					{
						this.Contract.m.Peddler = ::MSU.asWeakTableRef(bro);
						// this.Contract.m.Peddler = bro;
						break;
					}
				}
				if (!::MSU.isNull(this.Contract.m.Peddler))
				{
					Options.push({
						Text = "%peddler% has a business proposal",
						function getResult()
						{
							return "Peddler1";
						}
					})
				}
			}
		});
		this.m.Screens.push({
			ID = "Mercs2",
			Title = "At %townname%",
			Text = "[img]gfx/ui/events/event_07.png[/img]{You weigh their offer, then nod. Coin talks louder than banners or promises. You agree to their terms and count out the crowns. The mercenaries watch closely as the money changes hands, then fall in line without another word. Swords for hire, just as expected. | The mercenaries accept the coin with practiced ease. No gratitude, no questions. For now, your banners are worth following. | You meet their gaze and agree to their price. The crowns are counted, the terms understood. With payment settled, the mercenaries take their place alongside your men, as expected from professionals.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Won\'t say no to helping hands.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				// Pay their price
				this.World.Assets.addMoney(this.Flags.get("Cut") * -1);

				// Add 3 mercenaries to the guest roster (2 Melee 1 Ranged)
				local numMercs = 3;
				local freeSlots = ::Legends.S.getEmptySlotsInFormation();
				for( local i = 0; i != numMercs; i = ++i )
				{
					local merc;
					if (i < 2)
					{
						merc = this.World.getGuestRoster().create("scripts/entity/tactical/humans/pov_merc_guest");
					}else
					{
						merc = this.World.getGuestRoster().create("scripts/entity/tactical/humans/pov_merc_ranged_guest");
					}
					merc.setFaction(1);
					merc.setPlaceInFormation(freeSlots.pop());
					merc.assignRandomEquipment();
					this.Flags.set("Merc" + i, merc.getID());
				}
				this.Flags.set("NumMercs", numMercs);

				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You lose [color=" + ::Const.UI.Color.NegativeEventValue + "]" + this.Flags.get("Cut") + "[/color] Crowns"
				});

				local mercs = [];
				for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
				{
					mercs.push(::Tactical.getEntityByID(this.Flags.get("Merc" + i)).getName());
				}
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_brothers.png",
					text = ::Const.LegendMod.Language.arrayToText(mercs, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + " temporarily join your party",
				});
			}
		});
		// Peddler business proposal
		this.m.Screens.push({
			ID = "Peddler1",
			Title = "A Once-in-a-Lifetime Opportunity",
			Text = "[img]gfx/ui/events/event_92.png[/img]{%peddler% clears %their_peddler% throat loudly as %they_peddler% steps between you and the mercenaries.%SPEECH_ON%Gentlemen! Before we discuss coin, let me say this: how often does one get the chance to accompany a professional company into a forsaken den led by a legendary mutant chieftain? Never, that\'s how often.%SPEECH_OFF% The mercenaries exchange uncertain looks as %peddler% presses on.%SPEECH_ON%Frankly, you should be paying us for the privilege.%SPEECH_OFF% | %%peddler% lunges forward like a starving hound scenting meat, nearly tripping over %their_peddler% own boots. Waving %their_peddler% arms wildly, %they_peddler% launches into a breathless pitch about an exclusive \"Vatt\'ghern-Guided Mercenary Experience,\" available today only for the astonishingly low price of %cut% crowns. The other mercenaries blink, unsure if this is a joke or a threat. | Practically vibrating with excitement, %peddler% plants %their_peddler% face inches from one of the mercenaries, spittle flying freely.%SPEECH_ON%All-inclusive! Live combat! Authentic screams! A once-in-a-lifetime opportunity to die heroically or survive with a story to tell!%SPEECH_OFF% The man recoils slightly as %peddler% beams.%SPEECH_ON%And all for a very reasonable fee, payable in advance.%SPEECH_OFF% | It becomes painfully clear that %peddler% has gone completely mad and is attempting to convince the mercenaries that they should be paying you to join this contract. The mercenaries stand in stunned silence, reassessing every life choice that led them here. Before you can intervene, %peddler% has already begun outlining \"package tiers,\" complete with optional corpse retrieval, discounted burial services, and a souvenir scrap of forsaken flesh \"subject to availability...\"}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "{Well, How about it? | Do we have an agreement?}",
					function getResult()
					{
						local r = ::Math.rand(1,100);
						r = ::Math.min(100, r + (this.Contract.m.Peddler.getLevel() * 3));
						// rolls below are from 1,100 + peddler lvl * 3
						// so in this case, if peddler lvl = 10 r would be 60,45,10
						if (r > 90)
						{
							// Mercs pay you upfront
							this.Flags.set("PeddlerPayUpfront",true);
							return "Peddler2";
						}
						else if (r > 75)
						{
							// Mercs will pay you when the contract is successful
							this.Flags.set("PeddlerPayLater",true);
							return "Peddler2";
						}
						else if (r > 40)
						{
							// Mercs will join you for free
							this.Flags.set("PeddlerFree",true);
							return "Peddler2";
						}
						else
						{
							// Mercs will insist on payment
							return "Peddler3";
						}
					}
				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Peddler.getImagePath());
			}
		});
		this.m.Screens.push({
			ID = "Peddler2",
			Title = "A business proposal",
			Text = "[img]gfx/ui/events/event_07.png[/img]",
			Image = "",
			Characters = [],
			List = [],
			Options = [],
			function start()
			{
				this.Characters.push(this.Contract.m.Peddler.getImagePath());

				if (this.Flags.get("PeddlerPayUpfront"))
				{
					this.Text += "{Say what you will about %peddler%, but %they_peddler% somehow manages to pull it off. Before the mercenaries can come to their senses, you scoop the coins from their outstretched palms, ignoring their dazed expressions. Somewhere behind you, %peddler% looks unbearably pleased. | As the bewildered mercenaries hand over their hard-earned crowns, you can\'t help but wonder why %peddler% ever turned to a life of mercenary work. With a talent like that, %they_peddler% could have emptied half the region blind without lifting a blade. | To the astonishment of everyone present (except for %peddler%, who nods smugly) the mercenaries produce a bag of crowns and fall in line behind the %companyname%. Whether out of greed, curiosity, or sheer confusion, they seem genuinely eager to march with you. | The mercenaries exchange glances, shrug, and pay up. %peddler% beams as if this outcome had never been in doubt. You pocket the crowns and gesture for the newcomers to follow, interested to see their reactions when they realise what they\'ve bought into.}";
					// Profit
					this.World.Assets.addMoney(::Math.ceil(this.Flags.get("Cut") * 0.5));
					this.List.push({
						id = 10,
						icon = "ui/icons/asset_money.png",
						text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + ::Math.ceil(this.Flags.get("Cut") * 0.5) + "[/color] Crowns"
					});

					this.Contract.m.Peddler.improveMood(::Const.MoodState.Euphoric - ::Math.minf(this.Contract.m.Peddler.getMood(), ::Const.MoodState.Euphoric), "Bamboozled some mercs");
					if (this.Contract.m.Peddler.getMoodState() >= ::Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = ::Const.MoodStateIcon[this.Contract.m.Peddler.getMoodState()],
							text = this.Contract.m.Peddler.getName() + ::Const.MoodStateEvent[this.Contract.m.Peddler.getMoodState()]
						});
					}

					this.Options = [
						{
							Text = "{Welcome to the experience of a lifetime. | I\'m beginning to question who the real danger is...}",
							function getResult()
							{
								return 0;
							}
						}
					]
				}
				else if (this.Flags.get("PeddlerPayLater"))
				{
					this.Text += "{The mercenaries exchange uneasy glances as they weigh %peddler%\'s offer. Out of the corner of your eye, you catch %peddler% licking %their_peddler% lips, already counting coin that doesn\'t exist yet. After a long pause, one of them nods. %SPEECH_ON%Fine. We\'ll pay — but only after the job\'s done. You make sure we all make it back alive.%SPEECH_OFF% | The men mutter among themselves, eyes darting between you and %peddler%. At last, they reach an agreement.%SPEECH_ON%We\'ll walk with you, but the coin comes after. If we don\'t survive, you don\'t get paid.%SPEECH_OFF% %peddler% grins as if this were the best possible outcome. | The mercenaries hesitate, clearly torn between greed and common sense. Eventually, they relent.%SPEECH_ON%After the contract. Not before. If this turns sour, we settle accounts in blood.%SPEECH_OFF% %peddler% clasps %their_peddler% hands together, delighted. | A tense silence hangs in the air before one of them finally spits and extends a hand.%SPEECH_ON%After the job. That\'s the deal.%SPEECH_OFF% %peddler% nods eagerly, already treating the future crowns as already being in the company\'s (and maybe his) pocket.}";

					this.Contract.m.Peddler.improveMood(::Const.MoodState.Eager - ::Math.minf(this.Contract.m.Peddler.getMood(), ::Const.MoodState.Eager), "Bamboozled some mercs");
					if (this.Contract.m.Peddler.getMoodState() >= ::Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = ::Const.MoodStateIcon[this.Contract.m.Peddler.getMoodState()],
							text = this.Contract.m.Peddler.getName() + ::Const.MoodStateEvent[this.Contract.m.Peddler.getMoodState()]
						});
					}

					this.Options = [
						{
							Text = "{No promises. | Watch your step.}",
							function getResult()
							{
								return 0;
							}
						}
					]
				}
				else if (this.Flags.get("PeddlerFree"))
				{
					this.Text += "{You rub your temples as the mercenaries and %peddler% haggle back and forth, voices rising and falling in a maddening rhythm. Minutes stretch into what feels like an eternity. Groans ripple through your company. At last, %peddler% returns, beaming.%SPEECH_ON%Good news! We\'ve reached a mutually beneficial agreement.%SPEECH_OFF% The mercenaries will join the hunt for free. | The debate drags on until even the birds seem to stop listening. When it finally ends, %peddler% cheerfully declares the mercenaries will join without pay. The men agree without protest, faces etched with pure exhaustion, as if fighting forsaken now seems easier than arguing another minute.}";

					this.Contract.m.Peddler.improveMood(::Const.MoodState.Eager - ::Math.minf(this.Contract.m.Peddler.getMood(), ::Const.MoodState.Eager), "Bamboozled some mercs");
					if (this.Contract.m.Peddler.getMoodState() >= ::Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = ::Const.MoodStateIcon[this.Contract.m.Peddler.getMoodState()],
							text = this.Contract.m.Peddler.getName() + ::Const.MoodStateEvent[this.Contract.m.Peddler.getMoodState()]
						});
					}

					this.Options = [
						{
							Text = "{Finally, we can keep going | Ah yes, %peddler% strikes again... | Remember, you approached us first.}",
							function getResult()
							{
								return 0;
							}
						}
					]
				}

				// Add 3 mercenaries to the guest roster (2 Melee 1 Ranged)
				local numMercs = 3;
				local freeSlots = ::Legends.S.getEmptySlotsInFormation();
				for( local i = 0; i != numMercs; i = ++i )
				{
					local merc;
					if (i < 2)
					{
						merc = this.World.getGuestRoster().create("scripts/entity/tactical/humans/pov_merc_guest");
					}else
					{
						merc = this.World.getGuestRoster().create("scripts/entity/tactical/humans/pov_merc_ranged_guest");
					}
					merc.setFaction(1);
					merc.setPlaceInFormation(freeSlots.pop());
					merc.assignRandomEquipment();
					this.Flags.set("Merc" + i, merc.getID());
				}
				this.Flags.set("NumMercs", numMercs);
				local mercs = [];
				for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
				{
					mercs.push(::Tactical.getEntityByID(this.Flags.get("Merc" + i)).getName());
				}
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_brothers.png",
					text = ::Const.LegendMod.Language.arrayToText(mercs, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + " temporarily " + ::Const.LegendMod.Language.pluralize(mercs.len(), "joins", "join") + " your party",
				});

			}
		});
		this.m.Screens.push({
			ID = "Peddler3",
			Title = "A business proposal",
			Text = "[img]gfx/ui/events/event_07.png[/img]{Despite the best efforts of %peddler%, the mercenaries shake their heads in unison and stand their ground. Whatever spell of words and wild gestures was cast, it fails to take hold. They insist on being paid %cut% crowns for their services, no less. | The mercenaries listen politely, then cut %peddler% off with a raised hand.%SPEECH_ON%We know what the job\'s worth. %cut% crowns.%SPEECH_OFF% The way they say it makes it clear they\'re negotiating survival, not bravery. | The mercenaries exchange a look, then one of them speaks plainly.%SPEECH_ON%We\'ll fight. But not for free, and not for promises. %cut% crowns.%SPEECH_OFF% They hold your gaze, waiting to see if you\'re willing to pay.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Very well.",
					function getResult()
					{
						return "Mercs2";
					}
				},
				{
					Text = "Forget it.",
					function getResult()
					{
						return 0;
					}
				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Peddler.getImagePath());
			}
		});
		// All Mercenaries Survived
		this.m.Screens.push({
			ID = "MercsSurvival1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_07.png[/img]{The mercenaries give you a slight nod before returning to their homes.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Pleasure working with you.",
					function getResult()
					{
						return "Success1";
					}
				}
			],
			function start()
			{
				if (this.Flags.get("PeddlerPayLater"))
				{
					this.Text = "[img]gfx/ui/events/event_07.png[/img]{The Mercenaries excitedly recount to each other the adventure they\'d had, happily handing over a bag of crowns to you before parting ways.}";
					this.World.Assets.addMoney(::Math.ceil(this.Flags.get("Cut") * 0.5));
					this.List.push({
						id = 10,
						icon = "ui/icons/asset_money.png",
						text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + ::Math.ceil(this.Flags.get("Cut") * 0.5) + "[/color] Crowns"
					});
				}

				if (this.Math.rand(1, 100) <= 75)
				{
					this.Text += "{%SPEECH_ON%We\'ll be sure to let the town know of the good work you\'ve done.%SPEECH_OFF%}";
					this.Contract.addSituation(this.new("scripts/entity/world/settlements/situations/legend_word_of_mouth_situation"), 3, this.Contract.m.Home, this.List);
				}

				local mercs = [];
				for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
				{
					mercs.push(::Tactical.getEntityByID(this.Flags.get("Merc" + i)).getName());
				}
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_brothers_bw.png",
					text = ::Const.LegendMod.Language.arrayToText(mercs, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + ::Const.LegendMod.Language.pluralize(mercs.len()," leaves", " leave") + " your party",
				});
			}
		});
		// Not all Mercenaries Survived
		this.m.Screens.push({
			ID = "MercsSurvival2",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_07.png[/img]{Not all of the mercenaries who joined your hunt made it back alive, and as you part ways, you wonder if it would be better to deny them in the first place. But no, they knew what they signed up for.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Mercenary work is dangerous, after all.",
					function getResult()
					{
						return "Success1";
					}
				}
			],
			function start()
			{
				local mercs = [];
				for( local i = 0; i < this.Flags.get("NumMercs"); i++ )
				{
					local p = ::Tactical.getEntityByID(this.Flags.get("Merc" + i));
					if (!::MSU.isNull(p)) mercs.push(p.getName());
				}

				if (this.Flags.get("PeddlerPayLater"))
				{
					this.Text = "[img]gfx/ui/events/event_07.png[/img]{" + format("The remaining %s %s over their share of the payment promised for the \"once-in-a-lifetime\" experience. For some, the experience did live up to its name.",::Const.LegendMod.Language.pluralize(mercs.len(),"mercenaries", "mercenary"),::Const.LegendMod.Language.pluralize(mercs.len(),"hands", "hand")) + "}";
					this.World.Assets.addMoney(::Math.ceil(this.Flags.get("Cut") * 0.5 * 1.0 * mercs.len() / this.Flags.get("NumMercs")));
					this.List.push({
						id = 10,
						icon = "ui/icons/asset_money.png",
						text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + ::Math.ceil(this.Flags.get("Cut") * 0.5 * 1.0 * mercs.len() / this.Flags.get("NumMercs")) + "[/color] Crowns"
					});
				}


				this.List.push({
					id = 11,
					icon = "ui/icons/asset_brothers_bw.png",
					text = ::Const.LegendMod.Language.arrayToText(mercs, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + ::Const.LegendMod.Language.pluralize(mercs.len()," leaves", " leave") + " your party",
				});
			}
		});
		// None of the Mercenaries survived
		// PoV Note: Interesting case here - multiple possible event texts, with different event art for each
		this.m.Screens.push({
			ID = "MercsSurvival3",
			Title = "On your return...",
			Text = "{[img]gfx/ui/events/event_07.png[/img]The townsfolk notice the conspicuous absence of the mercenaries who left with you. Their eyes linger a moment too long, questions unasked but plainly felt. You endure the looks in silence, reminding yourself that it\'s better than being counted among the dead - which might well have been the case had the battle gone differently. | [img]gfx/ui/events/event_20.png[/img]The townsfolk barely take notice of your return, far too busy with their own worries to count who came back and who did not. You hope it stays that way. There are some absences best left unexplained. | [img]gfx/ui/events/event_20.png[/img]You turn, half-expecting to see the mercenaries falling in behind you, before remembering the way they fell — screaming, crushed, torn apart. You push the thought aside. Best not to dwell. You\'re alive, and that will have to be enough. | [img]gfx/ui/events/event_20.png[/img] The road back is quieter than expected. No chatter, no complaints, no new voices among your ranks. The mercenaries who joined you are gone, and the world moves on as if they never existed. For a brief moment, you wonder if you should feel something more.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Whoops.",
					function getResult()
					{
						return "Success1";
					}
				}
			],
			function start()
			{
			}
		});
	}

	function onPrepareVariables( _vars )
	{
		if (!::MSU.isNull(this.m.Peddler))
		{
			_vars.push([
				"peddler",
				::Const.UI.getColorized(this.m.Peddler.getName(), ::Const.UI.Color.getHighlightDarkBackgroundValue()),
			]);
			::Const.LegendMod.extendVarsWithPronouns(_vars, this.m.Peddler, "peddler");
		}

		_vars.push([ // Will store the cut that the optional characters ask for.
			"cut",
			::Const.UI.getColorized(this.m.Flags.get("Cut"), ::Const.UI.Color.getHighlightDarkBackgroundValue()),
		]);
		_vars.push([
			"reward",
			this.m.Reward
		]);
		_vars.push([
			"original_reward",
			this.m.OriginalReward
		]);
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
			this.m.SituationID = this.m.Home.addSituation(this.new("scripts/entity/world/settlements/situations/ambushed_trade_routes_situation"));
		}
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Destination != null && !this.m.Destination.isNull() && this.m.Destination.isAlive())
			{
				this.m.Destination.getSprite("selection").Visible = false;
				this.m.Destination.setOnCombatWithPlayerCallback(null);
			}

			this.m.Home.getSprite("selection").Visible = false;

			this.World.getGuestRoster().clear();
			this.m.Peddler = null;
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

