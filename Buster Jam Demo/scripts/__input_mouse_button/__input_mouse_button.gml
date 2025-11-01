function __input_mouse_button()
{
    static _global = __input_global();
    
    if (!_global.__mouse_allowed || !_global.__game_input_allowed || _global.__window_focus_block_mouse)
        return 0;
    
    if (_global.__pointer_index > 0)
    {
        if (device_mouse_check_button(_global.__pointer_index, mb_left))
            return 1;
    }
    else if (__input_global().__on_desktop && 1)
    {
        if (mouse_button != mb_none)
            return mouse_button;
        
        if (_global.__tap_click)
            return 1;
    }
    else
    {
        if (device_mouse_check_button(0, 5))
            return 5;
        
        if (device_mouse_check_button(0, 4))
            return 4;
        
        if (device_mouse_check_button(0, mb_middle))
            return 3;
        
        if (device_mouse_check_button(0, mb_right))
            return 2;
        
        if (device_mouse_check_button(0, mb_left))
            return 1;
    }
    
    return 0;
}
