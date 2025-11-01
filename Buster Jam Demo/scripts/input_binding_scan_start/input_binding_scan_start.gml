function input_binding_scan_start(arg0, arg1 = undefined, arg2 = 0)
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
    
    if (!is_numeric(arg2) && !is_undefined(arg2))
        __input_error("Usage of input_binding_scan_start() has changed. Please refer to documentation for details");
    
    if (!(is_method(arg0) || (is_numeric(arg0) && script_exists(arg0))))
        __input_error("Binding scan success callback set to an illegal value (typeof=", typeof(arg0), ")");
    
    if (!(is_method(arg1) || (is_numeric(arg1) && script_exists(arg1)) || arg1 == undefined))
        __input_error("Binding scan failure callback set to an illegal value (typeof=", typeof(arg1), ")");
    
    with (_global.__players[arg2])
    {
        __rebind_state = 1;
        __rebind_start_time = _global.__current_time;
        __rebind_success_callback = arg0;
        __rebind_failure_callback = arg1;
        __input_trace("Binding scan started for player ", arg2);
    }
}
