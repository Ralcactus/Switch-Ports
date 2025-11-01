testvariablenothing = false;
event_inherited();
var _w = 1920;
var _h = 1080;
var _x = x + ((_w / 2) * (1 - zoom));
var _y = y + ((_h / 2) * (1 - zoom));

if (out)
{
    var _amnt = 12;
    var _xshake = shake * random_range(-_amnt, _amnt);
    var _yshake = shake * random_range(-_amnt, _amnt);
    draw_sprite_ext(spr_macro_knives_boss_intro, 0, 960, 1080 + y, 1.01, 1.01, 0, c_white, 1);
}
else
{
    draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
}
