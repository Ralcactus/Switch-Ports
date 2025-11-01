function input_vibrate_pulse(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = false)
{
    static _global = __input_global();
    
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
    
    arg0 = clamp(arg0, 0, 1);
    arg1 = clamp(arg1, -1, 1);
    arg2 = max(arg2, 0);
    arg3 = max(arg3, 0);
    _global.__players[arg4].__vibration_add_event(new __input_class_vibration_pulse(arg0, arg1, arg2, arg3, arg5));
}
