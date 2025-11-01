draw_set_font(fnt_editor);
var _scale;

if (out)
    _scale = out_scale;
else
    _scale = 1;

scale_out = _scale;

if (instance_exists(par_boss))
    _scale = 1;

draw_reset_clip();

if (surface_exists(surf))
{
    var _x = x;
    var _y = y;
    var _out_scale = out_scale;
    var _surf_alpha = surf_alpha;
    
    if (!trans)
    {
        _out_scale = 1;
        _surf_alpha = 1;
    }
    
    if (instance_exists(par_boss))
        _out_scale = 1;
    
    var _xscale = xscale * scale * _out_scale;
    var _yscale = yscale * scale * _out_scale;
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
            
            if (!_out && !fullscreen && scale_in)
                draw_rectangle_color(_x - 13 - _xoff, (_y - 13) + _yoff, (_x2 + 13) - _xoff, _y2 + 13 + _yoff, outline_col, outline_col, outline_col, outline_col, false);
            
            if (!_out)
                gpu_set_blendenable(false);
            
            draw_set_spotlight(960, 540, 1150 * out_scale);
            draw_surface_ext(surf, _x - _xoff, _y + _yoff, _xscale, _yscale, angle, c_white, _surf_alpha);
            draw_reset_clip();
            
            if (!_out)
                gpu_set_blendenable(true);
        }
    }
    
    if (!surface_exists(surf_timer))
        surf_timer = surface_create(1920, 1080);
    
    surface_set_target(surf_timer);
    draw_clear_alpha(c_lime, 0);
    var _timer = (timer[0] / time_start) * 7;
    
    if (_timer < 0)
        _timer = 0;
    
    spark_xTo = path_get_point_x(pth_timer, 7 - min(_timer, 7));
    spark_yTo = path_get_point_y(pth_timer, 7 - min(_timer, 7));
    spark_x = easy_smooth(spark_x, spark_xTo, 2);
    spark_y = easy_smooth(spark_y, spark_yTo, 2);
    
    if (_timer >= 1)
    {
        _spr = spr_timer_fuse;
        
        if (_timer > 7)
        {
            _ind = 0;
            _spr = spr_timer_fuse_full;
        }
        else
        {
            _ind = 7 - _timer;
        }
        
        if (_ind < 0)
            _ind = 0;
        
        if (_timer > 7)
            timer_alpha_override = 0;
        else
            timer_alpha_override = 1;
        
        draw_sprite_ext(_spr, _ind, 0, 1080 - sprite_get_height(_spr), 1, 1, 0, c_white, timer_alpha * timer_alpha_override);
        
        if (_timer <= 7)
            draw_sprite_ext(spr_timer_spark, time * 4, spark_x, spark_y, 1, 1, 0, c_white, timer_alpha * timer_alpha_override);
    }
    
    if (last_timer > 1 && _timer > 0 && _timer <= 1)
        bom_shake = 1;
    else if (last_timer > 0 && _timer <= 0)
        bom_shake = 2;
    
    last_timer = _timer;
    var _shakeX, _shakeY;
    
    if (_timer <= 0)
    {
        _shakeX = bom_shake * irandom_range(-10, 0);
        _shakeY = bom_shake * irandom_range(0, 10);
    }
    else
    {
        _shakeX = bom_shake * irandom_range(-10, 10);
        _shakeY = bom_shake * irandom_range(-10, 10);
    }
    
    var _spr = spr_timer_bom;
    var _ind = 0;
    
    if (_timer <= 0)
    {
        _spr = spr_timer_bom_explode;
    }
    else if (_timer <= 1)
    {
        _ind = 2;
        draw_sprite_ext(spr_timer_spark_top, time * 4, _shakeX, (_shakeY + 1080) - sprite_get_height(spr_timer_fuse), 1, 1, 0, c_white, timer_alpha * timer_alpha_override);
    }
    else if (_timer > 7)
    {
        _ind = 1;
    }
    
    if (_spr == spr_timer_bom_explode)
        draw_sprite_ext(spr_timer_bom_explode, 0, 0 + _shakeX, 687 + _shakeY, 1, 1, 0, c_white, _surf_alpha * timer_alpha_override);
    else
        draw_sprite_ext(_spr, _ind, _shakeX, 768 + _shakeY, 1, 1, 0, c_white, timer_alpha * timer_alpha_override);
    
    surface_reset_target();
    var _xoff = 0;
    
    if (global.multiplayer)
        _scale = 0.5;
    else
        _scale = 0.7;
    
    var _facing = 1;
    
    if (player == 1)
    {
        _facing = -1;
        _xoff = 1920;
    }
    
    draw_surface_ext(surf_timer, 0 + _xoff, 1080 - (1080 * _scale), _scale * _facing, _scale, 0, c_white, 1);
}
