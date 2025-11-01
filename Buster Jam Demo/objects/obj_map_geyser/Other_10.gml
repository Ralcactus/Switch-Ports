testvariablenothing = false;
get_cams();
x = (camx + 960) - 96;
var _h = sprite_get_height(spr_geyser);
geyser_y += (16 * global.delta_game_factor);

if (geyser_y >= _h)
    geyser_y -= _h;

var _ringH = sprite_get_height(spr_geyser_ring_front);
ring_y += (4 * global.delta_game_factor);

if (ring_y >= _ringH)
    ring_y -= _ringH;

var _yoff = 0;

for (var i = 0; i < 8; i++)
{
    draw_sprite_ext(spr_geyser_ring_back, 0, x, (y + _yoff) - ring_y, 1, 1, 0, c_white, 1);
    _yoff += _ringH;
}

_yoff = 0;
var _min = 0.2;
var _max = 0.6;
var _xscale0 = 4 + (sin(time) * _max);
var _xscale1 = 3 + (sin(time) * ((_max - _min) / 2));
var _xscale2 = 1.8 + (sin(time) * _min);
var _w = sprite_get_width(spr_geyser);

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * (_xscale0 - 1)), (y + _yoff) - geyser_y, _xscale0, 1, 0, c_white, 0.18);
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * (_xscale1 - 1)), (y + _yoff) - geyser_y, _xscale1, 1, 0, c_white, 0.1);
    gpu_set_blendmode(bm_normal);
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * (_xscale1 - 1)), (y + _yoff) - geyser_y, _xscale1, 1, 0, c_white, 0.3);
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * (_xscale2 - 1)), (y + _yoff) - geyser_y, _xscale2, 1, 0, c_white, 0.5);
    draw_sprite_ext(spr_geyser, 0, x, (y + _yoff) - geyser_y, 1, 1, 0, c_white, 1);
    _yoff += _h;
}

_yoff = 0;

for (var i = 0; i < 8; i++)
{
    draw_sprite_ext(spr_geyser_ring_front, 0, x, (y + _yoff) - ring_y, 1, 1, 0, c_white, 1);
    _yoff += _ringH;
}

_yoff = 0;
var _xscale = 25;
shader_set(sha_flash);

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * ((_xscale * flash_alpha) - 1)), (y + _yoff) - geyser_y, _xscale * flash_alpha, 1, 0, c_white, flash_alpha * 0.5);
    draw_sprite_ext(spr_geyser, 0, x - ((_w / 2) * (((_xscale * flash_alpha) / 2) - 1)), (y + _yoff) - geyser_y, (_xscale * flash_alpha) / 2, 1, 0, c_white, flash_alpha * 1);
    _yoff += _h;
}

shader_reset();
