function input_vibrate_constant(arg0, arg1, arg2, arg3 = 0, arg4 = false)
{
    static _global = __input_global();
    
    if (arg3 < 0)
    {
        __input_error("Invalid player index provided (", arg3, ")");
        return undefined;
    }
    
    if (arg3 >= 2)
    {
        __input_error("Player index too large (", arg3, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    arg0 = clamp(arg0, 0, 1);
    arg1 = clamp(arg1, -1, 1);
    arg2 = max(arg2, 0);
    _global.__players[arg3].__vibration_add_event(new __input_class_vibration_constant(arg0, arg1, arg2, arg4));
}
