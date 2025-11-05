var _yoff = 0;
var _xoff = 0;

if (sprite_index == spr_jumpcloud)
{
    _yoff = 40 * abs(angle_difference(0, image_angle) / 180);
    _xoff = (64 * angle_difference(0, image_angle)) / 180;
}

var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
draw_sprite_billboard_ext(sprite_index, image_index, x + _xoff, y + _yoff, depth, image_xscale, image_yscale, image_angle, _lightcol, image_alpha, false);
