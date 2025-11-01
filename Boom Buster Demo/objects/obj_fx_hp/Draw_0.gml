gpu_set_blendmode(bm_add);
var _amnt = 6;

for (var i = 0; i < _amnt; i++)
{
    var _x = x + (dsin(angle + (60 * i)) * len);
    var _y = y + (dcos(angle + (60 * i)) * len);
    draw_sprite_ext(anim_sprite, anim_index, _x, _y, scale, scale, 0, c_white, effect_alpha);
}

gpu_set_blendmode(bm_normal);
