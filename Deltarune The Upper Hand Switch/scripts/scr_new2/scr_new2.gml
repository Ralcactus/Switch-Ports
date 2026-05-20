function fix_res()
{
    audio_sound_gain(mus_Steam_Jams, 1, 0);
    audio_sound_gain(mus_Sockswald_loop, 1, 0);
    audio_sound_pitch(mus_Sockswald_loop, 1);
    audio_sound_pitch(mus_Sockswald_strings, 1);
    audio_sound_gain(mus_Socks_World, 1, 0);
    audio_sound_gain(mus_Socks_world_8bit, 1, 0);
    audio_sound_gain(mus_trouble_at_hand, 1, 0);
    audio_sound_gain(mus_constellation, 1, 0);
    audio_stop_sound(mus_Socks_World);
    audio_stop_sound(mus_Socks_world_8bit);
    audio_sound_set_track_position(mus_stars_of_destiny, 0);
    audio_sound_pitch(snd_star, 1);
    audio_stop_all();
    
    if (!op.benAlways)
        op.benMode = false;
    
    op.hurtPoints = 0;
    op.pastRoom = -1;
    oPlayer.sprite = sKris_Down;
    oPlayer.sprite_index = sKris_Down;
    oPlayer.image_index = 0;
    op.item = [];
    op.saveItem = -1;
}

function fix_cam(arg0 = 30)
{
    op.camFix = [true, arg0, arg0, op.camX, op.camY, op.cameX, op.cameY];
}

function make_wow(arg0 = 0, arg1 = 0, arg2 = 16, arg3 = 16, arg4 = 0, arg5 = 0)
{
    with (instance_create_depth(arg0, arg1, -9999, oWow))
    {
        image_xscale = 0.0625 * arg2;
        image_yscale = 0.0625 * arg3;
        moveX = arg4;
        moveY = arg5;
    }
}

function spawn_follow()
{
    des(oFollow);
    
    with (instance_create_depth(oPlayer.x, oPlayer.y, 0, oFollow))
        numb = 1;
    
    with (instance_create_depth(oPlayer.x, oPlayer.y, 0, oFollow))
        numb = 2;
}

function create_char(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = -1)
{
    with (instance_create_depth(arg1, arg2, -9999, oChar))
    {
        numb = arg0;
        sprite_index = arg3;
        image_index = 0;
        image_speed = arg4;
        func = arg5;
    }
}

function move_player(arg0 = 30, arg1 = 0, arg2 = 0, arg3 = sKris_Up, arg4 = 4, arg5 = -1, arg6 = [])
{
    if (arg1 == -1)
        arg1 = oPlayer.x;
    
    if (arg2 == -1)
        arg2 = oPlayer.y;
    
    var _dir = 0;
    
    if (oPlayer.x > arg1)
    {
        if (abs(oPlayer.x - arg1) > abs(oPlayer.y - arg2))
            _dir = "left";
        else if ((oPlayer.y - arg2) < 0)
            _dir = "down";
        else
            _dir = "up";
    }
    else if (abs(oPlayer.x - arg1) > abs(oPlayer.y - arg2))
    {
        _dir = "right";
    }
    else if ((oPlayer.y - arg2) < 0)
    {
        _dir = "down";
    }
    else
    {
        _dir = "up";
    }
    
    if (arg3 == -1)
    {
        if (_dir == "up")
            arg3 = sKris_Up;
        
        if (_dir == "down")
            arg3 = sKris_Down;
        
        if (_dir == "left")
            arg3 = sKris_Left;
        
        if (_dir == "right")
            arg3 = sKris_Right;
    }
    
    oPlayer.move = false;
    oPlayer.freeMove = true;
    oPlayer.moveTime = [arg0, arg0, arg1, arg2, oPlayer.x, oPlayer.y, arg3, arg4, arg5];
    oPlayer.doLerp = true;
    oPlayer.seed = arg6;
}

function move_follow(arg0, arg1 = 30, arg2 = 0, arg3 = 0, arg4 = sKris_Up, arg5 = 4, arg6 = -1)
{
    oPlayer.move = false;
    oPlayer.freeMove = true;
    
    with (oFollow)
    {
        if (numb == arg0)
        {
            if (arg2 == -1)
                arg2 = x;
            
            if (arg3 == -1)
                arg3 = y;
            
            var _dir = 0;
            
            if (x > arg2)
            {
                if (abs(x - arg2) > abs(y - arg3))
                    _dir = "left";
                else if ((y - arg3) < 0)
                    _dir = "down";
                else
                    _dir = "up";
            }
            else if (abs(x - arg2) > abs(y - arg3))
            {
                _dir = "right";
            }
            else if ((y - arg3) < 0)
            {
                _dir = "down";
            }
            else
            {
                _dir = "up";
            }
            
            if (arg4 == -1)
            {
                if (arg0 == 1)
                {
                    if (_dir == "up")
                        arg4 = sSusie_Up;
                    
                    if (_dir == "down")
                        arg4 = sSusie_Down;
                    
                    if (_dir == "left")
                        arg4 = sSusie_Left;
                    
                    if (_dir == "right")
                        arg4 = sSusie_Right;
                }
                
                if (arg0 == 2)
                {
                    if (_dir == "up")
                        arg4 = sRalsei_Up;
                    
                    if (_dir == "down")
                        arg4 = sRalsei_Down;
                    
                    if (_dir == "left")
                        arg4 = sRalsei_Left;
                    
                    if (_dir == "right")
                        arg4 = sRalsei_Right;
                }
            }
            
            moveTime = [arg1, arg1, arg2, arg3, x, y, arg4, arg5, arg6];
        }
    }
    
    oPlayer.doLerp = true;
}

function move_char(arg0, arg1 = 30, arg2 = 0, arg3 = 0, arg4 = sKris_Up, arg5 = 1, arg6 = -1, arg7 = [])
{
    if (arg6 != -2)
        oPlayer.move = false;
    else
        arg6 = -1;
    
    with (oChar)
    {
        if (numb == arg0)
        {
            if (arg2 == -1)
                arg2 = x;
            
            if (arg3 == -1)
                arg3 = y;
            
            image_index = 0;
            moveTime = [arg1, arg1, arg2, arg3, x, y, arg4, arg5, arg6];
            seed = arg7;
        }
    }
}

function sprite_player(arg0 = sKris_Up, arg1 = 0, arg2 = 0, arg3 = 0)
{
    oPlayer.move = false;
    oPlayer.freeMove = true;
    
    if (arg0 != -1)
    {
        oPlayer.sprite = arg0;
        oPlayer.sprite_index = arg0;
        oPlayer.image_index = arg1;
    }
    
    oPlayer.x += arg2;
    oPlayer.y += arg3;
    oPlayer.doLerp = true;
}

function sprite_follow(arg0 = 0, arg1 = sKris_Up, arg2 = 0, arg3 = 0, arg4 = 0)
{
    oPlayer.move = false;
    oPlayer.freeMove = true;
    
    with (oFollow)
    {
        if (numb == arg0)
        {
            if (arg1 != -1)
            {
                sprite_index = arg1;
                sprite = arg1;
                image_ = arg2;
            }
            
            x += arg3;
            y += arg4;
        }
    }
    
    oPlayer.doLerp = true;
}

function sprite_char(arg0 = 0, arg1 = -1, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = -1)
{
    if (arg6 != -2)
    {
        oPlayer.move = false;
        oPlayer.freeMove = true;
    }
    else
    {
        arg6 = -1;
    }
    
    with (oChar)
    {
        if (numb == arg0)
        {
            if (arg1 != -1)
            {
                sprite_index = arg1;
                image_index = arg2;
                image_speed = arg3;
            }
            
            x += arg4;
            y += arg5;
            
            if (arg6 != -1)
                func = arg6;
        }
    }
    
    oPlayer.doLerp = true;
}

function char(arg0)
{
    var _get = -4;
    
    with (oChar)
    {
        if (numb == arg0)
            _get = self;
    }
    
    return _get;
}

function handd(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 2, arg6 = 2, arg7 = 0, arg8 = 16777215, arg9 = 1)
{
    array_push(_handd, [arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]);
}

function squashHand(arg0 = 1, arg1 = 10, arg2 = 0.01, arg3 = [sHand_Idle2, sHand_IdleM2], arg4 = -1, arg5 = -1)
{
    oEnemie.armScaleType[arg0] = 1;
    oEnemie.armDuration[arg0] = arg1;
    oEnemie.armPower[arg0] = arg2;
    oEnemie.newSprites[arg0 * 2] = arg3[0];
    oEnemie.newSprites[1 + (arg0 * 2)] = arg3[1];
    oEnemie.armFunc[arg0] = arg4;
    oEnemie.armSound[arg0] = arg5;
}

function setHand(arg0 = 1, arg1 = [sHand_Idle2, sHand_IdleM2], arg2 = 0, arg3 = -1)
{
    oEnemie.armSprites[arg0 * 2] = arg1[0];
    oEnemie.armSprites[1 + (arg0 * 2)] = arg1[1];
    
    if (arg2 != -1)
        oEnemie.time[arg0] = arg2;
    
    oEnemie.endImageFunc[arg0] = arg3;
}

function getPep(arg0)
{
    var found = -4;
    
    with (oPep)
    {
        if (numb == arg0)
            found = self;
    }
    
    return found;
}
