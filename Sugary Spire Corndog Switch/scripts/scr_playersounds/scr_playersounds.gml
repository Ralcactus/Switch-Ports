function scr_playersounds_init()
{
    sndMach = fmod_createEventInstance("event:/SFX/player/mach");
    sndGalloping = fmod_createEventInstance("event:/SFX/general/galloping");
    sndGumbobFlying = fmod_createEventInstance("event:/SFX/player/gumbobpropeller");
    sndSuplex = fmod_createEventInstance("event:/SFX/player/suplexdash");
    sndKungFu = fmod_createEventInstance("event:/SFX/player/kungfu");
    sndJump = fmod_createEventInstance("event:/SFX/player/jump");
    sndFlip = fmod_createEventInstance("event:/SFX/player/flip");
    sndFreefall = fmod_createEventInstance("event:/SFX/player/freefall");
    sndSuperjump = fmod_createEventInstance("event:/SFX/player/superjump");
    sndTumble = fmod_createEventInstance("event:/SFX/player/tumble");
    sndRoll = fmod_createEventInstance("event:/SFX/player/machroll");
    sndFireass = fmod_createEventInstance("event:/SFX/player/fireass");
    sndCrouchslide = fmod_createEventInstance("event:/SFX/player/crouchslide");
    sndRollGetUp = fmod_createEventInstance("event:/SFX/player/rollgetup");
    sndDive = fmod_createEventInstance("event:/SFX/player/dive");
    voiceScream = fmod_createEventInstance("event:/SFX/player/voice/scream");
    voiceCollect = fmod_createEventInstance("event:/SFX/player/voice/collect");
    voiceTransfo = fmod_createEventInstance("event:/SFX/player/voice/transfo");
    voiceDetransfo = fmod_createEventInstance("event:/SFX/player/voice/outtransfo");
    voiceIdle = fmod_createEventInstance("event:/SFX/player/voice/idle");
    voiceHurt = fmod_createEventInstance("event:/SFX/player/voice/hurt");
    transfoSound = undefined;
    oldTransfoSound = undefined;
    mySoundArray = [sndMach, sndSuplex, sndKungFu, sndJump, sndFlip, sndFreefall, sndSuperjump, sndTumble, sndRoll, sndFireass, sndCrouchslide, sndRollGetUp, sndDive, voiceScream, voiceCollect, voiceTransfo, voiceDetransfo, voiceIdle, voiceHurt];
}

function scr_playersounds()
{
    var saved_state = global.freezeframe ? frozenState : state;
    oldTransfoSound = transfoSound;
    
    if (saved_state != UnknownEnum.Value_110)
    {
        transfoSound = scr_transformationCheck(saved_state);
        
        if (oldTransfoSound != transfoSound)
        {
            var _has_transfo = !is_undefined(transfoSound);
            event_play_oneshot(_has_transfo ? "event:/SFX/general/transfo" : "event:/SFX/general/detransfo", x, y);
            fmod_global_setParameter("transfo", _has_transfo, false);
            
            if (chance(50))
                fmod_event_play(_has_transfo ? voiceTransfo : voiceDetransfo);
            
            switch (_has_transfo ? transfoSound : oldTransfoSound)
            {
                case "Cottoncoated":
                    if (!_has_transfo)
                        event_play_oneshot("event:/SFX/cotton/lose", x, y);
                    
                    break;
            }
        }
    }
    
    if (sprite_index == spr_tumblestart || sprite_index == spr_tumble || (saved_state == UnknownEnum.Value_120 && sprite_index == spr_player_GB_bounce_mach2))
    {
        if (!event_isplaying(sndTumble))
        {
            if (sprite_index == spr_tumblestart)
                fmod_event_setParameter(sndTumble, "state", 0, true);
            else
                fmod_event_setParameter(sndTumble, "state", 1, true);
            
            fmod_event_play(sndTumble);
        }
    }
    else if (sprite_index == spr_tumbleend || (saved_state == UnknownEnum.Value_120 && sprite_index == spr_player_GB_bounce_mach2))
    {
        fmod_event_setParameter(sndTumble, "state", 2, true);
    }
    else if (event_isplaying(sndTumble) && fmod_event_getParameter(sndTumble, "state") < 2)
    {
        fmod_event_stop(sndTumble, true);
    }
    
    if (event_isplaying(sndSuplex) && saved_state != UnknownEnum.Value_16)
        fmod_event_stop(sndSuplex, true);
    
    if (sprite_index == spr_mach2jump)
    {
        if (!event_isplaying(sndFlip))
            fmod_event_play(sndFlip);
    }
    else
    {
        fmod_event_stop(sndFlip, true);
    }
    
    if (state == UnknownEnum.Value_28 || state == UnknownEnum.Value_120)
    {
        if (!event_isplaying(sndRoll))
            fmod_event_play(sndRoll);
    }
    else
    {
        fmod_event_stop(sndRoll, true);
    }
    
    if (grounded && saved_state == UnknownEnum.Value_78 && sprite_index != spr_player_PZ_dogMount_skid)
    {
        if (!event_isplaying(sndGalloping))
            fmod_event_play(sndGalloping);
    }
    else if (event_isplaying(sndGalloping))
    {
        fmod_event_stop(sndGalloping, true);
    }
    
    if (saved_state == UnknownEnum.Value_117)
    {
        if (!event_isplaying(sndGumbobFlying))
            fmod_event_play(sndGumbobFlying);
    }
    else if (event_isplaying(sndGumbobFlying))
    {
        fmod_event_stop(sndGumbobFlying, true);
    }
    
    if (saved_state == UnknownEnum.Value_69 || saved_state == UnknownEnum.Value_51 || saved_state == UnknownEnum.Value_33)
    {
        if (!event_isplaying(sndFreefall))
            fmod_event_play(sndFreefall);
    }
    else
    {
        fmod_event_stop(sndFreefall, true);
    }
    
    if (saved_state == UnknownEnum.Value_59)
    {
        if (!event_isplaying(sndSuperjump))
        {
            fmod_event_setParameter(sndSuperjump, "state", 0, true);
            fmod_event_play(sndSuperjump);
        }
    }
    else if (saved_state == UnknownEnum.Value_58 || saved_state == UnknownEnum.Value_103)
    {
        fmod_event_setParameter(sndSuperjump, "state", 1, true);
    }
    else if (saved_state != UnknownEnum.Value_58 && saved_state != UnknownEnum.Value_103)
    {
        if (event_isplaying(sndSuperjump) && fmod_event_getParameter(sndSuperjump, "state") < 1)
            fmod_event_stop(sndSuperjump, 1);
        
        if (!event_isplaying(sndSuperjump))
            fmod_event_setParameter(sndSuperjump, "state", 0, true);
    }
    
    if (saved_state == UnknownEnum.Value_64 || saved_state == UnknownEnum.Value_3 || saved_state == UnknownEnum.Value_65 || saved_state == UnknownEnum.Value_11 || saved_state == UnknownEnum.Value_145 || saved_state == UnknownEnum.Value_12)
    {
        if (!event_isplaying(sndMach))
            fmod_event_play(sndMach);
        
        var machsnd = 0;
        
        if ((saved_state == UnknownEnum.Value_64 && sprite_index == spr_mach1) || (saved_state == UnknownEnum.Value_3 && sprite_index == spr_mach1))
            machsnd = 1;
        else if ((saved_state == UnknownEnum.Value_64 && sprite_index == spr_mach2) || (saved_state == UnknownEnum.Value_3 && movespeed < 12) || (saved_state == UnknownEnum.Value_11 || saved_state == UnknownEnum.Value_145 || saved_state == UnknownEnum.Value_12))
            machsnd = 2;
        else if ((saved_state == UnknownEnum.Value_65 && sprite_index != spr_crazyrun) || saved_state == UnknownEnum.Value_3)
            machsnd = 3;
        else if (sprite_index == spr_crazyrun)
            machsnd = 4;
        
        fmod_event_setPause(sndMach, false);
        fmod_event_setParameter(sndMach, "state", machsnd, true);
    }
    else
    {
        fmod_event_stop(sndMach, true);
    }
    
    for (var i = 0; i < array_length(mySoundArray); i++)
    {
        var snd_id = mySoundArray[i];
        fmod_quick3D(snd_id);
    }
}
