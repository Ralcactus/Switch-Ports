get_cams();

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
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
    var _col0 = 1493503;
    var _col1 = 1483007;
    var _list = [_col0, _col1];
    var _col = _list[i % 2];
    draw_set_color(_col);
    draw_triangle(_centerX, _centerY, _x1, _y1, _x2, _y2, false);
}

draw_set_color(c_white);
var _amnt = 12;
var _xshake = shake * random_range(-_amnt, _amnt);
var _yshake = shake * random_range(-_amnt, _amnt);
draw_sprite_ext(spr_cutscene_blackknives_standing, 0, 960 + _xshake, 540 + _yshake, 1.01, 1.01, 0, c_white, 1);
_amnt = 30;
var _logo_xshake = logo_shake * random_range(-_amnt, _amnt);
var _logo_yshake = logo_shake * random_range(-_amnt, _amnt);
draw_sprite_ext(spr_cutscene_blackknives_logo, 0, 960 + _logo_xshake, 960 + _logo_yshake, logo_scale, logo_scale, 0, c_white, logo_alpha);
surface_reset_target();
var _w = 1920;
var _h = 1080;
var _x = camx + ((_w / 2) * (1 - zoom));
var _y = camy + ((_h / 2) * (1 - zoom));
draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
