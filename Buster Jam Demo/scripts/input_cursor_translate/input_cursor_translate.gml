function input_cursor_translate(arg0 = undefined, arg1 = undefined, arg2, arg3 = 0, arg4 = false)
{
    static _global = __input_global();
    
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
    
    return _global.__players[arg3].__cursor.__translate(arg0, arg1, arg2, arg4);
}
