testvariablenothing = false;
var _xshake = irandom_range(-10, 10);
var _yshake = irandom_range(-10, 10);
x += _xshake;
y += _yshake;
event_inherited();
x -= _xshake;
y -= _yshake;

if (!go)
{
    get_cams();
    _xshake = irandom_range(-10, 10);
    _yshake = irandom_range(-10, 10);
    var _zoom = 1 - (obj_macro_knives_controller.zoom - 1);
    var _x = (camx + (1920 * _zoom)) - 120;
    draw_sprite_ext(spr_macro_knives_caution, caution_ind, _x + _xshake, y + _yshake, 1, 1, 0, c_white, 1);
}
