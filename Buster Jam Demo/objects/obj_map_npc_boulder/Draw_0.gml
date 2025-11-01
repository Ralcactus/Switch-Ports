testvariablenothing = false;
var _amnt = 6;
var _xshake = irandom_range(-shake * _amnt, shake * _amnt);
var _yshake = irandom_range(-shake * _amnt, shake * _amnt);
draw_sprite_ext(anim_sprite, anim_index, x + _xshake, y + z + _yshake, 1, 1, 0, c_white, image_alpha);
