if (!draw_me)
    exit;

var _amnt = shake_strength;
var _xshake = shake * random_range(-_amnt, _amnt);
var _yshake = shake * random_range(-_amnt, _amnt);
squish = easy_smooth(squish, 0, 1.5);
var _xscale = 1 + (0.3 * squish);
var _yscale = 1 - (0.3 * squish);
draw_sprite_ext(anim_sprite, anim_index, x + _xshake, y + _yshake + z, facing * _xscale, 1 * _yscale, 0, image_blend, image_alpha);
