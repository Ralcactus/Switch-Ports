function input_join_params_set(arg0, arg1, arg2, arg3, arg4 = true)
{
    static _global = __input_global();
    
    if (argument_count < 4)
        __input_error("input_join_params_set() must be given at least 4 arguments");
    
    if (arg1 < 1)
    {
        __input_error("Invalid maximum player count provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 > 2)
    {
        __input_error("Maximum player count too large (", arg1, " must not be greater than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg0 < 1)
    {
        __input_error("Invalid minimum player count provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 > arg1)
    {
        __input_error("Minimum player count larger than maximum (", arg0, " must be less than ", arg1, ")");
        return undefined;
    }
    
    if (!is_string(arg2) && !is_undefined(arg2))
        __input_error("Multiplayer leave verb must be a string or <undefined>");
    
    if (!is_method(arg3) && !(is_numeric(arg3) && script_exists(arg3)) && !is_undefined(arg3))
        __input_error("Multiplayer abort callback must be a function, a script, or <undefined>");
    
    _global.__join_player_min = arg0;
    _global.__join_player_max = arg1;
    _global.__join_leave_verb = arg2;
    _global.__join_abort_callback = arg3;
    _global.__join_drop_down = arg4;
}
