this.pov_vomit_skill <- ::inherit("scripts/skills/skill", {
    m = {
        Cooldown = 0
    },
    function create()
    {
        this.m.ID = "actives.pov_vomit";
        this.m.Name = "Vomit";
        this.m.Description = "You\'re sick, but that doesn\'t mean you\'re useless, vomit on enemy to spread sickness. Chance to spread [color=" + this.Const.UI.Color.povTooltipRed + "]rot, stagger, distract and baffle your opponent[/color] (30% chance for each of these effects, will always stagger). \n\n Has 1 Turn cooldown";
        this.m.Icon = "skills/pov_active_vomit.png";
        this.m.IconDisabled = "skills/pov_active_vomit_sw.png";
        this.m.Overlay = "pov_active_vomit";
        this.m.SoundOnUse = [
            "sounds/combat/pov_vomit.wav"
        ];
        this.m.Type = this.Const.SkillType.Active;
        this.m.Order = this.Const.SkillOrder.UtilityTargeted;
        this.m.IsSerialized = false;
        this.m.IsActive = true;
        this.m.IsTargeted = true;
        this.m.IsAttack = false;
        this.m.IsUsingHitchance = false;
        this.m.IsIgnoredAsAOO = true;
        this.m.IsWeaponSkill = false;
        //this.m.IsAttack = true;
        this.m.ActionPointCost = 3;
        this.m.FatigueCost = 15;
        this.m.MinRange = 1;
        this.m.MaxRange = 1;
    }

    function getTooltip()
    {
        return this.getDefaultUtilityTooltip();
    }

    function onTurnStart()
    {
        this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
    }

    function isUsable()
    {
        if (this.m.Cooldown <= 0){
            return true;
        }else{
            return false;
        }
    }

    function onUse( _user, _targetTile )
    {
        this.m.Cooldown = 1;

        local target = _targetTile.getEntity();
        local staggerChance =   100;
        local baffleChance =    30;
        local distractChance =  30;
        local rotChance =       30;
        
        if (target.isAlive())
        {
            if (this.Math.rand(0, 100) < staggerChance)
            {
                if (!target.isHiddenToPlayer())
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got dazed!");
                }

                local effect = this.new("scripts/skills/effects/staggered_effect");
                target.getSkills().add(effect);
            }

            if (this.Math.rand(0, 100) < baffleChance)
            {
                if (!target.isHiddenToPlayer())
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got baffled!");
                }

                local effect = this.new("scripts/skills/effects/legend_baffled_effect");
                target.getSkills().add(effect);
            }

            if (this.Math.rand(0, 100) < distractChance)
            {
                if (!target.isHiddenToPlayer())
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got dazed!");
                }

                local effect = this.new("scripts/skills/effects/pov_distracted_effect");
                target.getSkills().add(effect);
            }

            if (this.Math.rand(0, 100) < rotChance)
            {
                if (!target.isHiddenToPlayer())
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " got stunned!");
                }

                local effect = this.new("scripts/skills/effects/pov_stench_effect");
                target.getSkills().add(effect);
            }
        }

        this.spawnIcon("status_effect_54", _targetTile);
        _targetTile.spawnDetail("detail_vomit");
        return true;
    }
});