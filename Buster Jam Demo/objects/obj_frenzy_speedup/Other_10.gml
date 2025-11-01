var _scale;

if (sprite_index == spr_frenzy_lastone)
    _scale = 0.78;
else
    _scale = 1;

gpu_set_texfilter(true);
draw_sprite_ext(sprite_index, 0, x + 960, y + 540, xscale * _scale, yscale * _scale, 0, c_white, 1);
gpu_set_texfilter(global.texfilter);
