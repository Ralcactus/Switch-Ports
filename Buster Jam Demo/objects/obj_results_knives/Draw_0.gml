testvariablenothing = false;
draw_sprite(spr_results_knives_bg, 0, 0, 0);
var _centerX = 968;
var _centerY = 520;
var _radius = 1500;
var _segments = 14;
var segment_angle = 360 / _segments;

for (var i = 0; i < _segments; i++)
{
    var _angle_start = (i * segment_angle) + rot;
    var _angle_end = ((i + 1) * segment_angle) + rot;
    var _x1 = _centerX + lengthdir_x(_radius, _angle_start);
    var _y1 = _centerY + lengthdir_y(_radius, _angle_start);
    var _x2 = _centerX + lengthdir_x(_radius, _angle_end);
    var _y2 = _centerY + lengthdir_y(_radius, _angle_end);
    var _col0 = 16777215;
    var _col1 = 16777215;
    var _list = [_col0, _col1];
    var _alphas = [0.08, 0];
    var _col = _list[i % 2];
    draw_set_alpha(_alphas[i % 2]);
    draw_set_color(_col);
    draw_triangle(_centerX, _centerY, _x1, _y1, _x2, _y2, false);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite(spr_results_knives_floor, 0, 0, 0);
draw_sprite(spr_results_knives_chars, 0, 0, 0);
