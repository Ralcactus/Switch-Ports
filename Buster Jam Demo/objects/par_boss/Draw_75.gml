testvariablenothing = false;

if (!instance_exists(obj_frenzy))
    exit;

var _spotlight;

if (instance_exists(obj_frenzy))
    _spotlight = obj_frenzy.trans_spotlight;
else
    _spotlight = 1;

if (!surface_exists(surf_trans))
    surf_trans = surface_create(1920, 1080);

surface_set_target(surf_trans);

if (games_done)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, 1920, 1080, false);
    draw_set_color(c_white);
}
else
{
    event_user(3);
    scr_draw_transition_gui();
}

gpu_set_blendmode(bm_subtract);
draw_circle_color(960, 540, _spotlight * 1150, c_black, c_black, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();

if (no_blend)
    gpu_set_blendenable(false);

draw_surface(surf_trans, 0, 0);

if (no_blend)
    gpu_set_blendenable(true);

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
