if (damageWait > 0)
    damageWait--;

if (damageWait == 0 && oSoul.invis == 0 && !as("nd"))
{
    if (place_meeting(x, y, oSoul))
    {
        if (oSoul.iframes == 0)
        {
            snd(snd_hurt1);
            oSoul.iframes = oSoul.iframes_max;
            screenShake(3, 3);
        }
        
        if (!as("keep"))
            des(0);
    }
}
