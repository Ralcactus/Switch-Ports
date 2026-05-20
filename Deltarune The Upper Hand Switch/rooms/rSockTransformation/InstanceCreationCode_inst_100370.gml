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
res_j();
i = 0;
i1 = 0;
i2 = 0;
i3 = -1;

funcStep = function()
{
    i++;
    
    if (i == 60)
    {
        i1 = 1;
        snd(snd_lightning);
        audio_sound_gain(snd_lightning, 1, 0);
        snd(snd_explosion);
        sprite_char("k", sKris_LandCool, 2, 0, undefined, undefined, function()
        {
            other.image_xscale = -2;
        });
        sprite_char("s", sSusie_Sprites, 2, 0);
        sprite_char("r", sRalseiH_Damage, 0, 0);
        oDrawBackground.draw = true;
        spawnEEF(324, 58, sEEF_star2, 0, "starLeave,draw,scale2,forceBlack");
    }
    
    if (i == 210)
        audio_sound_gain(snd_lightning, 0, 3000);
    
    if (i > 120 && i1 > 0)
        i1 -= 0.011111111111111112;
    
    if (i == 270)
    {
        sprite_char("k", sKris_Up, 0, 0, undefined, undefined, function()
        {
            other.image_xscale = 2;
        });
        sprite_char("s", sSusie_Up, 0, 0);
        sprite_char("r", sRalsei_Up, 0, 0);
    }
    
    if (i == 370)
    {
        do_text(undefined, undefined, g_t("16_1"), ["ow", "forceUp"], [sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFont1, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock], undefined, [snd_txtSus, snd_txtSus, snd_txtSus, snd_txtral, snd_txtral, snd_txtMonster, snd_txtMonster, snd_txtSock, snd_txtSock, snd_txtMonster, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtMonster, snd_txtMonster, snd_txtSus, snd_txtMonster, snd_txtSus, snd_txtMonster, snd_txtSus, snd_txtMonster, snd_txtSus, snd_txtMonster, snd_txtSus, snd_txtSus, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtSock], undefined, undefined, [49, 47, 27, 12, 57, -1, -1, -1, -1, -1, -1, 48, 49, -1, 11, 5, 53, 47, 53, 48, 53, 5, 53, 58, 59, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [function()
        {
            audio_stop_all();
        }, function()
        {
            op.twait = 60;
            create_char("sock", 490, 0, sSock_Sprites, 0);
            move_char("sock", 10, 490, 380, sSock_Sprites, 0, function()
            {
                snd(snd_impact);
                char("sock").shake = 3;
                screenShake(3, 3);
                oCC.i2 = 1;
                move_char("k", 15, 120, 400, sKris_Jump, 0, function()
                {
                    other.shake = 3;
                    other.image_speed = 0;
                    other.sprite_index = sKris_LandCool;
                    other.image_index = 2;
                    screenShake(3, 3);
                    snd(snd_wing);
                }, ["arc1"]);
                char("k").image_xscale = 2;
                move_char("r", 15, 120, 330, sRalseiH_Damage, 0, function()
                {
                    other.shake = 3;
                    other.image_speed = 0;
                    other.sprite_index = sRalsei_Sprites;
                    other.image_index = 1;
                }, ["arc1"]);
                move_char("s", 15, 210, 370, sSusie_Fall, 1, function()
                {
                    other.shake = 3;
                    other.image_speed = 0;
                    other.sprite_index = sSusie_Sprites;
                    other.image_index = 9;
                }, ["arc1"]);
                ow_music(mus_trouble_at_hand, true);
                audio_sound_gain(mus_trouble_at_hand, 1, 0);
                audio_sound_pitch(snd_txtSock, 0.85);
            });
            char("sock").image_index = 12;
        }, function()
        {
            op.twait = 30;
            sprite_char("s", sSusie_Sprites, 4, 0);
            char("s").shake = 3;
            snd(snd_swing);
        }, function()
        {
            op.twait = 30;
            sprite_char("r", sRalsei_Sprites, 2, 0);
            sprite_char("k", sKris_Right, 0, 0);
            char("r").shake = 3;
            char("k").shake = 3;
            snd(snd_wing);
        }, -1, function()
        {
            char("sock").shake = 3;
        }, function()
        {
            char("sock").shake = 3;
        }, function()
        {
            op.twait = 30;
            sprite_char("sock", sHandTransformation, 0, 0);
            char("sock").shake = 3;
        }, -1, function()
        {
            sprite_char("sock", sSock_Sprites, 12, 0);
            char("sock").shake = 3;
        }, function()
        {
            sprite_char("sock", sHandTransformation, 0, 0);
            char("sock").shake = 3;
        }, function()
        {
            op.twait = 30;
            move_char("s", 30, 240, 370, sSusie_RightSad, 1, function()
            {
                other.image_index = 0;
                other.image_speed = 0;
            });
        }, function()
        {
            sprite_char("s", sSusie_Sprites, 3, 0);
        }, function()
        {
            op.twait = 45;
            sprite_char("s", sSusie_Sprites, 4, 0);
            char("sock").shake = 9;
            
            op.twaitFunc = function()
            {
                sprite_char("sock", sSock_Sprites, 13, 0);
                char("sock").shake = 3;
            };
        }, function()
        {
            op.twait = 45;
        }, function()
        {
        }, function()
        {
            op.twait = 20;
            
            op.twaitFunc = function()
            {
                screenShake(3, 6);
                snd(snd_swing);
                sprite_char("k", sKrisE_Defend, 5, 0);
                sprite_char("r", sRalseiH_Damage, 0, 0);
                sprite_char("s", sSusie_Sprites, 2, 0);
            };
            
            move_char("sock", 30, char("sock").x, char("sock").y, sHandTransformation, 1, function()
            {
                other.sprite_index = sHandMidtransform;
                other.image_index = 0;
                other.image_speed = 1;
            });
        }, -1, function()
        {
            sprite_char("s", sSusie_Sprites, 4, 0);
        }, -1, -1, -1, -1, function()
        {
            op.twait = 30;
            snd(snd_weaponpullfast);
            sprite_char("s", sSusie_Sprites, 10, 0);
            char("s").shake = 3;
        }, -1, -1, -1, -1, function()
        {
            op.twait = 60;
            char("sock").shakePower = 1;
            char("sock").shake = 9999;
        }, function()
        {
            char("sock").shakePower = 2;
            char("sock").shake = 9999;
        }], function()
        {
            oCC.i3 = 0;
            ow_music_stop();
            audio_stop_all();
            snd(snd_swipe);
            char("sock").shake = 0;
            char("sock").image_speed = 0;
            sprite_char("s", sSusieB_Fight, 0, 0);
            move_char("s", 12, char("s").x, char("s").y, sSusieB_Fight, 1, function()
            {
                other.image_speed = 0;
            });
        });
    }
};

surf = -1;
mw = 0;
ultimateAlpha = 0;
armSprites = [sHand_Idle2, sHand_IdleM2];
armExtraScale = 0;
armScaleTime = 0;
armScaleType = -1;
armPower = 0.01;

funcDraw = function()
{
    if (i3 != -1)
    {
        if (i3 == 0)
        {
            oDrawBackground.draw = true;
            i2 = 1;
        }
        
        i3++;
        
        if (i3 == 60 || i3 == 75)
        {
            screenShake(3, 6);
            snd(snd_damage);
            i2++;
        }
        
        if (i3 >= 90 && i3 < 130)
        {
            i5++;
            i4 += i5;
            char("sock").y += i5;
            char("sock").x += i5;
        }
        
        if (i3 == 90)
        {
            i2 = 4;
            screenShake(3, 9);
            snd(snd_explosion);
            sprite_char("k", sKris_Jump, 0, 0.16666666666666666);
            sprite_char("r", sRalseiH_Damage, 0, 0);
            sprite_char("s", sSusie_Fall, 0, 1);
            move_char("k", 50, char("k").x, char("k").y + 350, sKris_Jump, 0.16666666666666666, -1, ["arc4"]);
            move_char("r", 60, char("r").x, char("r").y + 250, sRalseiH_Damage, 0, -1, ["arc4"]);
            move_char("s", 55, char("s").x, char("s").y + 300, sSusie_Fall, 1, -1, ["arc4"]);
            oChar.shake = 3;
            res_j();
            j1 = 150;
            j2 = -1;
        }
        
        if (i3 == 180)
        {
            move_char("k", 1, 120, 620, sKrisF_Damage, 1, function()
            {
            });
            move_char("s", 1, 180, 688, sSusieH_Damage, 1, function()
            {
            });
            move_char("r", 1, 110, 736, sRalseiH_Damage, 0, function()
            {
            });
        }
        
        if (i3 > 180)
        {
            if (char("k").y > (120 + j1))
            {
                char("k").y = clamp(char("k").y - 6, 120 + j1, 999);
                
                if (char("k").y == (120 + j1))
                {
                    char("k").shake = 3;
                    
                    if (j2 == -1)
                        snd(snd_impact);
                    else
                        room_goto(rBattle);
                }
            }
            
            if (char("s").y > (188 + j1))
            {
                char("s").y = clamp(char("s").y - 6, 188 + j1, 999);
                
                if (char("s").y == (188 + j1))
                    char("s").shake = 3;
            }
            
            if (char("r").y > (236 + j1))
            {
                char("r").y = clamp(char("r").y - 6, 236 + j1, 999);
                
                if (char("r").y == (236 + j1))
                    char("r").shake = 3;
            }
        }
        
        if (i3 == 270)
        {
            do_text(undefined, undefined, g_t("16_2"), ["ow", "forceUp"], [sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1], undefined, [snd_txtral, snd_txtSus, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtMonster], undefined, undefined, [12, 60, -1, -1, -1, -1, -1, -1], [-1, -1, -1, -1, function()
            {
                op.twait = 90;
                oCC.j2 = "fadein";
                snd(snd_oddtalk1);
            }, -1, -1, function()
            {
                op.twait = 60;
                oCC.j2 = "colorin";
                snd(snd_undynedis);
            }], function()
            {
                oCC.j2 = "startend";
            });
        }
        
        if (j2 == "fadein")
        {
            mw = -1;
            
            if (ultimateAlpha < 1)
                ultimateAlpha += (1/30);
        }
        
        if (j2 == "colorin" || j2 == "startend")
        {
            if (ultimateAlpha < 1)
                ultimateAlpha += (1/30);
            
            if (mw < 0)
                mw += (1/30);
        }
        
        if (j2 == "startend")
        {
            j3++;
            
            if (j3 == 1)
            {
                oCC.armScaleType = 1;
                oCC.armPower = 0.01;
            }
            
            if (j3 == 10)
            {
                oCC.armScaleType = 2;
                oCC.armSprites = [sHand_LaughLoop, sHand_LaughLoopM];
                snd(snd_handLaugh);
            }
            
            if (j3 == 80)
            {
                oCC.armScaleType = 1;
                oCC.armPower = -0.01;
            }
            
            if (j3 == 90)
            {
                j1 = 0;
                oCC.armScaleType = 2;
                armSprites = [sHand_Idle2, sHand_IdleM2];
            }
        }
    }
    
    if (i > 60)
    {
        if (i2 != 4)
        {
            ext(sBrokenFloor, i2, 0, (i4 + 480) - 176, 2, 2);
        }
        else
        {
            ext(sBrokenFloor, 4, -i4 / 2, (i4 + 480) - 176, 2, 2);
            ext(sBrokenFloor, 5, i4 / 2, (i4 + 480) - 176, 2, 2);
        }
    }
    
    var _i = 0;
    _handd = [];
    handd(sHand_IdleMini, sHand_IdleMiniM, op.ty / 6, 440, 330, 2, 1.9 + (dcos(op.ty * 3) * 0.1), dsin(op.ty * 3) * 2);
    handd(armSprites[0], armSprites[1], op.ty / 6, 500, 330, 2, 1.95 + (dsin(op.ty * 3) * 0.05), dcos(op.ty * 3) * 2);
    
    if (!surface_exists(surf))
        surf = surface_create(640, 480);
    
    if (armScaleType == -1)
        armScaleTime = 0;
    
    if (armScaleType == 1)
    {
        armScaleTime += armPower;
        armExtraScale -= armScaleTime;
    }
    
    if (armScaleType == 2)
    {
        if (armScaleTime != 0)
            armExtraScale *= -1;
        
        armScaleTime = 0;
        armExtraScale += ((0 - armExtraScale) / 5);
    }
    
    _i = 0;
    
    repeat (array_length(_handd))
    {
        _handd[_i][4] += 154;
        surface_set_target(surf);
        draw_clear_alpha(c_white, 0);
        ext(_handd[_i][1], _handd[_i][2], _handd[_i][3], _handd[_i][4], _handd[_i][5] - (armExtraScale * (_i == 1)), _handd[_i][6] + (armExtraScale * (_i == 1)), _handd[_i][7]);
        gpu_set_colorwriteenable(1, 1, 1, 0);
        ext(sSpaceM, 0, 0, 0, 2, 2, undefined, undefined, undefined, mw);
        gpu_set_colorwriteenable(1, 1, 1, 1);
        ext(_handd[_i][0], _handd[_i][2], _handd[_i][3], _handd[_i][4], _handd[_i][5] - (armExtraScale * (_i == 1)), _handd[_i][6] + (armExtraScale * (_i == 1)), _handd[_i][7], undefined, undefined, mw);
        _i++;
        surface_reset_target();
        draw_surface_ext(surf, 0, 0, 1, 1, 0, _handd[0][8], _handd[0][9] * ultimateAlpha);
    }
};

funcDrawGUI = function()
{
    explosionColor = 16777215;
    
    if (op.st_simplifyVFX == 1)
        explosionColor = 0;
    
    ext(sPixel, 0, 0, 0, 640, 999, 0, explosionColor, i1);
    
    if (op.st_simplifyVFX == -1)
    {
        ext(sDeltarune, 0, 252 + round(dsin(0 + (op.ty * 5)) * 3), 42 + round(dsin(0 + (op.ty * 5)) * 4), undefined, undefined, undefined, 0, i1);
        ext(sDeltarune, 1, 396 - round(dsin(120 + (op.ty * 5)) * 3), 40 + round(dsin(120 + (op.ty * 5)) * 4), undefined, undefined, undefined, 0, i1);
        ext(sDeltarune, 2, 322, 66 + round(dsin(240 + (op.ty * 5)) * 4), undefined, undefined, undefined, 0, i1);
        ext(sBBGtwinkle, op.ty / 10, 322, round(50 + (dsin(240 + (op.ty * 5)) * 4)), undefined, undefined, undefined, 0, i1);
        ext(sDeltarune, 3, 302, round(112 + (dsin(240 + (op.ty * 5)) * 4)), undefined, undefined, undefined, 0, i1);
        ext(sDeltarune, 4, 346, round(120 + (dsin(120 + (op.ty * 5)) * 4)), undefined, undefined, undefined, 0, i1);
        ext(sDeltarune, 5, 324, round(132 + (dsin(0 + (op.ty * 5)) * 4)), undefined, undefined, undefined, 0, i1);
        ext(char("k").sprite_index, char("k").image_index, char("k").x + (char("k").shakeX / 2), char("k").y + char("k").ey, -2, 2, 0, 0, i1, 0);
        ext(char("s").sprite_index, char("s").image_index, char("s").x + (char("s").shakeX / 2), char("s").y + char("s").ey, 2, 2, 0, 0, i1, 0);
        ext(char("r").sprite_index, char("r").image_index, char("r").x + (char("r").shakeX / 2), char("r").y + char("r").ey, 2, 2, 0, 0, i1, 0);
    }
};
