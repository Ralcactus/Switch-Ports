function input_held_time(arg0, arg1 = 0)
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
    
    var _verb_struct = variable_struct_get(_global.__players[arg1].__verb_state_dict, arg0);
    
    if (!is_struct(_verb_struct))
    {
        __input_error("Verb not recognised (", arg0, ")");
        return undefined;
    }
    
    if (_verb_struct.__inactive || !_verb_struct.__held)
        return -1;
    
    return __input_get_time() - _verb_struct.__press_time;
}
