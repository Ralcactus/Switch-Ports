var _shakex = 0;
var _shakey = 0;

if (!active)
{
    _shakex = irandom_range(-4, 4);
    _shakey = irandom_range(-4, 4);
}

draw_sprite_ext(sprite_index, image_index, x + _shakex, y + _shakey, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(spr_pumpkinface, face, x + _shakex, y + _shakey, image_xscale, image_yscale, 0, c_white, 1);
