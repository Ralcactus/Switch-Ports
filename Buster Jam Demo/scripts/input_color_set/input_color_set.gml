function input_color_set(arg0, arg1 = 0)
{
    static _global = __input_global();
    
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
    
    if (!is_numeric(arg0) || arg0 < 0 || arg0 > 16777215)
    {
        __input_error("Invalid color value ", arg0);
        exit;
    }
    
    _global.__players[arg1].__color_set(arg0);
}
