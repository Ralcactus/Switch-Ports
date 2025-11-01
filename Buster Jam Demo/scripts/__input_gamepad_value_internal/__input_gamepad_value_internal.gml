function __input_gamepad_value_internal(arg0, arg1)
{
    static _global = __input_global();
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return 0;
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__get_value(arg1);
}
