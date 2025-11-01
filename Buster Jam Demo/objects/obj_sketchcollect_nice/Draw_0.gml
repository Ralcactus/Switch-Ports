var _amnt = 30;
var _xshake = 0;
var _yshake = 0;
_yshake = random_range(-shake * _amnt, shake * _amnt);
draw_sprite(sprite_index, image_index, x + _xshake, y + _yshake);
