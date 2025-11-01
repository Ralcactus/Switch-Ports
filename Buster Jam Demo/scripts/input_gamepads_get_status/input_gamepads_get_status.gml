function input_gamepads_get_status()
{
    static _global = __input_global();
    
    return _global.__gamepads_status;
}
