function input_binding_set(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = undefined)
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
    
    if (arg3 < 0)
    {
        __input_error("Invalid \"alternate\" argument (", arg3, ")");
        return undefined;
    }
    
    if (arg3 >= 4)
    {
        __input_error("\"alternate\" argument too large (", arg3, " must be less than ", 4, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");
        return undefined;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
    if (!input_profile_exists(arg4, arg2))
        __input_error("Profile name \"", arg4, "\" doesn't exist");
    
    if (!input_value_is_binding(arg1))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    _global.__players[arg2].__binding_set(arg4, arg0, arg3, arg1);
    input_verb_consume(-3, arg2);
}
