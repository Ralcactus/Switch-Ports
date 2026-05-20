Tyme += 1;

if (Seed == 1)
{
    x += wX;
    y += wY;
    wX -= 0.5;
    
    if (y > 45 && y < 30)
    {
        wY *= 0.9;
        x += ((63 - x) / 10);
    }
    else
    {
        if (y < 55)
            wY += 0.75;
        
        if (y > 220)
            wY -= 0.75;
    }
    
    if (x <= 45)
    {
        oTP.TP += _TP;
        
        if (oMakeUI.Pattern != "L1")
            audio_play_sound(snd_graze, 999, false);
        
        des(0);
    }
}

if (Seed == 2)
{
    x += wX;
    y += wY;
}
