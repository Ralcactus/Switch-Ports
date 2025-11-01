function input_profile_verify(arg0, arg1, arg2 = 0)
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
    
    var _backup = input_profile_export(arg1, arg2, false);
    var _error = undefined;
    
    try
    {
        _global.__players[arg2].__profile_import(arg0, arg1);
    }
    catch (_error)
    {
        __input_trace("input_profile_verify() failed with the following error: ", _error);
    }
    
    input_profile_import(_backup, arg1, arg2);
    return _error == undefined;
}
