function input_gamepad_get_type(arg0)
{
    static _global = __input_global();
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return "unknown";
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return "unknown";
    
    return _gamepad.__simple_type;
}
