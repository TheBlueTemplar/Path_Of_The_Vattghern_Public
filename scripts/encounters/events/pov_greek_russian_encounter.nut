this.pov_greek_russian_encounter <- this.inherit("scripts/encounters/encounter", {
    m = {},
    function create()
    {
        this.createScreens();
        this.m.Type = "encounter.pov_greek_russian";
        this.m.Name = "Look for a missing ingredient...";
        this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
    }

     function createScreens() 
     {
        /* translations for curious little onlookers
        
        Russian - Why are you even bothering us? What does he want from us? Let him go to the black market—they'll find anything there for guys like him! You get it? Ask around tonight, those shady dealers might be able to help you out.

        Greek - Thieves, scumbags - all of them. Where are you sending him? Don’t get involved with the bandits of the north. Just go south, to lands and countries the people here don’t even know exist. You’ll look for alchemists… they’ll help you, if you’ve got the cash.
        */
        this.m.Screens.push({
            ID = "A",
            Title = "A commotion in the square...",
            Text = "[img]gfx/ui/events/pov_two_men_in_town.png[/img]{ Asking around for ingredients, you are pointed to the location of two outsiders, visitors to this area. \"They seems weird enough, like yous! You may find what you need\" was the precise wording of a kid that bothered to help you. You find them near an alley, talking in their own weird tongues. You decide to ask them anyways, and without hesitation, a young brazen man replies. %SPEECH_ON% Чё ты вообще к нам лезешь? Чего ему от нас надо? Пусть валит на чёрный рынок — там таким, как он, любую хрень найдут! Сечёшь? Поспрашивай ночью, эти мутные барыги, может, чем-нибудь помогут. %SPEECH_OFF% you are not sure if the guy is angry or not, and you did not really understand a thing. Before you are able to speak the other man chimes in. %SPEECH_ON% Κλέφτες, λαμόγια όλοι τους. Που τον στέλνεις; Μην ασχοληθείς με τους ληστές του βορρά, απλώς πήγαινε νότια, στα εδάφη και χώρες που οι κάτοικοι εδώ ούτε γνωρίζουν. Θα ψάξεις να βρείς αλχημιστές...θα σε βοηθήσουν αυτοί αν έχεις το ρευστό.%SPEECH_OFF% They then start arguing with each other. Their spoken languages audibly different, yet they someohow have full understanding of each other\'s words. You did not really understand much, and you know you won\'t, you waive them goodbye and go on your way.}"
            Image = "",
            List = [],
            Characters = [],
            Options = [
                {
                    Text = "Well that was a waste of time.",
                    function getResult( _event )
                    {
                        return 0;
                    }

                }
            ],
            function start( _event )
            {
                // Skibidi Gyatt kind of event!
                // wtf??? who writes these shitty comments??!?
                // teeheehee
            }

        });
    }

    function isVisible()
    {
        if (!this.World.getTime().IsDaytime)
        {
            return false;
        } 
        else
        {
            return true;
        }
    }

    function isValid(_settlement)
    {
        // Unlocked after PoV Story 02 special event, or by PoV origins
        // Also not on a south town
        if (!::World.Flags.has("GotMutagen"))
        {
            return false;
        }

        if (_settlement.isSouthern())
        {
            return false;
        }

        return !isOnCooldown();
    }

    function onPrepare()
    {
    }

    function onPrepareVariables( _vars )
    {

    }

    function onClear()
    {

    }

});

