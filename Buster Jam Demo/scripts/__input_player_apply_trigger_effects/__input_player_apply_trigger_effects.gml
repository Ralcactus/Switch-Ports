function __input_player_apply_trigger_effects(arg0)
{
    static _global = __input_global();
    
    if (arg0 == -3)
    {
        var _i = 0;
        
        repeat (2)
        {
            __input_player_apply_trigger_effects(_i);
            _i++;
        }
        
        exit;
    }
    
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
    
    with (_global.__players[arg0])
    {
        if (__trigger_effect_paused)
            exit;
        
        __trigger_effect_set(32775, __trigger_effect_left, false);
        __trigger_effect_set(32776, __trigger_effect_right, false);
    }
}
