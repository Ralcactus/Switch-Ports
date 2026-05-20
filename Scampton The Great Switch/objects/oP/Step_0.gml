if (room != rGameOver)
{
    Zoom += ((TargetZoom - Zoom) / ZoomDelay);
    camera_set_view_size(view_camera[0], 640 * Zoom, 480 * Zoom);
}

if (room == rBattle_2 || room == rOutro)
{
}
else
{
    HaveHit = 0;
    WayWin = 0;
}

Tyme += 1;

if (Tyme == 1)
{
    if (PlayTest)
        instance_create_depth(0, 0, -30000, oPT);
}

if (oP.MM_KeyTyme > 0)
    oP.MM_KeyTyme -= 1;

if (keyboard_check(vk_f4))
{
    if (F4toggle)
    {
        F4toggle = false;
        
        if (F4state == 0)
        {
            window_set_fullscreen(true);
            F4state = 1;
        }
        else
        {
            window_set_fullscreen(false);
            F4state = 0;
        }
    }
}
else
{
    F4toggle = true;
}

if (AllowPM && !PistonMode && room == rMainu)
{
    pKey[0] = false;
    pKey[1] = false;
    pKey[2] = false;
    
    if (keyboard_check(ord("0")))
    {
        pKey[0] = keyboard_check(ord("H"));
        pKey[1] = keyboard_check(ord("I"));
        pKey[2] = keyboard_check(ord("3"));
    }
    
    if (pKey[0] || pKey[1] || pKey[2])
    {
        PC++;
        
        if (PC == 1)
        {
            if ((pKey[0] && PK == 0) || (pKey[1] && PK == 1) || (pKey[2] && PK >= 2))
            {
                sou(79);
                oAlways.ShakePower = 10;
                oAlways.ShakeTyme = 10;
            }
        }
    }
    else
    {
        PC = 0;
    }
    
    if (PC == 1 && pKey[0] && PK == 0)
        PK++;
    
    if (PC == 1 && pKey[1] && PK == 1)
        PK++;
    
    if (PC == 1 && pKey[2] && PK >= 2)
        PK++;
    
    if (PK == 5)
    {
        PistonMode = true;
        audio_stop_sound(circus);
        audio_stop_sound(Evil_Lom_Laugh);
        sou(snd_explosion);
        sou(halo_laugh);
        sou(halo_laugh);
        sou(halo_laugh);
        
        with (instance_create_depth(x, y, -32000, oEEF))
            Seed = "WhiteFlash2";
    }
}

if (PistonMode)
{
    PT++;
    
    if (PT == 20)
    {
        audio_play_sound(M, 0, true);
        Csound = 53;
    }
}
