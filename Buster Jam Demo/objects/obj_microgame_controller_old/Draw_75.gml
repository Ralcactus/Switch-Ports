if (instance_exists(par_boss))
{
    event_user(2);
    var _x = 0;
    var _y = 0;
    var _xscale = splash_scale;
    var _yscale = splash_scale;
    _x += (960 * (1 - _xscale));
    _y += (540 * (1 - _yscale));
    draw_surface_ext(surf_splash, _x, _y, splash_scale, splash_scale, angle, c_white, splash_alpha);
}
