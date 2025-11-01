testvariablenothing = false;
var _amnt = 24;
var _xshake = irandom_range(-shake * _amnt, shake * _amnt);
var _yshake = irandom_range(-shake * _amnt, shake * _amnt);
shake = approach(shake, 0, 1/30);
draw_sprite_ext(anim_sprite, anim_index, x + _xshake, y + _yshake, 1, 1, 0, c_white, 1);
