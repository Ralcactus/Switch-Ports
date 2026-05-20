audio_stop_sound(mus_Sockswald_loop);
op.camMode = "player";
op.parameter = [0, 640, 0, 480];
op.drawFollow = true;
op.eggCounter = 0;
ow_music(mus_Steam_Jams);

if (!array_contains(op.progress, "sockIntro"))
{
    if (oPlayer.x > 640)
        audio_sound_gain(mus_Steam_Jams, 0, 0);
}

res_i();
i2 = 960;
i = (1280 - oPlayer.x) / i2;

funcDraw = function()
{
    if (!array_contains(op.progress, "sockIntro"))
    {
        i += ((((1280 - oPlayer.x) / i2) - i) / 10);
        
        if (oPlayer.x > 640)
        {
            if (oPlayer.x < 1020)
                audio_sound_gain(mus_Steam_Jams, i, 0);
        }
        else
        {
            audio_sound_gain(mus_Steam_Jams, 1, 0);
        }
        
        if (oPlayer.x >= 1020)
        {
            if (i1 == 0)
            {
                audio_sound_gain(mus_Steam_Jams, 0, 1000);
                i1 = 1;
            }
        }
        else
        {
            i1 = 0;
        }
    }
};

if (!array_contains(op.progress, "view"))
    array_push(op.progress, "view");
