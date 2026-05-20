res_i();
res_j();
i1 = "CC";
res_k();
wall = false;

if (array_contains(op.progress, "sockIntro"))
    des();

step = function()
{
    if (i2 == 0)
    {
        if (place_meeting(x, y, oPlayer) && i == 0)
        {
            i = 1;
            do_text(undefined, undefined, g_t("2_1"), ["ow", "forceDown"], undefined, undefined, [snd_txtSus], undefined, undefined, [4], undefined, function()
            {
                with (oInteract)
                {
                    if (i1 == "CC")
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
            res_j();
            j = false;
            op.camMode = "free";
            move_player(60, 800, 290, sKris_Right, 4);
            move_follow(1, 60, 740, 248, sSusie_Right, 4);
            
            if (oPlayer.pastXYS[36][1] < 240)
                j = true;
            
            if (oPlayer.pastXYS[36][1] > 300)
                j = true;
            
            if (oPlayer.pastXYS[36][0] < 480)
                j = true;
            
            if (j)
            {
                move_follow(2, 20, 540, 290, -1, 4, function()
                {
                    move_follow(2, 40, 740, 332, sRalsei_Right, 4);
                });
            }
            else
            {
                move_follow(2, 60, 740, 332, sRalsei_Right, 4);
            }
        }
        
        if (i < 60)
            op.cameX += 4;
        
        if (i == 120)
        {
            sprite_follow(2, sRalsei_Up);
            sprite_follow(1, sSusie_Sprites, 0);
        }
        
        if (i == 135)
        {
            i2 = 2;
            do_text(undefined, undefined, g_t("2_2"), ["ow", "forceDown"], undefined, undefined, [snd_txtral], undefined, undefined, [6], undefined, function()
            {
                with (oInteract)
                {
                    if (i1 == "CC")
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
        
        if (i == 11)
        {
            snd(snd_wing);
            snd(snd_sussurprise);
            sprite_follow(1, sSusie_Sprites, 1, -4);
            sprite_follow(2, sRalseiH_Damage, 0, 4);
            oCC.i1 = 6;
        }
        
        if (i == 12)
        {
            sprite_follow(1, -1, 1, 8);
            sprite_follow(2, -1, 0, -8);
            oCC.i1 = -6;
        }
        
        if (i == 13)
        {
            sprite_follow(1, -1, 1, -8);
            sprite_follow(2, -1, 0, 8);
            oCC.i1 = 6;
        }
        
        if (i == 14)
        {
            sprite_follow(1, -1, 1, 4);
            sprite_follow(2, -1, 0, -4);
            oCC.i1 = 0;
        }
        
        if (i == 34)
        {
            do_text(undefined, undefined, g_t("2_3"), ["ow", "forceDown"], undefined, undefined, [snd_txtSus], undefined, undefined, [5], undefined, function()
            {
                with (oInteract)
                {
                    if (i1 == "CC")
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
        
        if (i > 30)
        {
            if (oCC.i2 != 0)
            {
                oCC.i2--;
                
                if (oCC.i2 == 0)
                {
                    sprite_follow(1, sSusie_Right, 0);
                    sprite_follow(2, sRalsei_Right, 0);
                }
            }
        }
        
        if (i == 70)
        {
            do_text(undefined, undefined, g_t("2_4"), ["ow", "forceDown"], [sFont1, sFontSock, sFont1], undefined, [snd_txtSus, snd_txtSock, snd_txtral], undefined, undefined, [1, -1, 7], [-1, function()
            {
                oCC.i5 = true;
            }], function()
            {
                oCC.i5 = false;
                
                with (oInteract)
                {
                    if (i1 == "CC")
                    {
                        i3 = 0;
                        i2 = 5;
                        i = 0;
                        oCC.i3 = -1;
                    }
                }
            });
        }
    }
    
    if (i2 == 5)
    {
        i++;
        
        if (i > 45 && i3 == 0)
        {
            if (oCC.i2 != 24)
            {
                oCC.i2 += 2;
                
                if (oCC.i2 == 24)
                {
                    i = 0;
                    i3 = 1;
                }
            }
        }
        
        if (i > 15 && i3 == 1)
        {
            if (oCC.i4 != 0)
                oCC.i4 -= 2;
        }
        
        if (i == 90)
        {
            do_text(undefined, undefined, g_t("2_5"), ["ow", "forceDown"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [10, 8], undefined, function()
            {
                with (oInteract)
                {
                    if (i1 == "CC")
                    {
                        i2 = 6;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 6)
    {
        i++;
        
        if (i == 5 && op.musicStyle == 0)
            snd(mus_Sockswald_strings);
        
        if (oCC.i4 != 30)
        {
            oCC.i4 += 4;
            
            if (oCC.i4 >= 60)
            {
                i2 = 7;
                i = 0;
                i3 = [-8, -20];
                snd(snd_jump);
            }
        }
    }
    
    if (i2 == 7)
    {
        i++;
        
        if (i < 20)
        {
            oCC.j1[0] += i3[0];
            oCC.j1[1] += i3[1];
            i3[1] += 2;
        }
        
        if (i == 20)
        {
            ow_music(op.music_sock[op.musicStyle], true);
            snd(snd_wing);
            oCC.j2 = false;
            do_text(undefined, undefined, g_t("2_6"), ["ow", "forceDown"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, [10, 9], undefined, function()
            {
                with (oInteract)
                {
                    if (i1 == "CC")
                    {
                        i2 = 8;
                        i = 0;
                    }
                }
            });
        }
        
        if (i == 19)
        {
            create_char(0, 900, 290, sSock_Wobble, 1, function()
            {
                if (other.ty == 1)
                    other.image_yscale = 1;
                
                other.image_yscale += ((2 - other.image_yscale) / 1.5);
            });
        }
        
        if (i == 20)
        {
            sprite_follow(1, sSusie_Sprites, 2, -4);
            sprite_follow(2, sRalseiH_Damage, 0, 4);
        }
        
        if (i == 21)
        {
            sprite_follow(1, -1, 1, 8);
            sprite_follow(2, -1, 0, -8);
        }
        
        if (i == 22)
        {
            sprite_follow(1, -1, 1, -8);
            sprite_follow(2, -1, 0, 8);
        }
        
        if (i == 23)
        {
            sprite_follow(1, -1, 1, 4);
            sprite_follow(2, -1, 0, -4);
        }
    }
    
    if (i2 == 8)
    {
        i++;
        
        if (i == 30)
        {
            do_text(undefined, undefined, g_t("2_7"), ["ow", "forceDown"], [sFont1, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFontSock, sFont1, sFontSock], undefined, [snd_txtral, snd_txtSock, snd_txtSock, snd_txtMonster, snd_txtMonster, snd_txtSus, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtral, snd_txtSock], undefined, undefined, [12, 8, 13, 11, 11, 16, 10, 14, 14, 15, 13], [-1, function()
            {
                sprite_follow(1, sSusie_Right, 0);
                sprite_follow(2, sRalsei_Right, 0);
                sprite_char(0, sSock_Idle, 0, 0);
            }, -1, function()
            {
                sprite_char(0, sSock_Selftalk, 0, 0);
                audio_pause_sound(op.music_sock[op.musicStyle]);
            }, -1, -1, function()
            {
                audio_resume_sound(op.music_sock[op.musicStyle]);
                sprite_char(0, sSock_Idle, 0, 0);
            }, function()
            {
                sprite_char(0, sSock_PersonalSpace, 0, 0);
            }, -1, function()
            {
                sprite_char(0, sSock_Idle, 0, 0);
            }, function()
            {
                sprite_char(0, sSock_Thumbsup, 0, 1, 0, 0, function()
                {
                    if (other.image_index >= 7)
                    {
                        other.image_speed = 0;
                        other.image_index = 7;
                    }
                });
            }, -1], function()
            {
                move_char(0, 30, 900, 140, sSock_Up, 2, function()
                {
                    des(other);
                });
                sprite_player(sKris_Up, 0);
                sprite_follow(1, sSusie_Up);
                sprite_follow(2, sRalsei_Up);
                audio_sound_gain(op.music_sock[op.musicStyle], 0, 1000);
                
                with (oInteract)
                {
                    if (i1 == "CC")
                    {
                        i2 = 9;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 9)
    {
        i++;
        
        if (i == 75)
        {
            do_text(undefined, undefined, g_t("2_8"), ["ow", "forceDown"], [sFont1], undefined, [snd_txtSus], undefined, undefined, [16], [-1], function()
            {
                fix_cam(30);
                
                with (oInteract)
                {
                    if (i1 == "CC")
                    {
                        i2 = 10;
                        i = 0;
                    }
                }
            });
        }
    }
    
    if (i2 == 10)
    {
        i++;
        
        if (i == 30)
        {
            audio_sound_gain(mus_Sockswald_loop, 1, 0);
            audio_stop_sound(mus_Sockswald_loop);
            oPlayer.freeMove = false;
            oPlayer.move = true;
            op.camMode = "player";
            array_push(op.progress, "sockIntro");
            des();
            ow_music(mus_Steam_Jams, true);
        }
    }
};
