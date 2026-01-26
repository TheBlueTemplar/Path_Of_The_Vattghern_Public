this.pov_seer_recruitment_camp_encounter <- this.inherit("scripts/encounters/encounter", {
    m = {
        Seer = null
    },
    function create()
    {
        this.createScreens();
        this.m.Type = "encounter.pov_seer_recruitment_camp_encounter";
        this.m.Name = "A Stranger Wants to Talk";
        this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
    }

    function createScreens() {
        this.m.Screens.extend([{
            ID = "Start",
            Title = "On the outskirts...",
            Text = "[img]gfx/ui/events/pov_seer.png[/img]Night has settled over the camp, the men busy with their own thoughts as firelight flickers across tired faces and battered gear. It is then that one of your company approaches, hesitating for a moment before speaking. He tells you there is a man at the edge of the camp who insists on seeing you... an old one, wrapped in dark robes, carrying himself with unsettling calm. No one recalls seeing him approach. \n\n You rise and follow, the sounds of the camp fading as you near the fire\'s edge. There stands the stranger, leaning upon a staff marked with symbols that seem to shift when not directly observed. His eyes lift to meet yours, and a pressure settles behind them, firm but restrained. %SPEECH_ON%So this is the one who walks with a bound shadow.%SPEECH_OFF% The old man studies you openly, as though reading something written beneath the skin. The weight in your mind eases, though it does not fully leave. %SPEECH_ON%A vattghern does not linger without purpose. It has chosen well. The signs are clear. Forces stir that will not be stopped by steel alone. And you, you are worthy of guidance - of wisdom tempered by age, and strength that endures.%SPEECH_OFF% The air feels heavier now, charged with meaning. %SPEECH_ON%I would stand with your company and help face what is yet to come. The storm approaches, and it would be unwise to meet it alone.%SPEECH_OFF% As his words fade, the pressure in your mind loosens its grip, leaving behind an uneasy certainty that the old man speaks the truth..",
            Image = "",
            List = [],
            Characters = [],
            Options = [
            {
                Text = "Welcome to the %companyname%. *creepy old guy*",
                function getResult(_event) {
                    ::World.getPlayerRoster().add(_event.m.Seer);
                    ::World.getTemporaryRoster().clear();
                    _event.m.Seer.onHired();
                    _event.m.Seer = null;
                    return 0;
                }
            },
            {
                Text = "Appreciate the offer, but you are not needed here.",
                function getResult(_event) {
                    ::World.getTemporaryRoster().clear();
                    _event.m.Seer = null;
                    return 0;
                }
            }
            ]
            function start(_event) {
                local roster = ::World.getTemporaryRoster();
                _event.m.Seer = roster.create("scripts/entity/tactical/player");
                _event.m.Seer.setStartValuesEx(["pov_seer_background"]);
                this.Characters.push(_event.m.Seer.getImagePath());
            }
        }]);
    }

    function isValid(_settlement) {
        if (::World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
            return false;

        if (!::World.Flags.has("GotVattghern"))
            return false;

        if (::World.getPlayerRoster().getSize() >= ::World.Assets.getBrothersMax())
            return false;

        if (this.World.getTime().Days < 30)
            return false;
            
        // map check, not appear at north or south edges!
        local playerTile = ::World.State.getPlayer().getTile();
        if (playerTile.SquareCoords.Y > ::World.getMapSize().Y * 0.8 || playerTile.SquareCoords.Y < ::World.getMapSize().Y * 0.2)
            return false;

        foreach (bro in ::World.getPlayerRoster().getAll()) 
        {
            if (bro.getBackground().getID() == "background.pov_seer")
                return false;
        }

        return !this.isOnCooldown();
    }

    function onClear() {
        this.m.Seer = null;
    }

});


