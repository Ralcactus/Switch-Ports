function input_cursor_limit_boundary(arg0 = 0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_limit_boundary(_p);
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
        __limit_l = undefined;
        __limit_t = undefined;
        __limit_r = undefined;
        __limit_b = undefined;
        __limit_x = undefined;
        __limit_y = undefined;
        __limit_radius = undefined;
        __limit_boundary_margin = arg0;
        __limit();
    }
}
