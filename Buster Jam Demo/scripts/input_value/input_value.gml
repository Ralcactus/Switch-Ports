function input_value(arg0, arg1 = 0)
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
    
    if (is_array(arg0))
    {
        var _sum = 0;
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            _sum += input_value(arg0[_i], arg1);
            _i++;
        }
        
        return _sum;
    }
    
    var _verb_struct = variable_struct_get(_global.__players[arg1].__verb_state_dict, arg0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", arg0, ")");
        return undefined;
    }
    
    if (_verb_struct.__inactive)
        return false;
    
    return _verb_struct.__value;
}
