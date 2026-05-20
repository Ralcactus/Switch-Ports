op.parameter = [0, room_width - 640, 0, room_height - 480];
op.camMode = "player";
audio_stop_sound(mus_Memories_Of_HQ);
oPlayer.dodgeAlpha = 0;
oPlayer.dodge_applyShaders = true;
instance_destroy(oFollow);
move_player(1, 140, 1260, sKris_Down, 0);
create_char("r", 110, 1270, sRalsei_Right, 0);
create_char("s", -90, 1260, sSusie_Right, 0);
create_char("so", 20, 1260, sSock_Right, 0);
create_char("sock", 140, 480, sSock_Jockey, 0);
res_i();
res_j();
j1 = 1;
j2 = 0;
j3 = 0;

funcStep = function()
{
    if (oPlayer.dodgeAlpha > 0)
    {
        if (i1 == 0)
        {
            if (!(op.ty % 20))
                spawn_da(660, 540, sRocksFalling, 0, undefined, [2, 0.3]);
            
            if (!((op.ty + 10) % 20))
                spawn_da(940, 540, sRocksFalling, 0, undefined, [1, 0.3]);
        }
        
        if (i1 == 1)
        {
            if (!(op.ty % 40))
                spawn_da(440, 440, sRocksFalling, 0, undefined, [2, 0.3]);
        }
        
        if (i1 == 1 || i1 == 2 || i1 == 3)
        {
            if (!(op.ty % 20))
                spawn_da(260, -40, sRocksFalling, 0, undefined, [1, 0.3]);
        }
        
        if (i1 == 3)
        {
            if (!(op.ty % 20))
            {
                spawn_da(440, -40, sRocksFalling, 0, undefined, [2, 0.3]);
                spawn_da(560, -40, sRocksFalling, 0, undefined, [2, 0.4]);
                spawn_da(680, -40, sRocksFalling, 0, undefined, [2, 0.5]);
            }
        }
    }
    
    j++;
    
    if (j2 == 3)
    {
        if (j == 40 || j == 80 || j == 140)
            sprite_char("r", sRalsei_Right, 0, 0);
        
        if (j == 60 || j == 100)
            sprite_char("r", sRalsei_Left, 0, 0);
        
        if (j == 140)
        {
            op.twait = 1;
            j2 = 4;
        }
    }
    
    if (j2 == 5)
    {
        if (j >= 60)
        {
            if (j3 < 1)
                j3 += (1/120);
        }
    }
    
    if (j2 == 6)
    {
        if (j == 59)
            j3 = 0;
    }
    
    if (j2 == 7)
    {
        if (j >= 1 && j <= 5)
            char("so").image_yscale -= 0.2;
        
        if (j == 10)
        {
            snd(snd_jump);
            sprite_char("s", sSusie_Fall, 0, 1);
            move_char("s", 20, char("s").x, char("s").y - 50, sSusie_Fall, 1, undefined, ["arc2"]);
        }
        
        if (j > 10 && j < 15)
            char("so").image_yscale += 0.3;
        
        if (j > 15 && j < 30)
        {
            if (char("so").image_yscale > 2)
                char("so").image_yscale -= 0.1;
        }
        
        if (j == 30)
        {
            snd(snd_wing);
            des(char("s"));
            char("so").shake = 3;
            sprite_char("so", sSock_Jockey, 0, 0);
        }
    }
    
    if (j2 == 0 && j == 3)
    {
        oPlayer.draw = true;
        op.camMode = "Free";
        move_player(60, 290, 1260, sKris_Right, 10);
        move_char("s", 60, 56, 1260, sSusie_RightSad, 1, function()
        {
            other.image_speed = 0;
            other.image_index = 0;
        });
        move_char("r", 60, 230, 1270, sRalsei_Right, 0.16666666666666666, function()
        {
            other.image_speed = 0;
            other.image_index = 0;
        });
        move_char("so", 60, 140, 1240, sSock_Right, 1, function()
        {
            sprite_char("so", sSock_Left, 1, 0);
        });
    }
    
    if (j2 == 0 && j == 90)
    {
        do_text(undefined, undefined, g_t("12_1"), ["ow", "forceDown"], [sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFont1, sFontSock, sFont1, sFont1, sFont1], undefined, [snd_txtSus, snd_txtSus, snd_txtral, snd_txtral, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtral, snd_txtMonster, snd_txtMonster, snd_txtMonster, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSock, snd_txtSock, snd_txtSus, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtral], undefined, undefined, [4, 1, 7, 6, 10, 8, 8, 9, 13, 42, -1, -1, -1, 4, 2, 34, 10, 9, 19, 8, 38, 41, 22], [function()
        {
        }, function()
        {
            sprite_char("s", sSusie_Sprites, 0, 0);
        }, function()
        {
            sprite_player(sKris_Left, 0);
            sprite_char("r", sRalsei_Left, 0, 0);
            sprite_char("s", sSusie_Sprites, 4, 0);
            sprite_char("so", sSock_Right, 1, 0);
        }, function()
        {
            sprite_char("r", sRalsei_Right, 0, 0);
        }, function()
        {
            sprite_char("r", sRalsei_Left, 0, 0);
            sprite_char("so", sSock_Right, 0, 1);
        }, function()
        {
            op.twait = 60;
            move_char("so", 30, 140, 1280, sSock_Down, 1, function()
            {
                other.image_speed = 0;
                other.image_index = 1;
            });
            sprite_player(sKris_Down, 0);
            sprite_char("r", sRalsei_Down, 0, 0);
            sprite_char("s", sSusie_Down, 0, 0);
        }, function()
        {
            oCC.j2 = 1;
        }, function()
        {
        }, function()
        {
        }, function()
        {
            op.twait = 9999;
            oCC.j2 = 3;
            oCC.j = 0;
            sprite_player(sKris_Left, 0);
            sprite_char("r", sRalsei_Left, 0, 0);
            sprite_char("s", sSusie_RightSad, 0, 0);
            sprite_char("so", sSock_Right, 1, 0);
        }, function()
        {
            op.twait = 90;
            oCC.j2 = 5;
            oCC.j = 0;
            op.drawBox = true;
            op.drawBox = false;
            sprite_player(sKris_Down, 0);
        }, function()
        {
        }, function()
        {
        }, function()
        {
            op.twait = 60;
            op.drawBox = true;
            oCC.j2 = 6;
            oCC.j = 0;
        }, function()
        {
        }, function()
        {
            op.twaitFunc = function()
            {
                ow_music(mus_stars_of_destiny, true);
            };
            
            op.twait = 60;
            screenShake(3, 3);
            oPlayer.image_xscale *= -1;
            move_player(30, oPlayer.x, oPlayer.y, sKris_Jump, 1, function()
            {
                oPlayer.shake = 3;
                sprite_player(sKris_LandCool, 0);
                oPlayer.image_xscale *= -1;
                snd(snd_wing);
            }, ["arc1"]);
            sprite_char("s", sSusie_Sprites, 2, 0);
            char("s").shake = 3;
            sprite_char("r", sRalseiH_Damage, 0, 0);
            char("r").shake = 3;
            spawnEEF(oPlayer.x, oPlayer.y - 30, sSoul, 2, "grow1,drawN");
            spawnEEF(oPlayer.x, oPlayer.y - 30, sSoul, 2, "grow2,drawN");
            snd(snd_soulmode);
        }, function()
        {
        }, function()
        {
            sprite_char("s", sSusie_Right, 0, 0);
            sprite_char("r", sRalsei_Right, 0, 0);
        }, function()
        {
            sprite_char("so", sSock_Left, 1, 0);
            miniFace(200, 50, 20, 28, [g_st("12_2")]);
        }, function()
        {
            sprite_char("r", sRalsei_Left, 0, 0);
            sprite_player(sKris_Left, 0);
        }, function()
        {
            op.twait = 60;
            oCC.j2 = 7;
            oCC.j = 0;
            move_char("so", 10, 50, 1260, sSock_Left, 0, function()
            {
                other.image_index = 0;
            });
        }, function()
        {
            snd(snd_jump);
            move_char("so", 10, char("so").x, 850, sSock_Jockey, 0);
            sprite_char("so", sSock_Jockey, 1, 0);
        }, function()
        {
            op.twait = 60;
            sprite_char("r", sRalsei_Right, 0, 0);
            oCC.j2 = 8;
            oCC.j = 0;
        }, -1], function()
        {
            move_char("r", 45, -50, char("r").y, sRalsei_Left, 0.16666666666666666, function()
            {
                des(char("so"));
                des(char("r"));
                oPlayer.move = true;
                oPlayer.freeMove = false;
                op.camMode = "player";
            });
        });
    }
};

funcDrawGUI = function()
{
    if (j1 > 0)
        j1 -= 0.02;
    
    ext(sPixel, 0, -500, -500, 9999, 9999, undefined, 0, j1);
    ext(sSpaceM, 0, 0, 0, 2, 2, undefined, 0, j3 / 2);
};
