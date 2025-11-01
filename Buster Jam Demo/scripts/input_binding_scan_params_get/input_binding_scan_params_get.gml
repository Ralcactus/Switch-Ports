function input_binding_scan_params_get(arg0 = 0)
{
    static _global = __input_global();
    
    if (arg0 < 0)
    {
        __input_error("Invalid player index provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 >= 2)
    {
        __input_error("Player index too large (", arg0, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with (_global.__players[arg0])
    {
        return 
        {
            __ignore_array: is_struct(__rebind_ignore_struct) ? variable_struct_get_names(__rebind_ignore_struct) : undefined,
            __allow_array: is_struct(__rebind_allow_struct) ? variable_struct_get_names(__rebind_allow_struct) : undefined,
            __source_filter: __rebind_source_filter
        };
    }
}
