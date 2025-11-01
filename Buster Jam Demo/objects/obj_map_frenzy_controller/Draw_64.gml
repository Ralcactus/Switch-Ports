testvariablenothing = false;
draw_set_alpha(overlay_white);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);

if (go)
{
    count_percent = approach(count_percent, 1, 0.08);
    var _count_alpha = use_curve(acurv_linear, count_percent, undefined, 0, 1);
    var _scale = use_curve(acurv_linear, count_percent, undefined, 8, 0.75);
    var _ind, _shakeX, _shakeY;
    
    if (count_str == "GO!")
    {
        _shakeX = random_range(-3, 3);
        _shakeY = random_range(-3, 3);
        _scale *= 0.71;
        _ind = 1;
    }
    else
    {
        _ind = 0;
        _shakeX = 0;
        _shakeY = 0;
    }
    
    gpu_set_texfilter(true);
    draw_sprite_ext(spr_frenzy_ready, _ind, 960 + _shakeX, 540 + _shakeY, _scale, _scale, 0, c_white, _count_alpha);
    gpu_set_texfilter(global.texfilter);
}

scr_draw_microgame();

with (obj_microgame_controller)
{
    if (surface_exists(surf_splash))
    {
        var _x = 0;
        var _y = 0;
        var _xscale = splash_scale;
        var _yscale = splash_scale;
        var _yoff = splash_yoff;
        _x += (960 * (1 - _xscale));
        _y += ((540 * (1 - _yscale)) + _yoff);
        draw_surface_ext(surf_splash, _x, _y, splash_scale, splash_scale, 0, c_white, splash_alpha);
    }
}

with (obj_frenzy_speedup)
    event_user(0);

with (obj_frenzy_gameover)
    event_user(2);
