function do_text(arg0 = [100], arg1 = [100], arg2 = ["burger"], arg3 = [], arg4 = [sFont1], arg5 = [rgb(255, 255, 255)], arg6 = [snd_txtMonster], arg7 = [2], arg8 = [2], arg9 = [], arg10 = [-1], arg11 = -1)
{
    op.face = [];
    op.face = arg9;
    
    if (array_length(op.face) == 0)
    {
        repeat (40)
            array_push(op.face, -1);
    }
    
    if (oPlayer.sinceMoved < 5)
    {
        op.camX = oPlayer.x - 320;
        op.camY = oPlayer.y - 240 - 38;
        
        if (op.camX < op.parameter[0])
            op.camX = op.parameter[0];
        
        if (op.camX > op.parameter[1])
            op.camX = op.parameter[1];
        
        if (op.camY < op.parameter[2])
            op.camY = op.parameter[2];
        
        if (op.camY > op.parameter[3])
            op.camY = op.parameter[3];
    }
    
    with (instance_create_depth(0, 0, 0, oText))
    {
        cr_count = 0;
        obj_seed = 0;
        obj_seed = arg3;
        funcEnd = arg11;
        _ii = 0;
        
        var ii = function(arg0)
        {
            return clamp(_ii, 0, array_length(arg0) - 1);
        };
        
        if (array_contains(arg3, "ow"))
        {
            arg0[ii(arg0)] = 58;
            
            if (!array_contains(arg3, "manual"))
                arg1[ii(arg1)] = 346;
            
            array_push(arg3, "mono");
            array_push(arg3, "bc");
        }
        
        repeat (array_length(arg2))
        {
            if (array_contains(arg3, "ow"))
            {
                arg0[ii(arg0)] = 58;
                
                if (!array_contains(arg3, "manual"))
                {
                    if ((op.camY < (oPlayer.y - 240 - 38) && !array_contains(arg3, "forceDown")) || array_contains(arg3, "forceUp"))
                        arg1[ii(arg1)] = 36;
                    else
                        arg1[ii(arg1)] = 346;
                }
            }
            
            if (array_contains(arg3, "shop"))
            {
                arg0[ii(arg0)] = 34;
                arg1[ii(arg1)] = 266;
            }
            
            textObj(arg2[ii(arg2)], arg0[ii(arg0)], arg1[ii(arg1)], arg4[ii(arg4)], arg5[ii(arg5)], arg6[ii(arg6)], arg3, arg10[ii(arg10)]);
            
            if (array_contains(arg3, "bb"))
                textObj1(arg7[ii(arg7)], arg8[ii(arg8)]);
            
            _ii++;
        }
    }
}

function miniFace(arg0 = 0, arg1 = 0, arg2 = 0, arg3 = 0, arg4 = ["A", "B", "C"], arg5 = sFont1)
{
    with (instance_create_depth((arg0 - 10) + 24 + 34, (arg1 - 10) + 312 + 34, -9999, oMiniFace))
    {
        image_speed = 0;
        image_index = arg3;
        delay = arg2;
        text = arg4;
        font = arg5;
    }
}

function res_keys()
{
    KeyUP = false;
    tymeUP = 2;
    TapUP = false;
    KeyDOWN = false;
    tymeDOWN = 2;
    TapDOWN = false;
    KeyLEFT = false;
    tymeLEFT = 2;
    TapLEFT = false;
    KeyRIGHT = false;
    tymeRIGHT = 2;
    TapRIGHT = false;
    KeyZ = false;
    tymeZ = 2;
    TapZ = false;
    KeyX = false;
    tymeX = 2;
    TapX = false;
    KeyC = false;
    tymeC = 2;
    TapC = false;
}

function use_keys(arg0 = 0)
{
    if (op.keys[2][0] == 0)
        KeyUP = keyboard_check(op.keys[2][1]);
    else
        KeyUP = keyboard_check(ord(op.keys[2][1]));
    
    if (op.keys[0][0] == 0)
        KeyDOWN = keyboard_check(op.keys[0][1]);
    else
        KeyDOWN = keyboard_check(ord(op.keys[0][1]));
    
    if (op.keys[3][0] == 0)
        KeyLEFT = keyboard_check(op.keys[3][1]);
    else
        KeyLEFT = keyboard_check(ord(op.keys[3][1]));
    
    if (op.keys[1][0] == 0)
        KeyRIGHT = keyboard_check(op.keys[1][1]);
    else
        KeyRIGHT = keyboard_check(ord(op.keys[1][1]));
    
    if (op.keys[4][0] == 0)
        KeyZ = keyboard_check(op.keys[4][1]);
    else
        KeyZ = keyboard_check(ord(op.keys[4][1]));
    
    if (op.keys[5][0] == 0)
        KeyX = keyboard_check(op.keys[5][1]);
    else
        KeyX = keyboard_check(ord(op.keys[5][1]));
    
    if (op.keys[6][0] == 0)
        KeyC = keyboard_check(op.keys[6][1]);
    else
        KeyC = keyboard_check(ord(op.keys[6][1]));
    
    if (keyboard_check(vk_enter))
        KeyZ = true;
    
    if (keyboard_check(vk_shift))
        KeyX = true;
    
    if (keyboard_check(vk_control))
        KeyC = true;
    
    var _gp = global.gamepad_main;
    
    if (_gp != undefined)
    {
        if (arg0 == 0)
        {
            if (gamepad_axis_value(_gp, gp_axislv) < -0.3 || gamepad_button_check(_gp, gp_padu))
                KeyUP = true;
            
            if (gamepad_axis_value(_gp, gp_axislv) > 0.3 || gamepad_button_check(_gp, gp_padd))
                KeyDOWN = true;
            
            if (gamepad_axis_value(_gp, gp_axislh) < -0.3 || gamepad_button_check(_gp, gp_padl))
                KeyLEFT = true;
            
            if (gamepad_axis_value(_gp, gp_axislh) > 0.3 || gamepad_button_check(_gp, gp_padr))
                KeyRIGHT = true;
            
            if (gamepad_button_check(_gp, gp_face1))
                KeyZ = true;
            
            if (gamepad_button_check(_gp, gp_face2))
                KeyX = true;
            
            if (gamepad_button_check(_gp, gp_face4))
                KeyC = true;
        }
        
        if (arg0 == 1)
        {
            if (gamepad_axis_value(_gp, gp_axislv) > 0.3 || gamepad_button_check(_gp, gp_padd))
                KeyDOWN = true;
            
            if (gamepad_axis_value(_gp, gp_axislh) < -0.3 || gamepad_button_check(_gp, gp_padl))
                KeyLEFT = true;
            
            if (gamepad_axis_value(_gp, gp_axislh) > 0.3 || gamepad_button_check(_gp, gp_padr))
                KeyRIGHT = true;
            
            if (gamepad_button_check(_gp, gp_face1))
                KeyUP = true;
            
            if (gamepad_button_check(_gp, gp_face2))
                KeyX = true;
        }
    }
    
    if (KeyUP)
        tymeUP++;
    else
        tymeUP = 0;
    
    if (KeyDOWN)
        tymeDOWN++;
    else
        tymeDOWN = 0;
    
    if (KeyLEFT)
        tymeLEFT++;
    else
        tymeLEFT = 0;
    
    if (KeyRIGHT)
        tymeRIGHT++;
    else
        tymeRIGHT = 0;
    
    if (KeyZ)
        tymeZ++;
    else
        tymeZ = 0;
    
    if (KeyX)
        tymeX++;
    else
        tymeX = 0;
    
    if (KeyC)
        tymeC++;
    else
        tymeC = 0;
    
    if (KeyUP && tymeUP == 1)
        TapUP = true;
    else
        TapUP = false;
    
    if (KeyDOWN && tymeDOWN == 1)
        TapDOWN = true;
    else
        TapDOWN = false;
    
    if (KeyLEFT && tymeLEFT == 1)
        TapLEFT = true;
    else
        TapLEFT = false;
    
    if (KeyRIGHT && tymeRIGHT == 1)
        TapRIGHT = true;
    else
        TapRIGHT = false;
    
    if (KeyZ && tymeZ == 1)
        TapZ = true;
    else
        TapZ = false;
    
    if (KeyX && tymeX == 1)
        TapX = true;
    else
        TapX = false;
    
    if (KeyC && tymeC == 1)
        TapC = true;
    else
        TapC = false;
    
    if (op.code == 1)
        res_keys();
}

function ow_music(arg0, arg1 = false)
{
    if ((op.musicOW != arg0 || arg1) && true)
    {
        audio_stop_sound(op.musicOW);
        audio_play_sound(arg0, 0, true);
    }
    
    op.musicOW = arg0;
}

function ow_music_stop()
{
    audio_stop_sound(op.musicOW);
    op.musicOW = -1;
}

function mg(arg0 = sG1, arg1 = 0, arg2 = 0, arg3 = [0, 0], arg4 = 0, arg5 = [])
{
    with (instance_create_depth(arg1, arg2, 0, oGround))
    {
        sprite_index = arg0;
        move = arg3;
        image_index = arg4;
        seed = arg5;
    }
}

function keysText(arg0 = -1)
{
    if (arg0 == 38)
        array_push(i1, g_st("m_3e2_1"));
    else if (arg0 == 40)
        array_push(i1, g_st("m_3e2_2"));
    else if (arg0 == 37)
        array_push(i1, g_st("m_3e2_3"));
    else if (arg0 == 39)
        array_push(i1, g_st("m_3e2_4"));
    else
        array_push(i1, arg0);
}

function keysText2(arg0 = -1)
{
    if (arg0 == 38)
        return g_st("m_3e2_1");
    else if (arg0 == 40)
        return g_st("m_3e2_2");
    else if (arg0 == 37)
        return g_st("m_3e2_3");
    else if (arg0 == 39)
        return g_st("m_3e2_4");
    else
        return arg0;
}

function make_prompt(arg0 = ["Yes", "No"], arg1 = [function()
{
    do_text(undefined, undefined, ["* You picked Yes"], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
}, function()
{
    do_text(undefined, undefined, ["* You picked No"], ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
    {
        oPlayer.move = true;
    });
}], arg2 = 0)
{
    with (instance_create_depth(0, 0, 0, oPrompt))
    {
        text = arg0;
        functions = arg1;
        offset = arg2;
    }
}

function g_t(arg0, arg1 = false)
{
    op.useLang = op.language;
    
    if (arg1)
        op.useLang = 1;
    
    var i = 0;
    var _array = [];
    
    while (ds_grid_get(op.CSVtext, 0, i) != arg0)
        i++;
    
    array_push(_array, ds_grid_get(op.CSVtext, op.useLang, i));
    i++;
    
    while (ds_grid_get(op.CSVtext, 0, i) == "" && ds_grid_get(op.CSVtext, op.useLang, i) != "")
    {
        array_push(_array, ds_grid_get(op.CSVtext, op.useLang, i));
        i++;
    }
    
    return _array;
}

function g_st(arg0, arg1 = false)
{
    op.useLang = op.language;
    
    if (arg1)
        op.useLang = 1;
    
    var i = 0;
    
    while (ds_grid_get(op.CSVtext, 0, i) != arg0)
        i++;
    
    return ds_grid_get(op.CSVtext, op.useLang, i);
}
