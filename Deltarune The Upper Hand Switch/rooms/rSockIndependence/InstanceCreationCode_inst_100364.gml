op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = -480;
audio_stop_all();
ow_music_stop();
_snd = audio_play_sound(mus_stars_of_destiny, 0, true);
audio_sound_set_track_position(_snd, 87.3);
audio_sound_gain(_snd, 0, 0);
audio_sound_gain(_snd, 1, 2500);
create_char("s", 140, 370, sSock_Jockey, 0);
create_char("r", 500, 370, sRalsei_Down, 0);
create_char("k", 320, 560, sKris_Jump, 1);
res_i();
i1 = 1;
i2 = 0;
i3 = 0;

funcStep = function()
{
    i++;
    
    if (op.camY < 100 && i > 60 && i2 == 0)
        op.camY += 4;
    
    if (op.camY > 0 && i2 == 1)
    {
        op.camY -= 4;
        
        if (op.camY < 0)
            op.camY = 0;
    }
    
    if (i2 == 4)
    {
        i3++;
        
        if (i3 == 150)
            room_goto(rRalseiAsk);
    }
    
    if (i == 180)
    {
        snd(snd_jump);
        sprite_char("r", sRalsei_Left, 0, 0);
        move_char("k", 20, 320, 400, sKris_Jump, 0.16666666666666666, function()
        {
            other.shake = 3;
            snd(snd_wing);
            sprite_char("k", sKris_LandCool, 0, 0.16666666666666666);
        }, ["arc2"]);
    }
    
    if (i == 212)
        char("k").image_speed = 0;
    
    if (i == 200)
    {
        move_char("s", 30, 200, 400, sSock_Jockey, 0);
        move_char("r", 30, 400, 400, sRalsei_Left, 0.16666666666666666, function()
        {
            other.image_speed = 0;
            other.image_index = 0;
        });
    }
    
    if (i == 230)
    {
        do_text(undefined, [346, 346, 346, 346, 346, 346, 346, 346, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36], g_t("14_1"), ["ow", "manual"], [sFont1, sFont1, sFont1, sFont1, sFontSock, sFont1, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFontSock, sFont1, sFont1, sFont1, sFont1, sFont1, sFont1, sFontSock, sFontSock, sFont1, sFont1], undefined, [snd_txtral, snd_txtSus, snd_txtral, snd_txtral, snd_txtSock, snd_txtSus, snd_txtSock, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSock, snd_txtSock, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtral, snd_txtral, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtral, snd_txtral, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSus, snd_txtSock, snd_txtSock, snd_txtMonster, snd_txtMonster], undefined, undefined, [33, 28, 35, 15, 13, 2, 8, 10, 46, 38, 39, 10, 8, 34, 47, 48, 48, 49, 37, 15, 52, 52, 43, 44, 8, 8, 9, 9, 35, 42, 18, 51, 16, 23, 13, 9, 11, 11], [-1, function()
        {
            sprite_char("k", sKris_Left, 0, 0);
        }, function()
        {
            sprite_char("k", sKris_Right, 0, 0);
        }, -1, function()
        {
            char("s").shake = 3;
            sprite_char("k", sKris_Left, 0, 0);
        }, -1, function()
        {
            char("s").shake = 3;
        }, -1, function()
        {
            op.twait = 60;
            oCC.i2 = 1;
            sprite_char("k", sKris_Up, 0, 0);
            move_char("s", 30, 240, 340, sSock_Jockey, 0);
            move_char("r", 30, 400, 340, sRalsei_Up, 0.16666666666666666, function()
            {
                other.image_speed = 0;
                other.image_index = 0;
            });
        }, -1, -1, function()
        {
            op.twait = 20;
            audio_stop_sound(mus_stars_of_destiny);
            snd(snd_jump);
            sprite_char("r", sRalsei_Left, 0, 0);
            create_char("sock", char("s").x, char("s").y, sSock_Right, 1);
            move_char("sock", 10, 320, 310, sSock_Right, 1, function()
            {
                other.sprite_index = sSock_Left;
                other.image_speed = 0;
                other.image_index = 1;
            });
            move_char("s", 20, 240, 340, sSusie_Fall, 1, function()
            {
                other.sprite_index = sSusie_RightSad;
                other.image_speed = 0;
                other.image_index = 0;
                char("s").shake = 3;
            }, ["arc2"]);
        }, -1, -1, -1, -1, function()
        {
            sprite_char("s", sSusie_Sprites, 0, 0);
        }, function()
        {
            op.twait = 45;
            
            op.twaitFunc = function()
            {
                sprite_char("s", sSusie_Sprites, 4, 0);
            };
        }, function()
        {
            sprite_char("sock", sSock_Sprites, 0, 0);
        }, -1, function()
        {
            sprite_char("sock", sSock_Sprites, 6, 0);
        }, function()
        {
            op.twait = 60;
            oCC.i2 = 2;
            
            op.twaitFunc = function()
            {
                sprite_char("sock", sSock_Shiver, 0, 1);
            };
        }, -1, function()
        {
            sprite_char("sock", sSock_Left, 1, 0);
        }, -1, -1, -1, -1, function()
        {
            op.twait = 120;
            oCC.i2 = 3;
            
            op.twaitFunc = function()
            {
                sprite_char("sock", sSock_Right, 1, 0);
            };
        }, -1, function()
        {
            sprite_char("s", sSusie_Sprites, 0, 0);
            sprite_char("sock", sSock_Left, 1, 0);
        }, function()
        {
            sprite_char("s", sSusie_Sprites, 3, 0);
        }, function()
        {
            sprite_char("s", sSusie_Sprites, 4, 0);
        }, -1, -1, function()
        {
            sprite_char("sock", sSock_Wobble, 0, 1);
        }, function()
        {
            sprite_char("sock", sSock_Wobble, 0, 0);
        }, function()
        {
            snd(snd_txtSock);
        }], function()
        {
            move_char("sock", 90, 330, 200, sSock_Up, undefined, undefined, ["shrink"]);
            sprite_char("s", sSusie_Up, 0, 0);
            sprite_char("r", sRalsei_Up, 0, 0);
            oCC.i2 = 4;
        });
    }
};

funcDrawGUI = function()
{
    ext(sPixel, 0, 0, 0, 999, 999, 0, 0, i1);
    
    if (i1 > 0)
        i1 -= (1/30);
};
