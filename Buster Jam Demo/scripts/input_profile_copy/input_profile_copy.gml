function input_profile_copy(arg0, arg1, arg2, arg3)
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
    
    if (arg2 < 0)
    {
        __input_error("Invalid destination player index provided (", arg2, ")");
        return undefined;
    }
    
    if (arg2 >= 2)
    {
        __input_error("Destination player index too large (", arg2, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    input_profile_import(input_profile_export(arg1, arg0, false, false), arg3, arg2);
}
