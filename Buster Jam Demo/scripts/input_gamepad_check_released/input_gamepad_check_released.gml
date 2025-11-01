function input_gamepad_check_released(arg0, arg1)
{
    static _global = __input_global();
    
    if (!_global.__game_input_allowed || !_global.__gamepad_allowed || _global.__cleared || arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return false;
    
    return _gamepad.__get_released(arg1);
}
