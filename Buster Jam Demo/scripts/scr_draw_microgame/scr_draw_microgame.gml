function scr_draw_microgame()
{
    with (obj_microgame_controller)
    {
        if (surface_exists(surf))
        {
            var _scale_extra = scale_res;
            var _scale = _scale_extra * scale_in;
            var _width = game_width * _scale;
            var _height = game_height * _scale;
            var _x = (1920 - _width) / 2;
            var _y = ((1080 - _height) / 2) - 20;
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
            var _max;
            
            if (tear)
                _max = 3;
            else
                _max = 1;
            
            for (var i = 0; i < _max; i++)
            {
                var _xoff;
                
                if (i == 0)
                    _xoff = 0;
                else if (i == 1)
                    _xoff = -1920;
                else if (i == 2)
                    _xoff = 1920;
                
                var _maxY = 1;
                
                if (tear_y)
                    _maxY = 3;
                
                for (var j = 0; j < _maxY; j++)
                {
                    var _yoff;
                    
                    if (j == 0)
                        _yoff = 0;
                    else if (j == 1)
                        _yoff = -1080;
                    else if (j == 2)
                        _yoff = 1080;
                    
                    var _thick = 9;
                    
                    if (scale_in > 0)
                        draw_rectangle((_x - _thick) + _xoff, (_y - _thick) + _yoff, _x + _width + _thick + _xoff, _y + _height + _thick + _yoff, false);
                    
                    var _flipY;
                    
                    if (upside_down)
                    {
                        _flipY = -1;
                        _yoff += (surface_get_height(surf) * _scale);
                    }
                    else
                    {
                        _flipY = 1;
                    }
                    
                    gpu_set_blendenable(false);
                    draw_surface_ext(surf, _x + _xoff, _y + _yoff, _scale, _scale * _flipY, 0, c_white, 1);
                    gpu_set_blendenable(true);
                }
            }
            
            if (has_splash)
            {
                if (!surface_exists(surf_map))
                    surf_map = surface_create(game_width * scale_res, game_height * scale_res);
                
                surface_set_target(surf_map);
                draw_clear_alpha(c_white, 0);
                
                if (splash_alpha_bg >= 1)
                    draw_sprite_ext(spr_micro_splash_bg_w1, splash_bg_ind, 0, 0, 1, 1, 0, c_white, 1);
                
                if (surface_exists(surf_splash))
                {
                    var _xx = 0;
                    var _yy = 0;
                    var _xscale = splash_scale;
                    var _yscale = splash_scale;
                    _xx += (((game_width * scale_res) / 2) * (1 - _xscale));
                    _yy += ((((game_height * scale_res) / 2) * (1 - _yscale)) + splash_yoff);
                    draw_surface_ext(surf_splash, _xx, _yy, splash_scale, splash_scale, 0, c_white, splash_alpha);
                }
                
                surface_reset_target();
                
                if (splash_alpha_bg < 1)
                {
                    draw_sprite_ext(spr_micro_splash_bg_w1, splash_bg_ind, _x, _y, scale_in, scale_in, 0, c_white, splash_alpha_bg);
                    draw_surface_ext(surf_map, _x, _y, scale_in, scale_in, 0, c_white, splash_alpha);
                }
                else
                {
                    gpu_set_blendenable(false);
                    draw_surface_ext(surf_map, _x, _y, scale_in, scale_in, 0, c_white, 1);
                    gpu_set_blendenable(true);
                }
            }
        }
        
        var _draw_timer = true;
        var _alpha = timer_alpha * timer_alpha_override;
        
        if (timer[0] <= (60 * time_bpm_to_seconds(bpm) * 7) && ready && _draw_timer)
        {
            var _timer = (timer[0] / time_start) * 7;
            
            if (_timer <= 3 && _timer >= 0)
            {
                var _ind = _timer;
                draw_sprite_ext(spr_microtimer_count, _ind, 10, 802, 1, 1, 0, c_white, _alpha);
            }
            
            if (_timer <= 1)
            {
                if (_timer <= 0)
                    bom_spr_switch(spr_microtimer_bom_boom);
                else
                    bom_spr_switch(spr_microtimer_bom_edge);
                
                bom_ind += ((sprite_get_speed(bom_spr) / 60) * global.delta_game_factor);
                draw_sprite_ext(bom_spr, bom_ind, 0, 1080, 1, 1, 0, c_white, _alpha);
            }
            else
            {
                var _ind = 7 - _timer;
                draw_sprite_ext(spr_microtimer_fuse, _ind, 0, 1080, 1, 1, 0, c_white, _alpha);
                draw_sprite_ext(spr_microtimer_bom, 0, 0, 1080, 1, 1, 0, c_white, _alpha);
            }
            
            if (_timer <= 7 && _timer >= 1)
            {
                spark_ind += ((sprite_get_speed(spr_microtimer_spark) / 60) * global.delta_game_factor);
                var _ind = floor(_timer);
                
                if (_ind < 0)
                    _ind = 0;
                
                draw_sprite_ext(spr_microtimer_spark, spark_ind, spark_pos[_ind][0], spark_pos[_ind][1], 1, 1, 0, c_white, _alpha);
            }
        }
    }
}
