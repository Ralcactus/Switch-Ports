testvariablenothing = false;
arm_xoff = -470 + arm_x + 108;
arm_yoff = 96;
time += (0.025 * global.delta_game_factor);
var _yoff = sin(pi * time) * 10;
var _yoff_back = sin((pi * time) + 1) * 10;
var _yoff_back1 = sin((pi * time) + 1.5) * 10;
draw_sprite_ext(spr_macro_knives_snake_wrap_back, anim_index, x + arm_xoff, y + arm_yoff + _yoff_back1, 1, 1, 0, c_white, 1);

if (draw_bridget)
    draw_sprite_ext(anim_sprite_bridget, anim_index_bridget, x + arm_xoff, y + arm_yoff + _yoff_back, 1, 1, 0, c_white, 1);

draw_sprite_ext(spr_macro_knives_snake_wrap_front, anim_index, x + arm_xoff, y + arm_yoff + _yoff_back, 1, 1, 0, c_white, 1);
draw_sprite_ext(anim_sprite, anim_index, x, y + _yoff, 1, 1, 0, c_white, 1);
