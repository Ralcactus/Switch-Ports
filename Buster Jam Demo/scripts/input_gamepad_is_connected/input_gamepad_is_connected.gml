function input_gamepad_is_connected(arg0)
{
    static _global = __input_global();
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepad_connections_internal))
        return false;
    
    return _global.__gamepad_connections_internal[arg0];
}
