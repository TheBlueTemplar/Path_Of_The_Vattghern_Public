this.pov_teach_to_read_camp_encounter <- this.inherit("scripts/encounters/encounter", {
    m = {
        teacher = null,
        student = null
    },
    function create()
    {
        this.createScreens();
        this.m.Type = "encounter.pov_teach_to_read_camp_encounter";
        this.m.Name = "A company member wants to speak";
        this.m.Cooldown = 12.0 * this.World.getTime().SecondsPerDay;
    }

    function createScreens() 
    {
        this.m.Screens.push({
            ID = "A",
            Title = "Education!",
            Text = "[img]gfx/ui/events/pov_reader.png[/img]{While doing a routine check around camp, your attention is drawn to %teacher%, who is reading. It takes only a short conversation with %them_teacher%, for you to receive an interesting proposal... %SPEECH_ON% ...You never know what hidden knowledge lies between the pages of lost tomes, but alas, that is not your concern. May I suggest though, there are some people here who could benefit from being able to read, maybe expand their skillset a little. %SPEECH_OFF% You are about to reply as you are cut off by %their_teacher% excitement. %SPEECH_ON% I could help with teaching one of our comrades how to read! %student% expressed interest recently, but honestly it could be anyone of your choosing, as long as they have the capacity for it. It will take some time and effort from their part, but I assure you it is well worth it! What do you think? %SPEECH_OFF% Now that you are allowed to, you reply...}",
            Image = "",
            List = [],
            Characters = [],
            Options = [
                {
                    Text = "Sure thing!",
                    function getResult( _event )
                    {
                        return "B";
                    }

                }
            ],
            function start( _event )
            {
                this.Options.push({
                        Text = "Rather not waste your time.",
                        function getResult( _event )
                        {
                            return 0;
                        }
                    });
            }

        });

        this.m.Screens.push({
            ID = "B",
            Title = "Education!",
            Text = "[img]gfx/ui/events/pov_reader.png[/img]{%teacher% nods happily. %SPEECH_ON% Great! I will prepare a few simple notes then, letters, easy words, some sketches....yes... Tell me then when you decide who you want me to help, and I will gladly do so. %SPEECH_OFF% [color=" + this.Const.UI.Color.povEvent + "] An item has been added to your inventory, which you can use to teach a capable company member to read. [/color]}",
            Image = "",
            List = [],
            Characters = [],
            Options = [
                {
                    Text = "Let\'s get this process started then.",
                    function getResult( _event )
                    {
                        return 0;
                    }

                }
            ],
            function start( _event )
            {
                // I NEED TO DO ALL THIS!
                local item = this.new("scripts/items/special/pov_reading_notes");
                //item.m.Name = "Bleidd";
                this.World.Assets.getStash().add(item);

                _event.m.teacher.improveMood(0.5, "Gets to teach someone to read");

                this.List.push({
                    id = 10,
                    icon = "ui/items/" + item.getIcon(),
                    text = "You get " + item.getName()
                });
                this.List.push({
                    id = 10,
                    icon = this.Const.MoodStateIcon[_event.m.teacher.getMoodState()],
                    text = _event.m.teacher.getName() + this.Const.MoodStateEvent[_event.m.teacher.getMoodState()]
                });

            }

        });
    }

    function isValid(_camp)
    {
        local brothers = this.World.getPlayerRoster().getAll();
        local teacher_candidates = [];
        local non_readers = [];
        
        foreach( bro in brothers )
        {
            if (bro.getFlags().has("PovCanRead"))
            {
                teacher_candidates.push(bro);
            }

            if (!bro.getFlags().has("PovCanRead") && (!bro.getSkills().hasTrait(::Legends.Trait.Dumb) || !bro.getSkills().hasSkill("injury.brain_damage") || !bro.getBackground().getID() == "background.wildman"))
            {
                non_readers.push(bro);
            }
        }

        if (teacher_candidates.len() <= 0 || non_readers.len() <= 0)
        {
            return;
        }

        if (!this.World.Assets.getStash().hasEmptySlot())
        {
            return;
        }

        this.m.teacher = teacher_candidates[this.Math.rand(0, teacher_candidates.len() - 1)];
        this.m.student = non_readers[this.Math.rand(0, non_readers.len() - 1)];
        return !isOnCooldown();
    }

    function onPrepare()
    {
    }

    function onPrepareVariables( _vars )
    {
        _vars.push([
            "teacher",
            this.m.teacher.getName()
        ]);
        ::Const.LegendMod.extendVarsWithPronouns(_vars, this.m.teacher.getGender(), "teacher");
         _vars.push([
            "student",
            this.m.student.getName()
        ]);
        ::Const.LegendMod.extendVarsWithPronouns(_vars, this.m.student.getGender(), "student");
    }

    function onClear()
    {
        this.m.student = null;
        this.m.teacher = null;
    }

});


