function input_source_clear(argument0 = 0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _i = 0;
        
        repeat (1)
        {
            _global.__players[_i].__sources_clear();
            _i++;
        }
        
        exit;
    }
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    _global.__players[argument0].__sources_clear();
}
