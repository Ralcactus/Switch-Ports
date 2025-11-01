function input_cursor_dx(arg0 = 0, arg1 = undefined)
{
    static _global = __input_global();
    
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
    
    var _cursor = _global.__players[arg0].__cursor;
    return __input_transform_coordinate(_cursor.__x - _cursor.__prev_x, _cursor.__y - _cursor.__prev_y, _cursor.__coord_space, arg1 ?? _cursor.__coord_space).x;
}
