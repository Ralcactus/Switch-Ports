function input_cursor_coord_space_set(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_coord_space_set(arg0, _p);
            _p++;
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
    
    with (_global.__players[arg1].__cursor)
    {
        if (__coord_space != arg0)
        {
            __x = _global.__pointer_x[arg0];
            __y = _global.__pointer_y[arg0];
            __prev_x = __x - _global.__pointer_dx[arg0];
            __prev_y = __y - _global.__pointer_dy[arg0];
            __coord_space = arg0;
        }
    }
}
