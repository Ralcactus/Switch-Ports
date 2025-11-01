function input_binding_get(arg0, arg1 = 0, arg2 = 0, arg3 = undefined)
{
    static _global = __input_global();
    
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
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
    if (!input_profile_exists(arg3, arg1))
        __input_error("Profile name \"", arg3, "\" doesn't exist");
    
    if (is_string(arg1))
    {
        if (arg1 == "default")
        {
            if (arg3 == undefined)
                __input_error("Source must be specified when getting a binding from the default player");
            
            with (_global.__default_player)
                return __binding_get(arg3, arg0, arg2, false).__duplicate();
        }
        else
        {
            __input_error("Player \"", arg1, "\" not supported");
        }
    }
    
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
    
    with (_global.__players[arg1])
        return __binding_get(arg3, arg0, arg2, true);
    
    return undefined;
}
