var _ymove = sin(time * pi) * 3;
gpu_set_blendmode(bm_add);
var _lenW = lenAdd + (sin(time * 0.3 * pi) * 45);
var _lenH = lenAdd + (sin(time * 0.2 * pi) * 45);
var _amnt = 6;

for (var i = 0; i < _amnt; i++)
{
    var _x = collected_x + (dsin((time * 50) + (60 * i)) * _lenW);
    var _y = collected_y + (dcos((time * 50) + (60 * i)) * _lenH);
    draw_sprite_ext(anim_sprite, anim_index, _x, _y + _ymove, scale, scale, 0, c_white, image_alpha * effect_alpha);
}

gpu_set_blendmode(bm_normal);

if (!out)
    draw_sprite_ext(anim_sprite, anim_index, x, y + _ymove, scale, scale, 0, c_white, image_alpha);
