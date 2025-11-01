var _scale = 1;
var _amnt = 8;
var _xshake = random_range(-shake * _amnt, shake * _amnt);
var _yshake = random_range(-shake * _amnt, shake * _amnt);
draw_sprite_ext(anim_sprite, anim_index, x + _xshake, y + _yshake + z, _scale * facing, _scale, 0, c_white, 1);
