var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _lightcol, image_alpha);
