op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = 0;
audio_stop_all();
ow_music_stop();
create_char("s", 320, 340, sSusie_RockEat, 1);
create_char("r", 244, 386, Ralsei_sit, 1);
create_char("k", 396, 386, sKrisF_Damage, 0);
char("k").image_index = 1;
char("k").image_xscale = -2;
res_i();
i1 = 1;
i3 = -1;
i4 = 0;
i5 = 0;

funcStep = function()
{
    i++;
    
    if (i == 150)
    {
        do_text(undefined, undefined, g_t("15_1"), ["ow", "forceUp"], [sFont1], undefined, [snd_txtral, snd_txtral, snd_txtral], undefined, undefined, [54, 35, 54], [-1, -1, -1], function()
        {
            i2 = g_t("15_0");
            make_prompt([i2[0], i2[1]], [function()
            {
                oCC.i3 = 2;
            }, function()
            {
                oCC.i3 = 3;
            }]);
        });
    }
    
    if (i3 != -1 && i3 != "done")
    {
        if (i3 == 2)
        {
            do_text(undefined, undefined, g_t("15_2"), ["ow", "forceUp"], [sFont1], undefined, [snd_txtral], undefined, undefined, [15, 21], [-1, -1], function()
            {
                oCC.i3 = "done";
            });
        }
        
        if (i3 == 3)
        {
            do_text(undefined, undefined, g_t("15_3"), ["ow", "forceUp"], [sFont1], undefined, [snd_txtral], undefined, undefined, [55, 7, 7], [-1, -1, -1], function()
            {
                i2 = g_t("15_0");
                make_prompt([i2[2], i2[3]], [function()
                {
                    oCC.i3 = 2;
                }, function()
                {
                    oCC.i3 = 4;
                }], -76);
            });
        }
        
        if (i3 == 4)
        {
            do_text(undefined, undefined, g_t("15_4"), ["ow", "forceUp"], [sFont1], undefined, [snd_txtral, snd_txtral, snd_txtral, snd_txtSus], undefined, undefined, [21, 15, 56, 49], [-1, -1, -1, -1], function()
            {
                room_goto(rSockTransformation);
            });
        }
        
        i3 = -1;
    }
    
    if (i3 == "done")
    {
        i4++;
        
        if (i4 == 30)
            audio_play_sound(mus_star, -999, false);
        
        if (i4 > 30)
        {
            if (i5 < 180)
            {
                i5 += 1;
                
                if (i5 > 180)
                    i5 = 180;
            }
            
            op.camY = -(240 + (dcos(180 + i5) * 240));
        }
        
        if (i4 == 240)
            room_goto(rLighthoos);
    }
};

funcDrawGUI = function()
{
    ext(sBBG1, 6, 0, 0, 2, 2, 0, 16777215, i1);
    
    if (i1 > 0)
        i1 -= 0.016666666666666666;
};
