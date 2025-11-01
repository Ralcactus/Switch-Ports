function input_player_ghost_set(arg0, arg1 = 0)
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
    
    if (arg1 == -3)
    {
        var _i = 0;
        
        repeat (2)
        {
            input_player_ghost_set(arg0, _i);
            _i++;
        }
        
        exit;
    }
    
    if (_global.__players[arg1].__ghost == arg0)
        exit;
    
    _global.__players[arg1].__ghost = arg0;
    
    if (arg0)
        input_source_clear(arg1);
}
