if (!surface_exists(surf_final))
    surf_final = surface_create(1920, 1080);

surface_set_target(surf_final);
draw_clear_alpha(c_white, 0);

if (surface_exists(surf))
{
    var _x = x;
    var _y = y;
    var _outscale;
    
    if (scale_trans)
        _outscale = out_scale;
    else
        _outscale = 1;
    
    var _xscale = xscale * scale * _outscale;
    var _yscale = yscale * scale * _outscale;
    _x += ((game_width / 2) * (1 - _xscale));
    _y += ((game_height / 2) * (1 - _yscale));
    _x += xmove;
    _y += ymove;
    _x += scroll_x;
    _y += bounce_y;
    _x += jumpcut_x;
    _y += jumpcut_y;
    
    if (jumpcut_xrange != 0 || jumpcut_yrange != 0)
    {
        _x += random_range(-2, 2);
        _y += random_range(-2, 2);
    }
    
    var _amnt = 40;
    _x += random_range(-jumpcut_off * _amnt, jumpcut_off * _amnt);
    _y += random_range(-jumpcut_off * _amnt, jumpcut_off * _amnt);
    _x += random_range(-shake, shake);
    _y += random_range(-shake, shake);
    var _x2 = _x + (game_width * _xscale);
    var _y2 = _y + (game_height * _yscale);
    var _out = out;
    
    if (instance_exists(obj_frenzy))
        _out = false;
    
    if (instance_exists(obj_boss_tutorial))
        _out = false;
    
    var _max;
    
    if (tear)
        _max = 3;
    else
        _max = 1;
    
    for (var ii = 0; ii < _max; ii++)
    {
        var _xoff;
        
        if (ii == 0)
            _xoff = 0;
        else if (ii == 1)
            _xoff = -1920;
        else if (ii == 2)
            _xoff = 1920;
        
        var _maxY = 1;
        
        if (tear_y)
            _maxY = 3;
        
        for (var jj = 0; jj < _maxY; jj++)
        {
            var _yoff;
            
            if (jj == 0)
                _yoff = 0;
            else if (jj == 1)
                _yoff = -1080;
            else if (jj == 2)
                _yoff = 1080;
            
            if (!_out && !fullscreen)
                draw_rectangle_color(_x - 13 - _xoff, (_y - 13) + _yoff, (_x2 + 13) - _xoff, _y2 + 13 + _yoff, outline_col, outline_col, outline_col, outline_col, false);
            
            if (!_out)
                gpu_set_blendenable(false);
            
            draw_surface_ext(surf, _x - _xoff, _y + _yoff, _xscale, _yscale, angle, c_white, 1);
            
            if (!_out)
                gpu_set_blendenable(true);
        }
    }
}

surface_reset_target();
