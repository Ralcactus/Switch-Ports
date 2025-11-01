var _yoff = sin(time * pi * 0.015) * 4;
yoff_draw = y + z + _yoff + z_hit;
hueshift += global.delta_game_factor;

if (hueshift > 255)
    hueshift -= hueshift;

hueshift_inside += global.delta_game_factor;

if (hueshift_inside > 255)
    hueshift_inside -= hueshift_inside;

var _col_outside = make_color_hsv(hueshift, 63.75, 255);
var _col_inside = make_color_hsv(hueshift_inside, 204, 178.5);
draw_sprite_ext(spr_map_saveblock, 3, x, yoff_draw, 1, 1, 0, _col_inside, 1);
draw_sprite_ext(spr_map_saveblock, 2, x, yoff_draw, 1, 1, 0, _col_outside, 1);
draw_sprite_ext(spr_map_saveblock, 1, x, yoff_draw, 1, 1, 0, c_white, 1);
