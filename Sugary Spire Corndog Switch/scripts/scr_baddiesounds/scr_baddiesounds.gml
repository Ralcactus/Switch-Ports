function scr_baddiesounds_init()
{
    sndCharge = fmod_createEventInstance("event:/SFX/enemies/charge");
    sndChargeElite = fmod_createEventInstance("event:/SFX/enemies/chargeelite");
    mySoundArray = [sndCharge, sndChargeElite];
}

function scr_baddiesounds()
{
    if (state != UnknownEnum.Value_2 && state != UnknownEnum.Value_22)
    {
        if (event_isplaying(sndCharge))
            fmod_event_stop(sndCharge, false);
        
        if (event_isplaying(sndChargeElite))
            fmod_event_stop(sndChargeElite, false);
    }
    
    for (var i = 0; i < array_length(mySoundArray); i++)
    {
        var snd_id = mySoundArray[i];
        fmod_quick3D(snd_id);
    }
}
