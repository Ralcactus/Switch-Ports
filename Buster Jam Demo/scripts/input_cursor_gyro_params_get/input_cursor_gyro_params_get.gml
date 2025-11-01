function input_cursor_gyro_params_get(arg0 = 0)
{
    static _global = __input_global();
    static _result = 
    {
        __axis_x: (1 << 0),
        __axis_y: (0 << 0),
        __sensitivity_x: 2,
        __sensitivity_y: -2,
        __gamepad: undefined
    };
    
    if (arg0 < 0)
    {
        __input_error("Invalid player index provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 >= 2)
    {
        __input_error("Player index too large (", arg0, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    _result.__axis_x = _global.__players[arg0].__gyro_axis_x;
    _result.__axis_y = _global.__players[arg0].__gyro_axis_y;
    _result.__sensitivity_x = _global.__players[arg0].__gyro_sensitivity_x;
    _result.__sensitivity_y = _global.__players[arg0].__gyro_sensitivity_y;
    _result.__gamepad = _global.__players[arg0].__gyro_gamepad;
    return _result;
}
