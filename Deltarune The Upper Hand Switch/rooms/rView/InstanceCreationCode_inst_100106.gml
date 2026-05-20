if (op.debug && false)
{
    des();
    array_push(op.progress, "view");
}

spawn_follow();
oPlayer.draw = true;
oFollow.draw = true;
res_i();
i3 = "CCsend";
i2 = 1;
i1 = 90;
i4 = 1;
wall = false;

if (array_contains(op.progress, "view"))
{
    des();
    res_i();
}
else
{
    oPlayer.x = 1270;
    audio_stop_all();
}

step = function()
{
    if (place_meeting(x - 2, y, oPlayer) && oPlayer.move && i1 < 100 && false)
    {
        oPlayer.move = false;
        i2 = 1;
    }
    
    if (i2 == 1)
    {
        i1++;
        
        if (i1 == 180)
        {
            oPlayer.doLerp = true;
            oPlayer.x = 1270;
            oPlayer.y = 360;
            oPlayer.sprite = sKris_Up;
            op.cameY = -240;
            oPlayer.pastXYS[18][0] = 1330;
            oPlayer.pastXYS[36][0] = 1210;
            oPlayer.pastXYS[18][1] = 360;
            oPlayer.pastXYS[36][1] = 360;
            oPlayer.pastXYS[18][2] = sKris_Up;
            oPlayer.pastXYS[36][2] = sKris_Up;
            oPlayer.pastXYS[18][3] = 0;
            oPlayer.pastXYS[36][3] = 0;
            
            with (oFollow)
            {
                if (numb == 1)
                {
                    x = oPlayer.pastXYS[18][0];
                    y = oPlayer.pastXYS[18][1];
                }
            }
            
            with (oFollow)
            {
                if (numb == 2)
                {
                    x = oPlayer.pastXYS[36][0];
                    y = oPlayer.pastXYS[36][1];
                }
            }
            
            i2 = 0;
            do_text(undefined, undefined, g_t("1_1"), ["ow", "forceDown"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
            {
                with (oInteract)
                {
                    if (i3 == "CCsend")
                    {
                        i2 = 1;
                        ow_music(mus_Steam_Jams, true);
                    }
                }
            });
        }
        
        if (i1 == 450)
        {
            i2 = 0;
            do_text(undefined, undefined, g_t("1_2"), ["ow", "forceDown"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
            {
                with (oInteract)
                {
                    if (i3 == "CCsend")
                        i2 = 1;
                }
            });
        }
        
        if (i1 == 540)
        {
            i2 = 0;
            do_text(undefined, undefined, g_t("1_3"), ["ow", "forceDown"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
            {
                with (oInteract)
                {
                    if (i3 == "CCsend")
                        i2 = 1;
                }
                
                sprite_follow(1, sSusie_Up, 0);
                sprite_follow(2, sRalsei_Up, 0);
            });
        }
        
        if (i1 == 675)
        {
            i2 = 0;
            do_text(undefined, undefined, g_t("1_4"), ["ow", "forceDown"], undefined, undefined, [snd_txtSus], undefined, undefined, [1, 2], undefined, function()
            {
                with (oInteract)
                {
                    if (i3 == "CCsend")
                        i2 = 1;
                }
            });
        }
        
        if (i1 > 675 && op.cameY != 0)
        {
            op.cameY += 2;
            
            if (op.cameY == 0)
            {
                with (oInteract)
                {
                    if (i3 == "CCsend")
                        des();
                }
                
                oPlayer.move = true;
                oPlayer.freeMove = false;
                array_push(op.progress, "view");
            }
        }
    }
    
    if (i1 >= 270 && i4 > 0)
        i4 -= 0.01;
};

drawEnd = function()
{
    ext(sPixel, 0, 0, -300, 9999, 9999, 0, 0, i4, 0);
};
