var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);

if ((sprite_index == spr_frogplat_firestart && image_index == 3) || sprite_index == spr_frogplat_fire)
    _lightcol = image_blend;

draw_sprite_billboard_ext(sprite_index, image_index, x, y, z, image_xscale, image_yscale, image_angle, _lightcol, image_alpha, false);
