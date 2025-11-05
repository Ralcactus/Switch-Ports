var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
draw_sprite_3d_ext(spr_endplatflag, flagind, flagLx, flagLy, depth + 18, 1, 1, 0, _lightcol, 1);
draw_sprite_3d_ext(spr_endplatflag, flagind, flagRx, flagRy, depth + 18, -1, 1, 0, _lightcol, 1);
draw_sprite_ext(spr_endplatshoe, leftshoeind, x - 43, y - 12, 1, 1, 0, _lightcol, 1);
draw_sprite_ext(spr_endplatshoe, rightshoeind, x + 43, y - 12, -1, 1, 0, _lightcol, 1);
