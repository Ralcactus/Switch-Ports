function input_trigger_effect_set_strength(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 == -3)
    {
        var _i = 0;
        
        repeat (2)
        {
            input_trigger_effect_set_strength(arg0, _i);
            _i++;
        }
        
        exit;
    }
    
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
    
    arg0 = clamp(arg0, 0, 1);
    
    with (_global.__players[arg1])
    {
        if (__trigger_effect_strength != arg0)
        {
            __trigger_effect_strength = arg0;
            __input_player_apply_trigger_effects(arg1);
        }
    }
}
