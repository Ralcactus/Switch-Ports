testvariablenothing = false;
var _skew = skew;
draw_rectangle_color(0, -_skew + y, 1920, (1080 - _skew) + y, c_black, c_black, c_black, c_black, false);
draw_triangle_color(0, 1080 + y, 0, y, 1920, (1080 - _skew) + y, c_black, 0, 0, false);
draw_triangle_color(0, (-1080 - _skew) + 1080 + y, 1920, (-1080 - _skew) + 1080 + y, 1920, (((-1080 - _skew) + 1080) - _skew) + y, c_black, 0, 0, false);

if (state >= 2)
    scr_draw_transition_gui();

with (obj_frenzy_gameover)
    event_user(2);
