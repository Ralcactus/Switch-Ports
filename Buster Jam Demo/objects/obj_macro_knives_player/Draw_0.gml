testvariablenothing = false;
var _yscale = 1;

if (side_flip && side_to == -1)
    depth = layer_get_depth(layer_get_id("PlayerBehind"));
else
    depth = layer_get_depth(layer_get_id("Player"));

var _yoff;

if (side == -1)
{
    _yoff = -2;
}
else
{
    _yoff = down_yoff + 12;
    _yscale = -1;
}

var _catch_yoff = catch_ymove * 32;
var _amnt = 45;
var _xshake = irandom_range(-shake * _amnt, shake * _amnt);
var _yshake = irandom_range(-shake * _amnt, shake * _amnt);
var _flip_yoff = flip_yoff;

if (side_to == -1)
    _flip_yoff *= -1;

draw_sprite_ext(anim_sprite, anim_index, x + _xshake, y + (_yoff / 2) + _flip_yoff + _catch_yoff + _yshake, facing * image_xscale, _yscale, 0, c_white, image_alpha);
