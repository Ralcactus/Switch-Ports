get_cams(0);
var _strength = 8;
var _x = camx + (x + random_range(-shake * _strength, shake * _strength));
var _y = camy + (y + random_range(-shake * _strength, shake * _strength));
draw_sprite_ext(anim_sprite, anim_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
