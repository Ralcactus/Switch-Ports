res_i();
i1 = "CC2";
wall = false;

if (array_contains(op.progress, "sockIntro2"))
    des();

step = function()
{
    if (i2 == 0)
    {
        if (place_meeting(x, y, oPlayer) && i == 0)
        {
            i = 1;
            do_text(undefined, undefined, g_t("4_1"), ["ow"], undefined, undefined, [snd_txtSus], undefined, undefined, [17], undefined, function()
            {
                move_player(40, 900, 180, -1, 5, function()
                {
                    sprite_player(sKris_Down, 0);
                });
                move_follow(1, 40, 960, 230, -1, 5, function()
                {
                    sprite_follow(1, sSusie_Sprites, 3);
                });
                move_follow(2, 40, 840, 230, -1, 5, function()
                {
                    sprite_follow(2, sRalsei_Right, 0);
                });
                
                with (oInteract)
                {
                    if (i1 == "CC2")
                    {
                        i2 = 1;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 1)
    {
        i++;
        
        if (i == 1)
        {
        }
        
        if (i == 40)
        {
            do_text(undefined, undefined, g_t("4_2"), ["ow"], undefined, undefined, [snd_txtSus, snd_txtral, snd_txtSus], undefined, undefined, [18, 21, 19, 20, 17, 18], [-1, -1, function()
            {
                sprite_follow(1, sSusie_Sprites, 5);
            }, function()
            {
                sprite_follow(1, sSusie_Sprites, 4);
            }, function()
            {
                sprite_follow(1, sSusie_Sprites, 3);
            }, function()
            {
                sprite_follow(1, sSusie_Sprites, 0);
            }], function()
            {
                sprite_follow(1, sSusie_Up, 0);
                
                with (oInteract)
                {
                    if (i1 == "CC2")
                    {
                        i2 = 2;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 2)
    {
        i++;
        
        if (i == 30)
        {
            sprite_follow(1, sSusie_Sprites, 3);
            do_text(undefined, undefined, g_t("4_3"), ["ow"], undefined, undefined, [snd_txtSus, snd_txtral, snd_txtral, snd_txtral, snd_txtral], undefined, undefined, [16, 15, 7, 22, 21], [-1, -1, function()
            {
                sprite_follow(2, sRalsei_Down, 0);
            }, function()
            {
                sprite_follow(2, sRalsei_Right, 0);
            }], function()
            {
                sprite_follow(1, sSusie_Sprites, 0);
                
                with (oInteract)
                {
                    if (i1 == "CC2")
                    {
                        i2 = 3;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 3)
    {
        i++;
        
        if (i == 30)
        {
            do_text(undefined, undefined, g_t("4_4"), ["ow"], undefined, undefined, [snd_txtSus, snd_txtSus, snd_txtSus, snd_txtral, snd_txtral], undefined, undefined, [23, 16, 17, 21, 22], [-1, function()
            {
                sprite_follow(1, sSusieC_Act, 0);
            }, function()
            {
                sprite_follow(1, sSusie_Sprites, 3);
            }], function()
            {
                sprite_follow(1, sSusieC_Act, 0);
                move_follow(2, 60, -1, -1, sRalsei_Laugh, 5);
                
                with (oInteract)
                {
                    if (i1 == "CC2")
                    {
                        i2 = 4;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 4)
    {
        i++;
        
        if (i == 60)
        {
            array_push(op.progress, "sockIntro2");
            sprite_follow(1, sSusie_Down, 0);
            sprite_follow(2, sRalsei_Down, 0);
            oPlayer.freeMove = false;
            oPlayer.move = true;
            des();
        }
    }
};
