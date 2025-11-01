function scr_resolution_adapt()
{
    var _width = 1920 * global.window_scale;
    var _height = 1080 * global.window_scale;
    var _monitor_width = display_get_width();
    var _monitor_height = display_get_height();
    
    while (_width < _monitor_width)
    {
        global.window_scale++;
        _width = 1920 * (global.window_scale / 6);
        _height = 1080 * (global.window_scale / 6);
    }
    
    while (_width >= _monitor_width)
    {
        global.window_scale -= 0.16666666666666666;
        _width = 1920 * global.window_scale;
        _height = 1080 * global.window_scale;
    }
    
    global.window_scale_min = 0.6666666666666667;
    global.window_scale_max = global.window_scale;
    var _w = round(1920 * global.window_scale);
    
    if (_w > display_get_width())
        _w = display_get_width();
    
    var _h = round(1080 * global.window_scale);
    
    if (_h > display_get_height())
        _h = display_get_height();
    
    window_set_size(_w, _h);
    window_center();
}
