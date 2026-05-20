op.parameter = [0, 9999, 0, 0];
op.camMode = "Free";
op.camY = -300;
oPlayer.move = false;
oPlayer.x = 60;
oPlayer.y = -140;
oPlayer.draw = false;
create_char("sock", 174, 300, sSock_Right, 1);
create_char("susie", 269, 300, sSusie_SmugWalk, 1);
create_char("ralsei", 371, 300, sRalsei_Right, 0.16666666666666666);
create_char("kris", 447, 300, sKris_Right, 0.16666666666666666);
audio_stop_sound(mus_Memories_Of_HQ);
res_i();
i1 = 0;
res_j();
j1 = 1;

funcStep = function()
{
    i++;
    
    if (op.camY < 0)
        op.camY += 2;
    
    if (i1 == 0)
    {
        with (oChar)
        {
            if (numb == "sock" || numb == "susie" || numb == "ralsei" || numb == "kris")
                x += 3;
            
            if (numb == "ralsei")
                op.camX = ((x - 320) + 25) - 76;
        }
        
        if (op.camX >= 1280)
        {
            with (oChar)
            {
                if (numb == "sock" || numb == "susie" || numb == "ralsei" || numb == "kris")
                {
                    x -= 1280;
                    op.camX = 0;
                }
            }
        }
    }
    
    if (i1 == 0 && i == 250)
    {
        i1 = 1;
        i2 = op.camX + 320;
        sprite_char("sock", sSock_Right, 1, 0);
        sprite_char("kris", sKris_Right, 0, 0);
        sprite_char("susie", sSusie_Right, 0, 0);
        sprite_char("ralsei", sRalsei_Right, 0, 0);
        move_char("ralsei", 30, i2 + 200, 300, sRalsei_Right, 0.16666666666666666, function()
        {
            sprite_char("ralsei", sRalsei_Left, 0, 0);
            oCC.i1 = 2;
            oCC.i = 0;
        });
    }
    
    if (i1 == 2 && i == 30)
    {
        i1 = 3;
        i = 0;
        do_text(undefined, undefined, g_t("11_1"), ["ow", "forceDown"], [sFont1, sFontSock], undefined, [snd_txtral, snd_txtSock], undefined, undefined, [33, 13], [-1, function()
        {
            sprite_char("kris", sKris_Left, 0, 0);
            sprite_char("susie", sSusie_Left, 0, 0);
            sprite_char("sock", sSock_Right, 0, 1);
        }, -1], function()
        {
            sprite_char("susie", sSusie_Right, 0, 0);
            move_char("sock", 30, i2 + 30, 300, sSock_Right, 1);
            move_char("kris", 30, (i2 + 250) - 76, 300, sKris_Right, 0.16666666666666666, function()
            {
                other.image_speed = 0;
                other.image_index = 0;
            });
            move_char("ralsei", 30, i2 + 250, 300, sRalsei_Right, 0.16666666666666666);
            oCC.i1 = 4;
            oCC.i = 0;
        });
    }
    
    if (i1 == 4)
    {
        if (i <= 30)
            op.camX += 3;
        
        if (i == 30)
        {
            snd(snd_rumble);
            screenShake(60, 3);
            sprite_char("sock", sSock_Sprites, 4, 0);
            char("sock").shake = 45;
            sprite_char("susie", sSusie_Sprites, 1, 0);
            char("susie").shake = 45;
            sprite_char("ralsei", sRalseiH_Damage, 0, 0);
            char("ralsei").shake = 45;
        }
        
        if (i == 90)
        {
            create_char("rock", i2 + 30, -100, sRocksFalling, 0);
            
            with (oChar)
            {
                if (numb == "rock")
                {
                    res_i();
                    
                    func = function()
                    {
                        image_angle += 5;
                        y += i;
                        i += 1;
                        
                        if (y >= 270)
                        {
                            func = -1;
                            y = 270;
                            image_index = 2;
                            image_angle = 0;
                            screenShake(5, 5);
                            snd(snd_impact);
                        }
                    };
                }
            }
            
            move_char("susie", 5, i2 - 10, 300, sSusie_RightSad, 2, function()
            {
                sprite_char("sock", sNothing, 0, 0);
                other.sprite_index = sSock_Pickup;
                other.image_index = 0;
                other.image_speed = 0;
                snd(snd_grab);
                other.shake = 3;
            });
        }
        
        if (i == 110)
        {
            snd(snd_swing);
            move_char("susie", 3, i2 - 40, 300, sSock_Pickup, 1);
        }
        
        if (i == 118)
        {
            sprite_char("susie", sSock_Pickup, 3, 0);
            char("ralsei").image_xscale = -2;
            char("ralsei").x -= 20;
            sprite_char("kris", sKris_Left, 0, 0);
        }
        
        if (i == 180)
        {
            do_text(undefined, undefined, g_t("11_2"), ["ow", "forceDown"], [sFontSock, sFontSock, sFont1, sFont1, sFont1], undefined, [snd_txtSock, snd_txtSock, snd_txtral, snd_txtSus, snd_txtSus], undefined, undefined, [26, 10, 40, 2, 1], [function()
            {
                sprite_char("susie", sSock_PickupTalk, 0, 1);
            }, function()
            {
                op.twait = 15;
                char("sock").x = i2 - 80;
                char("sock").y = 218;
                char("sock").forceFont = true;
                snd(snd_jump);
                move_char("sock", 15, i2 + 36, 260, sSock_Sprites, 0, function()
                {
                    other.sprite_index = sSock_Left;
                    other.image_index = 1;
                    other.shake = 3;
                    snd(snd_wing);
                }, ["arc1"]);
                sprite_char("sock", sSock_Sprites, 5, 0);
                sprite_char("susie", sSusie_Sprites, 4, 0, -20);
                char("ralsei").image_xscale = 2;
                sprite_char("ralsei", sRalsei_Left, 0, 0);
            }, function()
            {
                sprite_char("sock", sSock_Right, 1, 0);
            }, function()
            {
                sprite_char("sock", sSock_Left, 1, 0);
                sprite_char("susie", sSusie_Itch, 0, 0.16666666666666666);
            }, function()
            {
                sprite_char("susie", sSusie_Sprites, 4, 0);
            }], function()
            {
                oCC.i1 = 5;
                oCC.i = 0;
            });
        }
    }
    
    if (i1 == 5)
    {
        op.camX += 1;
        
        if (i == 1)
        {
            move_char("kris", 60, char("kris").x + 100, 300, sKris_Right, 0.16666666666666666);
            move_char("ralsei", 60, char("ralsei").x + 100, 300, sRalsei_Right, 0.16666666666666666);
        }
        
        if (i == 15)
        {
            move_char("sock", 15, i2 + 150, 300, sSock_Right, 0, function()
            {
                other.shake = 3;
                other.image_index = 1;
            }, ["arc1"]);
        }
        
        if (i == 45)
            move_char("sock", 60, char("sock").x + 100, 300, sSock_Right, 1);
        
        if (i == 40)
        {
            move_char("susie", 20, i2 + 36, 260, sSusie_Right, 0, function()
            {
                other.image_index = 0;
            }, ["arc1"]);
            sprite_char("susie", sSusie_Right, 1, 0);
        }
    }
};

res_j();
j1 = 1;

funcDrawGUI = function()
{
    if (i1 != 5)
    {
        if (j1 > 0)
            j1 -= 0.01;
    }
    else if (j1 < 1)
    {
        j1 += 0.02;
        
        if (j1 >= 1)
            room_goto(rCliffJump);
    }
    
    ext(sPixel, 0, -500, -500, 9999, 9999, undefined, 0, j1);
};
