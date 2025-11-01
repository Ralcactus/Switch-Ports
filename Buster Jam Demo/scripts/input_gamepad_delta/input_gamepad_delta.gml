function input_gamepad_delta(arg0, arg1)
{
    static _global = __input_global();
    
    if (_global.__cleared || arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__get_delta(arg1);
}
