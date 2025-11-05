var _xoff = 0;
var _yoff = 0;

if (hitstuntime > 0)
{
    _xoff = irandom_range(-3, 3);
    _yoff = irandom_range(-3, 3);
}

var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
draw_sprite_billboard_ext(sprite_index, image_index, x + _xoff, y + _yoff, depth, image_xscale, image_yscale, image_angle, _lightcol, image_alpha, false);
