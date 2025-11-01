function input_verb_consume(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 == -3)
    {
        var _i = 0;
        
        repeat (2)
        {
            input_verb_consume(arg0, _i);
            _i++;
        }
        
        exit;
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
    
    if (arg0 == -3)
    {
        var _verb_names = variable_struct_get_names(_global.__players[arg1].__verb_state_dict);
        var _v = 0;
        
        repeat (array_length(_verb_names))
        {
            input_verb_consume(_verb_names[_v], arg1);
            _v++;
        }
    }
    else if (is_array(arg0))
    {
        var _v = 0;
        
        repeat (array_length(arg0))
        {
            input_verb_consume(arg0[_v], arg1);
            _v++;
        }
    }
    else
    {
        var _verb_struct = variable_struct_get(_global.__players[arg1].__verb_state_dict, arg0);
        
        if (!is_struct(_verb_struct))
        {
            __input_error("Verb not recognised (", arg0, ")");
            return undefined;
        }
        
        with (_verb_struct)
        {
            __consumed = true;
            __previous_held = true;
            __inactive = true;
            __toggle_state = false;
        }
    }
}
