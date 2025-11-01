function input_check_press_most_recent(arg0 = -3, arg1 = 0)
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
    
    var _verbs_struct = _global.__players[arg1].__verb_state_dict;
    
    if (!is_array(arg0))
        arg0 = _global.__basic_verb_array;
    
    var _max_time = -1;
    var _max_verb = undefined;
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        var _verb = arg0[_i];
        var _verb_struct = variable_struct_get(_verbs_struct, _verb);
        
        if (_verb_struct.__press_time > _max_time && input_check(_verb, arg1))
        {
            _max_time = _verb_struct.__press_time;
            _max_verb = _verb;
        }
        
        _i++;
    }
    
    return _max_verb;
}
