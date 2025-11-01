function input_binding_set_safe(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = undefined)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
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
    
    if (input_value_is_binding(arg1))
    {
        var _collisions = input_binding_test_collisions(arg0, arg1, arg2, arg4);
        
        if (array_length(_collisions) == 0)
        {
            input_binding_set(arg0, arg1, arg2, arg3, arg4);
        }
        else
        {
            if (array_length(_collisions) > 1)
                __input_trace("Warning! More than one binding collision found, resolution may not be desirable");
            
            arg4 = _global.__players[arg2].__profile_get(arg4);
            
            if (arg4 == undefined)
            {
                __input_trace("Warning! Cannot set binding, profile was <undefined>");
                return false;
            }
            
            var _verb_b = _collisions[0].__verb;
            var _alternate_b = _collisions[0].__alternate;
            
            if (arg0 != _verb_b || arg3 != _alternate_b)
            {
                __input_trace("Collision found in profile=", arg4, ", verb=", _verb_b, ", alternate=", _alternate_b);
                input_binding_swap(arg0, arg3, _verb_b, _alternate_b, arg2, arg4);
                input_binding_set(arg0, arg1, arg2, arg3, arg4);
            }
            else
            {
                __input_trace("New binding (", input_binding_get_name(arg1), ") is the same as existing binding for profile=", arg4, ", verb=", arg0, ", alternate=", arg3);
            }
        }
        
        return true;
    }
    else
    {
        __input_trace("Warning! Value isn't a binding, ignoring");
        return false;
    }
}
