ty++;

if (fileShake != 0)
{
    fileShake -= sign(fileShake);
    fileShake *= -1;
}

if (keysOn && controlsKey == -1)
    use_keys();
else
    res_keys();

if (holdZ == 0)
{
    if (TapUP)
    {
        snd(snd_menumove);
        cur--;
        
        if (cur == -1)
            cur = array_length(menu[page][2]) - 1;
    }
    
    if (TapDOWN)
    {
        snd(snd_menumove);
        cur++;
        
        if (cur == array_length(menu[page][2]))
            cur = 0;
    }
    
    if (menu[page][0][2][cur] != -1)
    {
        if (TapZ)
        {
            TapZ = false;
            TapX = false;
            menu[page][0][2][cur]();
        }
    }
    
    if (array_length(undo) > 0)
    {
        if (TapX)
        {
            TapZ = false;
            TapX = false;
            undoDo();
        }
    }
}

if (ty > 10 && frontC < 255)
{
    frontC += 10;
    
    if (frontC > 255)
        frontC = 255;
    
    if (frontC == 255)
        keysOn = true;
}

if (musicSwap == 0 && page == 3)
{
    musicSwap = 1;
    audio_sound_gain(mus_title, 0, 1000);
    audio_sound_gain(mus_trouble_at_hand_old, 1, 1000);
    audio_resume_sound(mus_trouble_at_hand_old);
}

if (musicSwap == 1 && page < 3)
{
    musicSwap = 0;
    audio_sound_gain(mus_title, 1, 1000);
    audio_sound_gain(mus_trouble_at_hand_old, 0, 1000);
    audio_pause_sound(mus_trouble_at_hand_old);
}

if (benAlexCheck && (op.benMode || op.alexMode))
{
    benAlexCheck = false;
    audio_stop_all();
    
    if (op.benMode)
        audio_play_sound(mus_sigma_hickcore, -999, true);
    
    if (op.alexMode)
        audio_play_sound(mus_title_down_under, -999, true);
}
