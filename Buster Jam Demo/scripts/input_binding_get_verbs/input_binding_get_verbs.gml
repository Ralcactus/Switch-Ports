function input_binding_get_verbs(arg0, arg1 = 0, arg2 = undefined)
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
    
    if (!input_profile_exists(arg2, arg1))
        __input_error("Profile name \"", arg2, "\" doesn't exist");
    
    if (!input_value_is_binding(arg0))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    var _output_array = [];
    
    with (_global.__players[arg1])
    {
        arg2 = __profile_get(arg2);
        
        if (arg2 == undefined)
        {
            __input_trace("Warning! Cannot get verbs from binding, profile was <undefined>");
            return _output_array;
        }
        
        var _v = 0;
        
        repeat (array_length(_global.__basic_verb_array))
        {
            var _verb = _global.__basic_verb_array[_v];
            var _alternate_index = 0;
            
            repeat (4)
            {
                var _extant_binding = __binding_get(arg2, _verb, _alternate_index, false);
                
                if (is_struct(_extant_binding) && _extant_binding.__label == arg0.__label)
                {
                    array_push(_output_array, 
                    {
                        __verb: _verb,
                        __alternate: _alternate_index
                    });
                }
                
                _alternate_index++;
            }
            
            _v++;
        }
    }
    
    return _output_array;
}
