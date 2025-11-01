function input_binding_test_collisions(arg0, arg1, arg2 = 0, arg3 = undefined)
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
    
    if (!input_profile_exists(arg3, arg2))
        __input_error("Profile name \"", arg3, "\" doesn't exist");
    
    if (!input_value_is_binding(arg1))
    {
        __input_error("Value provided is not a binding");
        return undefined;
    }
    
    var _src_group = input_verb_get_group(arg0);
    var _output_array = [];
    
    with (_global.__players[arg2])
    {
        arg3 = __profile_get(arg3);
        
        if (arg3 == undefined)
        {
            __input_trace("Warning! Cannot test binding collisions, profile was <undefined>");
            return _output_array;
        }
        
        var _v = 0;
        
        repeat (array_length(_global.__basic_verb_array))
        {
            var _verb = _global.__basic_verb_array[_v];
            var _group_matches = false;
            
            if (_src_group == undefined)
            {
                _group_matches = true;
            }
            else
            {
                var _dst_group = input_verb_get_group(_verb);
                
                if (_dst_group == undefined)
                    _group_matches = true;
                else
                    _group_matches = _src_group == _dst_group;
            }
            
            if (_group_matches)
            {
                var _alternate_index = 0;
                
                repeat (4)
                {
                    var _extant_binding = __binding_get(arg3, _verb, _alternate_index, false);
                    
                    if (is_struct(_extant_binding))
                    {
                        if (_extant_binding.__label == arg1.__label && (_global.__source_mode != (4 << 0) || _extant_binding.__gamepad_index == arg1.__gamepad_index || _extant_binding.__gamepad_index == undefined || arg1.__gamepad_index == undefined))
                        {
                            array_push(_output_array, 
                            {
                                __verb: _verb,
                                __alternate: _alternate_index
                            });
                        }
                    }
                    
                    _alternate_index++;
                }
            }
            
            _v++;
        }
    }
    
    return _output_array;
}
