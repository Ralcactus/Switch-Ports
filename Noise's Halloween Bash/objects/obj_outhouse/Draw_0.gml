if (id != obj_player.currcheckpoint.id)
    exit;

var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
draw_sprite_3d_ext(flagspr, flagind, x, y, z + 10, 1, 1, 0, _lightcol, 1);
