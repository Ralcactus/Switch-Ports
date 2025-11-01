function input_check(arg0, arg1 = 0, arg2 = 0)
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
    
    if (arg0 == -3)
        return input_check(_global.__basic_verb_array, arg1, arg2);
    
    if (is_array(arg0))
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            if (input_check(arg0[_i], arg1, arg2))
                return true;
            
            _i++;
        }
        
        return false;
    }
    
    var _verb_struct = variable_struct_get(_global.__players[arg1].__verb_state_dict, arg0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", arg0, ")");
        return undefined;
    }
    
    if (_verb_struct.__inactive)
        return false;
    
    if (arg2 <= 0)
        return _verb_struct.__held;
    else
        return _verb_struct.__held_time >= 0 && (__input_get_time() - _verb_struct.__held_time) <= arg2;
}
