function input_verb_set(arg0, arg1, arg2 = 0, arg3 = true)
{
    static _global = __input_global();
    
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
    
    _global.__players[arg2].__verb_set(arg0, clamp(arg1, 0, 1), arg3);
}
