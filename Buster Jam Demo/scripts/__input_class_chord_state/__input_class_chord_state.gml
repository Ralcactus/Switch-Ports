function __input_class_chord_state(arg0, arg1) constructor
{
    static __evaluate = function(arg0)
    {
        var _verb_array = __definition_struct.__verb_array;
        var _verb_count = array_length(_verb_array);
        
        switch (__state)
        {
            case 0:
                var _i = 0;
                
                repeat (_verb_count)
                {
                    if (variable_struct_get(arg0, array_get(_verb_array, _i)).__held)
                    {
                        __start_time = __input_get_time();
                        __state = 1;
                        return __evaluate(arg0);
                    }
                    
                    _i++;
                }
                
                return false;
                break;
            
            case 1:
                if ((__input_get_time() - __start_time) > __definition_struct.__max_time_between_presses)
                {
                    __state = 3;
                    return false;
                }
                
                var _i = 0;
                
                repeat (_verb_count)
                {
                    if (!variable_struct_get(arg0, array_get(_verb_array, _i)).__held)
                        return false;
                    
                    _i++;
                }
                
                __state = 2;
                return true;
                break;
            
            case 2:
                var _i = 0;
                
                repeat (_verb_count)
                {
                    if (!variable_struct_get(arg0, array_get(_verb_array, _i)).__held)
                    {
                        __state = 3;
                        return false;
                    }
                    
                    _i++;
                }
                
                return true;
                break;
            
            case 3:
                var _i = 0;
                
                repeat (_verb_count)
                {
                    if (variable_struct_get(arg0, array_get(_verb_array, _i)).__held)
                        return false;
                    
                    _i++;
                }
                
                __start_time = infinity;
                __state = 0;
                return false;
                break;
            
            default:
                __input_error("State \"", __state, "\" not recognised");
                break;
        }
    };
    
    __name = arg0;
    __definition_struct = arg1;
    __start_time = infinity;
    __state = 0;
}
