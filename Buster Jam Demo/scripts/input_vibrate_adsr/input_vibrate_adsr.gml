function input_vibrate_adsr(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 0, arg8 = false)
{
    static _global = __input_global();
    
    if (arg7 < 0)
    {
        __input_error("Invalid player index provided (", arg7, ")");
        return undefined;
    }
    
    if (arg7 >= 2)
    {
        __input_error("Player index too large (", arg7, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    arg0 = clamp(arg0, 0, 1);
    arg1 = clamp(arg1, 0, 1);
    arg2 = clamp(arg2, -1, 1);
    arg3 = max(arg3, 0);
    arg4 = max(arg4, 0);
    arg5 = max(arg5, 0);
    arg6 = max(arg6, 0);
    _global.__players[arg7].__vibration_add_event(new __input_class_vibration_adsr(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg8));
}
