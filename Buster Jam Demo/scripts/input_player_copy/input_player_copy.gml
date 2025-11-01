function input_player_copy(arg0, arg1)
{
    static _global = __input_global();
    
    if (arg0 < 0)
    {
        __input_error("Invalid source player index provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 >= 2)
    {
        __input_error("Source player index too large (", arg0, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg1 < 0)
    {
        __input_error("Invalid destination player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Destination player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    input_player_import(input_player_export(arg0, false, false), arg1);
}
