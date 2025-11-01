function input_source_clear(arg0 = 0)
{
    static _global = __input_global();
    
    if (arg0 == -3)
    {
        var _i = 0;
        
        repeat (2)
        {
            _global.__players[_i].__sources_clear();
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
    
    _global.__players[arg0].__sources_clear();
}
