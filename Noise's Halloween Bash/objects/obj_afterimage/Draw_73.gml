var _yoff = 0;
var _xoff = 0;
_yoff = 40 * abs(angle_difference(0, image_angle) / 180);
_xoff = (64 * angle_difference(0, image_angle)) / 180;
draw_sprite_billboard_ext(sprite_index, image_index, x + _xoff, y + _yoff, depth, image_xscale, image_yscale, image_angle, image_blend, image_alpha, true);
