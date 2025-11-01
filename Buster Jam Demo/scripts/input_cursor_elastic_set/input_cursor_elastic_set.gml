function input_cursor_elastic_set(arg0, arg1, arg2, arg3 = 0, arg4 = true)
{
    static _global = __input_global();
    
    if (arg3 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_elastic_set(arg0, arg1, arg2, _p, arg4);
            _p++;
        }
        
        exit;
    }
    
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
    
    with (_global.__players[arg3].__cursor)
    {
        if (arg4 && __elastic_x != undefined && __elastic_y != undefined)
            __set(arg0 - __elastic_x, arg1 - __elastic_y, true);
        
        __elastic_x = arg0;
        __elastic_y = arg1;
        __elastic_strength = arg2;
    }
}
