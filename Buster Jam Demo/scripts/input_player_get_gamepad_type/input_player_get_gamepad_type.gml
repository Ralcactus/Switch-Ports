function input_player_get_gamepad_type(arg0 = 0, arg1 = undefined)
{
    static _global = __input_global();
    
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
    
    if (_global.__source_mode != (4 << 0))
        arg1 = undefined;
    
    if (arg1 != undefined)
    {
        if (!input_value_is_binding(arg1))
        {
            __input_error("Parameter is not a binding (typeof=", typeof(arg1), ")");
            exit;
        }
        
        var _gamepad_index = arg1.__gamepad_get();
        
        if (_gamepad_index == undefined)
            arg1 = undefined;
        else
            return input_gamepad_get_type(_gamepad_index);
    }
    
    if (arg1 == undefined)
        return input_gamepad_get_type(input_player_get_gamepad(arg0));
}
