::mods_hookNewObject("ui/screens/tooltip/tooltip_events", function(o){
	
    local pov_general_queryUIElementTooltipData = o.general_queryUIElementTooltipData;
    o.general_queryUIElementTooltipData = function (_entityId, _elementId, _elementOwner)
    {
		
        switch (_elementId)
        {
            // Combat Difficulties
            case "menu-screen.new-campaign.EasyDifficulty":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Beginner Difficulty"
                },
                {
                    id = 2,
                    type = "description", //Enemy scaling is same as normal, but 25% easier per bro.
                    text = "We all start somewhere.\n\n Enemy scaling rarely matches your own company strength one-to-one, often giving you an innate advantage in battles. Your fighters will gain bonus experience and retreating from battle is easier and less risky. You have a slight base positive hitchance modifier while your enemies have a negative one.\n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Combat difficulty affects most mechanics of PoV. On beginner difficulty, most effects buffing enemies will not appear, while enemy mutations will be very rare. Coprse and mutagen drop rates are also increased. It is earier to make a vattghern. [/color]\n\nRecommended for players new to the game or still learning."
                }
            ];

        case "menu-screen.new-campaign.NormalDifficulty":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Veteran Difficulty"
                },
                {
                    id = 2,
                    type = "description",
                    text = "Provides for a balanced playing experience that can be quite challenging at times.\n\n Enemy scaling typically matches your company strength one-to-one. You may experience some difficult fights, but rarely anything you cannot handle — unless you seek one out. You have a slight base positive hitchance modifier for all attacks against your enemies.\n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Combat difficulty affects most mechanics of PoV. On normal difficulty, most enemy monsters are buffed, but enemy mutations are still quite rare. Corpse and mutagen drop rates are very slightly increased. Xp gain is reduced by 5%. [/color]\n\nRecommended for players who enjoy a firm but fair experience in battles."
                }
            ];

        case "menu-screen.new-campaign.HardDifficulty":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "[color="+ ::Const.UI.Color.povTooltipRed +"]Expert Difficulty[/color]"
                },
                {
                    id = 2,
                    type = "description",
                    text = "The odds are against you. This is the intended difficulty and the one Legends is balanced around.\n\n Scaling is easier early game, then 1.5x as hard as normal for mid to late game. Enemies have a slight base hitchance modifier to strike you. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Combat difficulty affects most mechanics of PoV, which is designed and balanced around expert difficulty. All the mechanics of PoV are present, and all chances (corpse,mutation etc.) are at their base value. Xp gain is reduced by 10%. Expect this to be a fair challenge. [/color]\n\nRecommended for players who have mastered Vanilla and enjoy a tough, yet tactical experience."
                }
            ];

        case "menu-screen.new-campaign.LegendaryDifficulty":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "[color="+ ::Const.UI.Color.povTooltipRed +"]Death March[/color]"
                },
                {
                    id = 2,
                    type = "description",
                    text = "[color="+ ::Const.UI.Color.povTooltipGray +"](Same as Legendary Difficulty)[/color] Evil lurks in every corner — this is where legends are forged.\n\n All enemies gain new perks, some have new effects entirely. Scaling and mechanics is about that of Expert early game, but will rapidly increase mid-late game. Expect to see more champions earlier and harder enemies much sooner — along with the the experience and equipment they bring... \n\n [color="+ ::Const.UI.Color.povTooltipRed +"] Combat difficulty affects many different mechanics of PoV. Death March is the \"hard\" mode of this mod. Most drop chances are lower, it is harder to get a vattghern, and enemy mutations will appear much more often! Xp gain is reduced by 15%. This is meant to be hard, so only complain if it isn\'t! [/color]\n\n Recommended for those who enjoy a tactical challenge and can accept losses for a greater good."
                }
            ];

        // ECONOMIC DIFFICULTIES
        case "menu-screen.new-campaign.EasyDifficultyEconomic": 
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Beginner Difficulty"
                },
                {
                    id = 2,
                    type = "description",
                    text = "The world is mostly at peace and has been for several generations, many goods are plentiful and life is fruitful — for most. \n\n Prices are 5% better than normal and you will gain a base +10% from contract payments. \nQuantity of recruits is doubled and deserters will give their equipment to the company stash when they leave. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Economic difficulty is tweaked in PoV. While \"Beginner\" difficulty is largely unchanged. Healing and repairing out of camp will have a base rate of 80%. Stash and Resource capacity is also quite smaller. PoV increases the money one can get, so this option is NOT recommended.[/color] \n\nRecommended for players new to the game or have played little of Vanilla, if at all."
                }
            ];

        case "menu-screen.new-campaign.NormalDifficultyEconomic":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Veteran Difficulty"
                },
                {
                    id = 2,
                    type = "description",
                    text = "Join the world at a time of relative stability, provides for a balanced playing experience with some challenges. \n\n You will only have a base healing and repair rate of 60% outside camp. \nQuantity of recruits is increased by half and deserters will give their equipment to the company stash when they leave. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Economic difficulty is tweaked in PoV. \"Veteran\" difficulty has some nerfs. Get 5% worse prices and contract payments. Tryouts cost 10% more. Hiring and Wages are increased by 5%. Stash and Resource capacity is also smaller.[/color] \n\nRecommended for those who are new to legends/PoV and have mastered Vanilla at expert difficulty."
                }
            ];

        case "menu-screen.new-campaign.HardDifficultyEconomic":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "[color="+ ::Const.UI.Color.povTooltipRed +"]Expert Difficulty[/color]"
                },
                {
                    id = 2,
                    type = "description",
                    text = "The economic difficulty Legends is balanced around. You will need to plan ahead and budget accordingly.\n\n You will only have a base healing and repair rate of 25% outside camp. \nDeserters will take their equipment with them. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Economic difficulty is tweaked in PoV. \"Expert\" difficulty has significant nerfs. Get 10% worse prices and contract payments. Tryouts cost 15% more. Hiring and Wages are increased by 10%. Barter is 5% weaker. Stash and Resource capacity is also smaller.[/color] \n\nRecommended for those who want to experience Legends and PoV as orginally intended."
                }
            ];

        case "menu-screen.new-campaign.LegendaryDifficultyEconomic":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "[color="+ ::Const.UI.Color.povTooltipRed +"]Depression[/color]"
                },
                {
                    id = 2,
                    type = "description",
                    text = "[color="+ ::Const.UI.Color.povTooltipGray +"](Same as Legendary Difficulty)[/color]. The intended economic difficulty for Legends. Resources are hard to come by, you will need to persevere with what you are given - time will not be your friend.\n\n You will only have a base healing and repair rate of 10% outside camp. \nRecruit quantity and quality reduced by half and deserters will take their equipment with them. \n\n[color="+ ::Const.UI.Color.povTooltipRed +"] Economic difficulty is tweaked in PoV. \"Depression\" difficulty has very significant nerfs. Get 15% worse prices, and 20% less contract payments. Tryouts cost 20% more. Hiring and Wages are increased by 15%. Barter is 10% weaker. Stash and Resource capacity is also smaller.[/color] \n\nRecommended for those who usually end up with 6 digits in a few days, or just want an actual challenge."
                }
            ];

        // STARTING SUPPLIES OPTIONS   
        case "menu-screen.new-campaign.EasyDifficultyBudget":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "High Starting Resources"
                },
                {
                    id = 2,
                    type = "description",
                    text = "You\'ll start with more crowns, stash space and resources of your chosen story origin. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Note that in PoV, starting resources on \"High\" are lowered. [/color] \n\nRecommended for new players or those who do not wish to manage their inventory at all."
                }
            ];

        case "menu-screen.new-campaign.NormalDifficultyBudget":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Medium Starting Resources"
                },
                {
                    id = 2,
                    type = "description",
                    text = "You\'ll start with half the regular starting resources of your chosen story origin. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Note that in PoV, starting resources on \"Medium\" are slightly lowered. [/color] \n\nRecommended for a balanced experience."
                }
            ];

        case "menu-screen.new-campaign.HardDifficultyBudget":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Low Starting Resources"
                },
                {
                    id = 2,
                    type = "description",
                    text = "You\'ll start with reduced stash space and no bonus resources for your starting story origin. \n\nRecommended for experienced players who wish to build their company from the ground up by themselves."
                }
            ];

        case "menu-screen.new-campaign.LegendaryDifficultyBudget":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "[color="+ ::Const.UI.Color.povTooltipRed +"]No Starting Resources[/color]"
                },
                {
                    id = 2,
                    type = "description",
                    text = "You\'ll start without crowns or resources, unless your starting story origin takes pity and gives them to you. \n\nRecommended for those who have a keen logistic mind and can manage an inventory well."
                }
            ];

        // IRONMAN MODE ADDITIONAL EXPLANATION / WARNING
        case "menu-screen.new-campaign.Ironman":
            return [
                {
                    id = 1,
                    type = "title",
                    text = "Ironman"
                },
                {
                    id = 2,
                    type = "description",
                    text = "Not recommended in Legends. Ironman mode disables manual saving. Only a single save will exist for the company, and the game is automatically saved during the game and on exiting it. Losing the whole company means losing the save. Not recommended in while playing Legends due to possible save corruptions. \n\n [color="+ ::Const.UI.Color.povTooltipBlue +"] Not recommended to have it on with PoV, or heavily modded battle brothers in general, as possible issues, bugs, and save corruptions can ruin your run. [/color]\n\n Note that on weaker computers autosaves may result in the game pausing for a few seconds."
                }
            ];

        }

        return pov_general_queryUIElementTooltipData(_entityId, _elementId, _elementOwner);
	}

    // DO NOTHING
});