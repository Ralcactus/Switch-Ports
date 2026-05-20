Tyme += 1;

if ((Tyme == 90 && oP.Deaths == 1) || (Tyme == 45 && oP.Deaths > 1))
{
    sou(89);
    
    with (instance_create_depth(180, 120, 0, oTextEngine))
    {
        Text[0] = "Game Over";
        StringAT = 999;
        BC = false;
        image_xscale = 4;
        image_yscale = 4;
    }
    
    with (instance_create_depth(282, 264, 0, oTextEngine))
    {
        Text[0] = "Retry";
        StringAT = 999;
        BC = false;
        Seed = "GO";
        Spez = 1;
    }
    
    with (instance_create_depth(226, 300, 0, oTextEngine))
    {
        Text[0] = "Back to menu";
        StringAT = 999;
        BC = false;
        Seed = "GO";
        Spez = 2;
        RGB = make_color_rgb(63.75, 63.75, 63.75);
    }
    
    oAlways.MM_Cursor = "GO_1";
}

audio_sound_pitch(oP.MusicP, oAlways.BattleMusicPitch - (Tyme / 100));
