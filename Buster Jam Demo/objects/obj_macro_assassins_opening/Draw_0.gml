testvariablenothing = false;

if (shot == 0)
    draw_sprite_ext(spr_macro_knives_shots, 0, 0, 0, 1, 1, 0, c_white, 1);
else if (shot == 1 || shot == 2)
    draw_sprite_ext(spr_macro_knives_shots, 1, 0, 0, 1, 1, 0, c_white, 1);
else if (shot == 2 || shot == 3)
    draw_sprite_ext(spr_macro_knives_shots, 2, 0, 0, 1, 1, 0, c_white, 1);

var _barH = 150 * bars_in;
draw_rectangle_color(0, 0, 1920, _barH, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 1080, 1920, 1080 - _barH, c_black, c_black, c_black, c_black, false);

if (move_bars)
    bars_in = easy_smooth(bars_in, 1, 2);
else
    bars_in = 0;
