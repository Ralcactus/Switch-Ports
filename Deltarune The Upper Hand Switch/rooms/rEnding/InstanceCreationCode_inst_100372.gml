op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = -300;
audio_stop_all();
ow_music_stop();
create_char("k", 244, 460, sKris_Up, 0);
create_char("s", 320, 420, sSusie_Up, 0);
create_char("r", 396, 460, sRalsei_Up, 0);
create_char("sock", 320, 276, sSock_Up_Sad, 0);
char("sock").image_index = 1;
char("sock").image_alpha = 0;
res_i();
i1 = 0;
i3 = 0;
res_j();
fadeAlpha = 1;

funcStep = function()
{
    i++;
    
    if (i == 1)
    {
        if (op.endingGet != "s" && op.endingGet != "f")
            op.endingGet = "s";
        
        if (op.endingGet == "s")
            array_push(op.save, "win1");
        
        if (op.endingGet == "f")
            array_push(op.save, "win2");
        
        file_save();
    }
    
    if (i == 210)
    {
        if (op.endingGet == "s")
        {
            do_text(undefined, undefined, g_t("end_good"), ["ow", "forceUp"], [sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1], undefined, [snd_txtMonster, snd_txtMonster, snd_txtral, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster], undefined, undefined, [-1, -1, 64, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [-1, function()
            {
                ow_music(mus_constellation, true);
                audio_sound_gain(mus_constellation, 1, 0);
                
                if (op.alexMode)
                {
                    audio_stop_all();
                    ow_music(mus_endingbuster);
                }
                
                if (op.benMode)
                {
                    if (!op.alexMode)
                        audio_stop_all();
                    
                    ow_music(mus_tobybuster_r);
                }
            }, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, function()
            {
                op.twait = 120;
                
                op.twaitFunc = function()
                {
                    snd(snd_item);
                };
                
                oCC.i3 = 1;
            }, function()
            {
                snd(snd_item);
            }], function()
            {
                oCC.i1 = 1;
                audio_sound_gain(mus_constellation, 0, 3000);
            });
        }
        
        if (op.endingGet == "f")
        {
            do_text(undefined, undefined, g_t("end_bad"), ["ow", "forceUp"], [sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1], undefined, [snd_txtMonster, snd_txtMonster, snd_txtSus, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster], undefined, undefined, [-1, -1, 49, -1, -1, -1, -1, -1, -1, -1], [-1, function()
            {
                ow_music(mus_constellation, true);
                audio_sound_gain(mus_constellation, 1, 0);
                
                if (op.alexMode)
                {
                    audio_stop_all();
                    ow_music(mus_endingbuster);
                }
                
                if (op.benMode)
                {
                    if (!op.alexMode)
                        audio_stop_all();
                    
                    ow_music(mus_tobybuster_r);
                }
            }, -1, -1, -1, -1, -1, -1, function()
            {
                op.twait = 120;
                
                op.twaitFunc = function()
                {
                    snd(snd_item);
                };
                
                oCC.i3 = 1;
            }, function()
            {
                snd(snd_item);
            }], function()
            {
                oCC.i1 = 1;
                audio_sound_gain(mus_constellation, 0, 3000);
            });
        }
    }
};

starAlpha = 1;
starY = -340;

funcDraw = function()
{
    if (i > 45)
    {
        starY = lerp(starY, 240, 0.05);
        
        if (i3 == 1 && starAlpha > 0)
            starAlpha -= 0.016666666666666666;
        
        if (!(op.ty % 5) && starAlpha != 0)
            spawnEEF(320, starY, sEEF_star2, 0, "ending_star,drawN");
    }
    
    gpu_set_blendmode(bm_add);
    ext(sSockStar, op.ty / 10, 320, starY + (dsin(op.ty * 2) * 10), 2, 2, 0, rgb(255 * starAlpha, 255 * starAlpha, 255 * starAlpha), 1);
    gpu_set_blendmode(bm_normal);
};

funcDrawGUI = function()
{
    if (op.camY < 0)
    {
        op.camY += 3.3333333333333335;
        
        if (op.camY > 0)
            op.camY = 0;
    }
    
    if (i1 == 0)
        fadeAlpha -= 0.011111111111111112;
    else
        fadeAlpha += 0.011111111111111112;
    
    fadeAlpha = clamp(fadeAlpha, 0, 1);
    ext(sPixel, 0, 0, 0, 999, 999, 0, 0, fadeAlpha);
    
    if (i1 != 0)
    {
        i2++;
        
        if (i2 == 210)
            room_goto(rMainMenu);
    }
};
