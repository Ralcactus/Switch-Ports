function input_led_pattern_get(arg0)
{
    static _global = __input_global();
    static _led_pattern_unknown = 
    {
        __value: 0,
        __pattern: [],
        __layout: "unknown"
    };
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return _led_pattern_unknown;
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return _led_pattern_unknown;
    
    return _gamepad.__led_pattern ?? _led_pattern_unknown;
}
