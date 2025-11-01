function input_cursor_limit_circle(arg0, arg1, arg2, arg3 = 0)
{
    static _global = __input_global();
    
    if (arg3 == -3)
    {
        var _p = 0;
        
        repeat (2)
        {
            input_cursor_limit_circle(arg0, arg1, arg2, _p);
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
        __limit_l = undefined;
        __limit_t = undefined;
        __limit_r = undefined;
        __limit_b = undefined;
        __limit_x = arg0;
        __limit_y = arg1;
        __limit_radius = arg2;
        __limit_boundary_margin = undefined;
        __limit();
    }
}
