function input_cursor_set(arg0, arg1, arg2 = 0, arg3 = false)
{
    static _global = __input_global();
    
    if (arg2 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_set(arg0, arg1, _p, arg3);
            _p++;
        }
        
        exit;
    }
    
    if (arg2 < 0)
    {
        __input_error("Invalid player index provided (", arg2, ")");
        return undefined;
    }
    
    if (arg2 >= 2)
    {
        __input_error("Player index too large (", arg2, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    return _global.__players[arg2].__cursor.__set(arg0, arg1, arg3);
}
