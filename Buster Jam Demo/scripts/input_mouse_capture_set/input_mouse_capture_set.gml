function input_mouse_capture_set(arg0, arg1 = 1)
{
    static _global = __input_global();
    static _monitor_coords = undefined;
    static _monitor_update_frame = -infinity;
    
    if (!__input_global().__on_desktop || false)
        exit;
    
    if (arg0)
        _global.__mouse_capture_frame = _global.__frame;
    
    _global.__mouse_capture = arg0;
    _global.__mouse_capture_sensitivity = arg1;
    _global.__mouse_capture_blocked = false;
    
    if (!arg0 || window_get_fullscreen())
        exit;
    
    var _window_width = window_get_width();
    var _window_height = window_get_height();
    var _window_x = window_get_x();
    var _window_y = window_get_y();
    
    switch (0)
    {
        case 0:
            if (_monitor_update_frame < _global.__frame)
            {
                _monitor_update_frame = _global.__frame;
                _monitor_coords = window_get_visible_rects(_window_x, _window_y, _window_x + _window_width, _window_y + _window_height);
            }
            
            var _i = 0;
            
            repeat (array_length(_monitor_coords) div 8)
            {
                if (__input_wrap_underflow(_monitor_coords[(_i * 8) + 2]) != 0 && __input_wrap_underflow(_monitor_coords[(_i * 8) + 3]) != 0 && ((__input_wrap_underflow(_monitor_coords[(_i * 8) + 2]) - __input_wrap_underflow(_monitor_coords[_i * 8])) != _window_width || (__input_wrap_underflow(_monitor_coords[(_i * 8) + 3]) - __input_wrap_underflow(_monitor_coords[(_i * 8) + 1])) != _window_height))
                {
                    _global.__mouse_capture_blocked = true;
                    exit;
                }
                
                _i++;
            }
            
            break;
        
        case 1:
            if (_monitor_update_frame < _global.__frame)
            {
                _monitor_update_frame = _global.__frame;
                _monitor_coords = window_get_visible_rects(_window_x, _window_y, _window_x + _window_width, _window_y + _window_height);
            }
            
            if ((_monitor_coords[2] - _monitor_coords[0]) != _window_width || (_monitor_coords[3] - _monitor_coords[1]) != _window_height)
            {
                _global.__mouse_capture_blocked = true;
                exit;
            }
            
            break;
        
        case 6:
            if ((_window_x < 0 || _window_y < 0) || (_window_x < display_get_width() && (_window_x + _window_width) > display_get_width()) || (_window_y < display_get_height() && (_window_y + _window_height) > display_get_height()))
            {
                _global.__mouse_capture_blocked = true;
                exit;
            }
            
            break;
    }
}
