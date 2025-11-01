testvariablenothing = false;

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
event_user(1);
surface_reset_target();
var _amnt = 24;
var _xshake = shake * random_range(-_amnt, _amnt);
var _yshake = shake * random_range(-_amnt, _amnt);
var _w = 1920;
var _h = 1080;
var _x = 0 + ((_w / 2) * (1 - zoom)) + _xshake;
var _y = 0 + ((_h / 2) * (1 - zoom)) + _yshake;
draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
scr_draw_transition_gui();
