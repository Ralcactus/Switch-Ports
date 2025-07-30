function input_cursor_limit_get(argument0 = 0)
{
    static _global = __input_global();
    
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
        return 
        {
            __left: __limit_l,
            __top: __limit_t,
            __right: __limit_r,
            __bottom: __limit_b,
            __circle_x: __limit_x,
            __circle_y: __limit_y,
            __circle_radius: __limit_radius,
            __boundary_margin: __limit_boundary_margin
        };
    }
}
