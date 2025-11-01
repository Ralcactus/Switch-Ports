function input_player_swap(arg0, arg1)
{
    static _global = __input_global();
    
    if (arg0 < 0)
    {
        __input_error("Invalid player index A provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 >= 2)
    {
        __input_error("Player index A too large (", arg0, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index B provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index B too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    var _original_a = _global.__players[arg0];
    var _original_b = _global.__players[arg1];
    _original_a.__index = arg1;
    _original_b.__index = arg0;
    _global.__players[arg0] = _original_b;
    _global.__players[arg1] = _original_a;
}
