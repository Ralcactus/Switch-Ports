function input_mouse_check_released(arg0)
{
    static _global = __input_global();
    
    if (!_global.__mouse_allowed || !_global.__game_input_allowed || _global.__window_focus_block_mouse || _global.__cleared)
        return arg0 == 0;
    
    if (!(arg0 == 1 || arg0 == -1 || arg0 == 0))
        return device_mouse_check_button_released(0, arg0);
    
    var _left = false;
    
    if (_global.__pointer_index_previous == 0)
        _left = device_mouse_check_button_released(0, mb_left);
    else
        _left = _global.__pointer_released;
    
    if (_global.__tap_click)
        _left = true;
    
    switch (arg0)
    {
        case 0:
            return !_left && device_mouse_check_button_released(0, mb_none);
            break;
        
        case -1:
            return _left || device_mouse_check_button_released(0, mb_any);
            break;
        
        case 1:
            return _left;
            break;
    }
    
    __input_error("Mouse button out of range (", arg0, ")");
    return false;
}
