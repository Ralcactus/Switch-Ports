function input_trigger_effect_weapon(arg0, arg1, arg2, arg3, arg4 = 0)
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
    
    _global.__players[arg4].__trigger_effect_set(arg0, new __input_class_trigger_effect_weapon(arg0, arg1, arg2, arg3), true);
}
