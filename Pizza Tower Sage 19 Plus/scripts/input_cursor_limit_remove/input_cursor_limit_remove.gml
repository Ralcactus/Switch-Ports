function input_cursor_limit_remove(argument0 = 0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _p = 0;
        
        repeat (1)
        {
            input_cursor_limit_remove(_p);
            _p++;
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
    
    with (_global.__players[argument0].__cursor)
    {
        __limit_l = undefined;
        __limit_t = undefined;
        __limit_r = undefined;
        __limit_b = undefined;
        __limit_x = undefined;
        __limit_y = undefined;
        __limit_radius = undefined;
        __limit_boundary_margin = undefined;
        __limit();
    }
}
