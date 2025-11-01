function input_source_detect_new()
{
    static _global = __input_global();
    
    var _gamepad_count = array_length(__input_global().__source_gamepad);
    var _sort_order = 1;
    var _g = 0;
    
    if (1 && (false || (!_global.__using_steamworks && true) || (_global.__using_steamworks && false)))
    {
        _sort_order = -1;
        _g = _gamepad_count - 1;
    }
    
    repeat (_gamepad_count)
    {
        if (input_source_detect_input(__input_global().__source_gamepad[_g]))
            return __input_global().__source_gamepad[_g];
        
        _g += _sort_order;
    }
    
    if (input_source_detect_input(__input_global().__source_keyboard))
        return __input_global().__source_keyboard;
    
    if (input_source_detect_input(__input_global().__source_mouse))
        return __input_global().__source_mouse;
    
    if (input_source_detect_input(__input_global().__source_touch))
        return __input_global().__source_touch;
    
    return undefined;
}
