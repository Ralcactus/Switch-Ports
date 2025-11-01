function input_trigger_effect_off(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    _global.__players[arg1].__trigger_effect_set(arg0, new __input_class_trigger_effect_off(), true);
}
