function input_binding_remove(arg0, arg1 = 0, arg2 = 0, arg3 = undefined)
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
    
    if (arg2 < 0)
    {
        __input_error("Invalid \"alternate\" argument (", arg2, ")");
        return undefined;
    }
    
    if (arg2 >= 4)
    {
        __input_error("\"alternate\" argument too large (", arg2, " must be less than ", 4, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");
        return undefined;
    }
    
    if (!input_profile_exists(arg3, arg1))
        __input_error("Profile name \"", arg3, "\" doesn't exist");
    
    _global.__players[arg1].__binding_remove(arg3, arg0, arg2);
}
