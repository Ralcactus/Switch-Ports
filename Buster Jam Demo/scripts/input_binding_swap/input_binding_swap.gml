function input_binding_swap(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = undefined)
{
    static _global = __input_global();
    
    if (arg4 < 0)
    {
        __input_error("Invalid player index provided (", arg4, ")");
        return undefined;
    }
    
    if (arg4 >= 2)
    {
        __input_error("Player index too large (", arg4, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (!input_profile_exists(arg5, arg4))
        __input_error("Profile name \"", arg5, "\" doesn't exist");
    
    var _binding_a = input_binding_get(arg0, arg4, arg1, arg5);
    var _binding_b = input_binding_get(arg2, arg4, arg3, arg5);
    
    if (_binding_b == undefined)
        input_binding_remove(arg0, arg4, arg1, arg5);
    else
        input_binding_set(arg0, _binding_b, arg4, arg1, arg5);
    
    if (_binding_a == undefined)
        input_binding_remove(arg2, arg4, arg3, arg5);
    else
        input_binding_set(arg2, _binding_a, arg4, arg3, arg5);
}
