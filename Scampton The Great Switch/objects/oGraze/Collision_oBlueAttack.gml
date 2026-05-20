with (other)
{
    if (Tick)
    {
        Tick = false;
        
        if (oTP.TP != 100)
            oTP.TP += 1;
        
        if (TickSound)
        {
            audio_stop_sound(snd_graze);
            sou(41);
        }
        
        oSoul.GrazeAlpha = 1;
        oSoul.GrazeIndex = 0;
    }
}
