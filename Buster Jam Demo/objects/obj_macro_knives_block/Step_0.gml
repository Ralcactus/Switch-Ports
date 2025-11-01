testvariablenothing = false;
event_inherited();
time += (0.03 * global.delta_game_factor * 100);
turnX -= 0.015;
get_cams();
var _amnt = 0.16;
var _amnt_yoff = 0;
turnY_yoff = easy_smooth(turnY_yoff, obj_macro_knives_controller.side * _amnt_yoff, 4);
turnY = (_amnt * side) - turnY_yoff;
