function input_cursor_gyro_params_set(arg0 = undefined, arg1 = undefined, arg2 = undefined, arg3 = undefined, arg4 = 0, arg5 = undefined)
{
    static _global = __input_global();
    
    if (arg4 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_gyro_params_set(arg0, arg1, arg2, arg3, _p, arg5);
            _p++;
        }
        
        exit;
    }
    
    if (arg4 < 0)
    {
        __input_error("Invalid player index provided (", arg4, ")");
        return undefined;
    }
    
    if (arg4 >= 2)
    {
        __input_error("Player index too large (", arg4, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg5 != undefined)
        _global.__players[arg4].__gyro_gamepad = arg5;
    
    if (arg0 != undefined)
        _global.__players[arg4].__gyro_axis_x = arg0;
    
    if (arg1 != undefined)
        _global.__players[arg4].__gyro_axis_y = arg1;
    
    if (arg2 != undefined)
        _global.__players[arg4].__gyro_sensitivity_x = arg2;
    
    if (arg3 != undefined)
        _global.__players[arg4].__gyro_sensitivity_y = arg3;
}
