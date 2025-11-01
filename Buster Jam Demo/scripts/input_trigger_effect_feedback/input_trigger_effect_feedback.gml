function input_trigger_effect_feedback(arg0, arg1, arg2, arg3 = 0)
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
    
    _global.__players[arg3].__trigger_effect_set(arg0, new __input_class_trigger_effect_feedback(arg1, arg2), true);
}
