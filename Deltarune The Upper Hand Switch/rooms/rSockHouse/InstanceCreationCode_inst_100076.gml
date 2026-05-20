op.camMode = "player";
op.parameter = [0, 0, 0, 0];
op.musicOW = -1;

if (!array_contains(op.progress, "sockIntro"))
    array_push(op.progress, "sockIntro");

if (!array_contains(op.progress, "sockIntro2"))
    array_push(op.progress, "sockIntro2");

res_j();
j1 = 0;
j2 = 0;

funcDraw = function()
{
    if (j1 == 0 && j2 > 0)
        j2 -= 0.016666666666666666;
    
    if (j1 == 1 && j2 < 1)
        j2 += 0.016666666666666666;
    
    ext(sPixel, 0, -100, -100, 999, 999, undefined, 0, j2);
};

audio_sound_gain(mus_Steam_Jams, 1, 0);
audio_stop_sound(mus_Steam_Jams);
audio_stop_sound(mus_Sockswald_loop);
audio_sound_pitch(mus_Sockswald_strings, 1);
audio_sound_pitch(mus_Sockswald_loop, 1);
audio_stop_sound(mus_Memories_Of_HQ);

if (array_contains(op.progress, "puppet1done"))
{
    audio_stop_all();
    oPlayer.move = false;
    snd(snd_wing);
    oPlayer.draw = false;
    
    with (instance_create_depth(0, 0, -9999, oRun))
    {
        res_i();
        i1 = 1;
        i2 = 0;
        i3 = [0, 0];
        create_char(0, 320, 330, sKris_Up, 0);
        create_char(1, 260, 310, sSusie_Up, 0);
        create_char(2, 380, 310, sRalsei_Up, 0);
        create_char("s", 320, 238, sSock_Left, 0);
        
        draw = function()
        {
            if (i1 == 1)
                i += time;
            
            if (i1 == 999)
                i -= time;
            
            if (i1 == 1000 && time == 30)
                room_goto(rPuppetshow2);
            
            if (i1 == 1 || i1 == 999 || i1 == 1000)
            {
                i = clamp(i, 0, 382);
                
                if (i1 == 999 && i == 0)
                {
                    i1 = 1000;
                    i2 = 5;
                    audio_stop_all();
                    snd(snd_wing);
                    time = 0;
                }
                
                if (i2 > 0)
                {
                    i2--;
                    i3 = [irandom_range(-6, 6), irandom_range(-6, 6)];
                }
                else
                {
                    i3 = [0, 0];
                }
                
                ext(sPlayBC, 1, (380 - i) + i3[0], 0, -2);
                ext(sPlayBC, 1, 260 + i + i3[0], 0, 2);
            }
            
            if (time == 60 && i1 == 1)
            {
                do_text(undefined, undefined, g_t("10_1"), ["ow", "forceDown"], [sFontSock, sFont1, sFont1, sFont1, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFont1, sFont1, sFontSock], undefined, [snd_txtSock, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSock, snd_txtral, snd_txtral, snd_txtral, snd_txtSus, snd_txtSus, snd_txtral, snd_txtral, snd_txtSus, snd_txtral, snd_txtral, snd_txtral, snd_txtral, snd_txtral, snd_txtral, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtral, snd_txtral, snd_txtral, snd_txtral, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtSock], undefined, undefined, [13, 27, 5, 28, 26, 7, 32, 33, 34, 19, 35, 36, 1, 35, 15, 15, 35, 37, 37, 29, 29, 29, 29, 29, 29, 29, 29, 30, 38, 39, 40, 22, 6, 33, 26, 41, 38, 10, 9, 13], [function()
                {
                    sprite_char("s", sSock_Left, undefined, 1);
                }, function()
                {
                    sprite_char("s", sSock_Left, 0, 0);
                    sprite_char(1, sSusie_Sprites, 4);
                    sprite_char(2, sRalsei_Left);
                    audio_play_sound(mus_Socks_World, 0, true);
                    audio_sound_gain(mus_Socks_World, 1, 0);
                }, function()
                {
                    sprite_char(1, sSusie_Sprites, 0);
                }, function()
                {
                    snd(snd_swipe);
                    sprite_char(0, sKris_Left);
                    sprite_char(1, sSusieB_Fight, 0, 1, undefined, undefined, function()
                    {
                        other.image_xscale = -2;
                        
                        if (round(other.image_index) == 5)
                            other.image_speed = 0;
                    });
                }, function()
                {
                    sprite_char("s", sSock_Left, 0, 1);
                }, function()
                {
                    sprite_char(0, sKris_Right);
                    sprite_char(1, sSusie_Right, 0, undefined, undefined, undefined, function()
                    {
                        other.image_xscale = 2;
                    });
                    sprite_char(2, sRalsei_Up);
                    sprite_char("s", sSock_Right, 1, 0);
                }, function()
                {
                    sprite_char(2, sRalsei_Down);
                }, function()
                {
                    sprite_char(2, sRalsei_Up);
                }, function()
                {
                    sprite_char(0, sKris_Up);
                    sprite_char(2, sRalsei_Left);
                    sprite_char("s", sSock_Left);
                }, function()
                {
                    sprite_char(1, sSusie_Sprites, 6, 0);
                }, function()
                {
                    op.twait = 75;
                    sprite_char("s", sSock_Right, 1, 0);
                    sprite_char(0, sKris_Right);
                    move_char(2, 30, 434, 290, sRalsei_Right, 0.2, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                    
                    op.twaitFunc = function()
                    {
                        sprite_char(1, sSusie_Right);
                    };
                }, function()
                {
                    sprite_char(2, sRalsei_Left);
                }, function()
                {
                    sprite_char("s", sSock_Left);
                }, function()
                {
                    sprite_char("s", sSock_Right, 1, 0);
                }, function()
                {
                    sprite_char(2, sRalsei_Right);
                }, function()
                {
                    move_char(2, 15, 440, 290, sRalsei_Right, 0.2, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                }, function()
                {
                    sprite_char(2, sRalsei_Up);
                    sprite_char("s", sSock_Sprites, 0, 0);
                }, function()
                {
                    sprite_char(2, sRalsei_Left);
                }, function()
                {
                    op.twait = 15;
                    sprite_char("s", sSock_Sprites, 1, 0);
                    move_char(2, 15, 380, 310, sRalsei_Left, 0.4, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                }, function()
                {
                    sprite_char(0, sKris_Up);
                    sprite_char(1, sSusie_Up);
                    sprite_char(2, sRalsei_Up);
                }, function()
                {
                    op.twait = 120;
                    oCC.j1 = 1;
                    audio_sound_gain(mus_Socks_World, 0, 1500);
                    
                    op.twaitFunc = function()
                    {
                        audio_play_sound(mus_trouble_at_hand, 0, true);
                    };
                }, -1, -1, -1, -1, -1, -1, function()
                {
                    op.twait = 90;
                    audio_sound_gain(mus_trouble_at_hand, 0, 3000);
                }, function()
                {
                    audio_stop_sound(mus_Socks_World);
                    audio_stop_sound(mus_trouble_at_hand);
                    
                    if (op.musicStyle == 0)
                        audio_play_sound(mus_Sockswald_strings, 0, false);
                    
                    op.twait = 1;
                    
                    op.twaitFunc = function()
                    {
                        op.twait = 25;
                        move_char(1, 8, 260, 240, sSusie_Up, 0.4, function()
                        {
                            other.image_speed = 0;
                            other.sprite_index = sSusie_Sprites;
                            other.image_index = 7;
                            other.shake = 3;
                            snd(snd_wing);
                        });
                    };
                    
                    op.twaitFunc2 = function()
                    {
                        audio_play_sound(op.music_sock[op.musicStyle], 0, true);
                        audio_sound_gain(op.music_sock[op.musicStyle], 1, 0);
                        sprite_char(1, sSusie_Sprites, 8, 0);
                        sprite_char("s", sSock_Down);
                        
                        with (oChar)
                        {
                            if (numb == "s")
                                shake = 5;
                        }
                        
                        screenShake(10, 3);
                        snd(snd_damage);
                        oCC.j1 = 0;
                        oCC.j2 = 0;
                    };
                }, function()
                {
                    sprite_char("s", sSock_Sprites, 2, 0);
                    
                    with (oChar)
                    {
                        if (numb == "s")
                            shake = 3;
                    }
                }, function()
                {
                    sprite_char("s", sSock_Sprites, 3, 0);
                    
                    with (oChar)
                    {
                        if (numb == "s")
                            shake = 3;
                    }
                    
                    op.twait = 30;
                    move_char(2, 30, 400, 240, sRalsei_Up, 0.2, function()
                    {
                        other.sprite_index = sRalsei_Left;
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                }, -1, -1, -1, function()
                {
                    sprite_char("s", sSock_Sprites, 2, 0);
                }, function()
                {
                    op.twait = 20;
                    sprite_char("s", sSock_Down);
                    
                    with (oChar)
                    {
                        if (numb == "s")
                            shake = 3;
                    }
                    
                    snd(snd_wing);
                    move_char(0, 20, 320, 270, sKris_Up, 0.2, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                }, -1, function()
                {
                    sprite_char("s", sSock_Left);
                }, function()
                {
                    op.twait = 20;
                    snd(snd_jump);
                    
                    with (oChar)
                    {
                        if (numb == "s")
                            y -= 40;
                    }
                    
                    move_char("s", 20, 320, 170, sSock_Spiral, 1, function()
                    {
                        snd(snd_wing);
                        other.shake = 5;
                        other.sprite_index = sSock_Wobble;
                        other.image_index = 0;
                        other.image_speed = 1;
                        other.y += 32;
                        other.forceFont = true;
                    }, ["arc2"]);
                    move_char(0, 15, 320, 300, sKris_Up, 0.3, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                    move_char(1, 15, 210, 240, sSusie_Right, 0.3, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                    move_char(2, 15, 430, 240, sRalsei_Left, 0.3, function()
                    {
                        other.image_index = 0;
                        other.image_speed = 0;
                    });
                }, function()
                {
                    sprite_char("s", sSock_Thumbsup, 0, 1, undefined, undefined, function()
                    {
                        if (round(other.image_index) == 8)
                            other.image_speed = 0;
                    });
                    sprite_char(0, sKris_Sprites, 0, 0);
                    sprite_char(1, sSusie_Sprites, 6, 0);
                    sprite_char(2, sRalsei_Sprites, 0, 0);
                    snd(snd_bell);
                    
                    with (oChar)
                    {
                        if (numb != "s")
                            shake = 3;
                    }
                }], function()
                {
                    oRun.i1 = 999;
                    oRun.time = 0;
                });
            }
        };
    }
}
else if (op.pastRoom == -1)
{
    audio_play_sound(mus_Socks_World, 0, true);
    audio_play_sound(mus_Socks_world_8bit, 0, true);
    audio_sound_gain(mus_Socks_World, 1, 0);
    audio_sound_gain(mus_Socks_world_8bit, 0, 0);
}
else
{
    audio_sound_gain(mus_Socks_World, 1, 250);
    audio_sound_gain(mus_Socks_world_8bit, 0, 250);
}

op.pastRoom = -1;
