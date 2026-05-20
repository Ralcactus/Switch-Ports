var _gamepad = ds_map_find_value(async_load, "pad_index");

switch (ds_map_find_value(async_load, "event_type"))
{
    case "gamepad discovered":
        array_push(global.gamepads, _gamepad);
        gamepad_set_axis_deadzone(_gamepad, 0.2);
        break;
    
    case "gamepad lost":
        var _array_index = array_get_index(global.gamepads, _gamepad);
        
        if (_array_index >= 0)
            array_delete(global.gamepads, _array_index, 1);
        
        break;
}

if (array_length(global.gamepads) > 0)
{
    global.gamepad_main = global.gamepads[0];
    op.gamepad = "xbox";
    
    if (string_pos("PS", gamepad_get_description(global.gamepads[0])) != 0)
        op.gamepad = "ps";
    
    if (op.gamepad == "xbox")
    {
        op.gp1 = "_s1";
        op.gp3 = "_s2";
        op.gp4 = "_s3";
        op.gp5 = "_s4";
        op.gp2 = "_s9";
        op.gp6 = "_se";
        
        if (op.benMode)
        {
            op.gp1 = "_s2";
            op.gp3 = "_s1";
            op.gp4 = "_s4";
            op.gp5 = "_s3";
        }
    }
    
    if (op.gamepad == "ps")
    {
        op.gp1 = "_s5";
        op.gp3 = "_s6";
        op.gp4 = "_s7";
        op.gp5 = "_s8";
        op.gp2 = "_s0";
        op.gp6 = "_sf";
    }
    
    op.gamepadTimer = 120;
    op.gamepadY = -20;
}
else
{
    global.gamepad_main = undefined;
    
    if (op.gamepad != 0)
    {
        op.gamepadTimer = 120;
        op.gamepadY = -20;
    }
    
    op.gamepad = 0;
}
