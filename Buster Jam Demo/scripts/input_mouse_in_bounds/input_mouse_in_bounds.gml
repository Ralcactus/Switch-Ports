function input_mouse_in_bounds()
{
    static _global = __input_global();
    
    var _mx = display_mouse_get_x() - window_get_x();
    var _my = display_mouse_get_y() - window_get_y();
    return !(_mx < 0 || _mx >= window_get_width() || _my < 0 || _my >= window_get_height());
}
