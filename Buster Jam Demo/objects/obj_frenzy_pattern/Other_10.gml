var _extraW = 140;
var _extraH = 250;
var _surfW = 1920 + _extraW;
var _surfH = 1080 + _extraH;
var _barYoff = -20;

if (!surface_exists(surf))
    surf = surface_create(_surfW, _surfH);

surface_set_target(surf);
draw_clear_alpha(c_lime, 0);
var _w = sprite_get_width(sprite_index);
var _h = sprite_get_height(sprite_index);

for (var i = 0; i < 14; i++)
{
    draw_sprite(sprite_index, 0, (pattern_bar_x + (_w * i)) - _w, (0 - (bars_out * _h) - 130) + _barYoff);
    draw_sprite(sprite_index, 1, -pattern_bar_x + (_w * i), ((_surfH - _h) + (bars_out * _h) + 130) - _barYoff);
}

surface_reset_target();

if (!surface_exists(surf_back))
    surf_back = surface_create(_surfW, _surfH);

surface_set_target(surf_back);
draw_clear_alpha(c_lime, 0);
var _yoff = 30;

for (var i = 0; i < 14; i++)
{
    draw_sprite(sprite_index, 2, (pattern_bar_x_back + (_w * i)) - _w, (0 - (bars_out * _h) - 130) + _barYoff + _yoff);
    draw_sprite(sprite_index, 3, -pattern_bar_x_back + (_w * i), ((_surfH - _h) + (bars_out * _h) + 130) - _barYoff - _yoff);
}

surface_reset_target();
var _angle;

if (room == rm_win_screen)
    _angle = -8;
else
    _angle = 4;

var _c = dcos(_angle);
var _s = dsin(_angle);
var _x = _surfW / 2;
var _y = _surfH / 2;

if (instance_exists(obj_map_frenzy_controller))
    _zoom = obj_map_frenzy_controller.zoom;
else
    _zoom = 1;

var _zoom = 1;
var _zoomX = ((_zoom - 1) * 1920) / 2;
var _zoomY = ((_zoom - 1) * 1080) / 2;
draw_surface_ext(surf_back, (((0 + _zoomX) - (_extraW / 2)) + (_surfW / 2)) - (_c * _x) - (_s * _y), ((0 + _zoomY + (_surfH / 2)) - (_extraH / 2) - (_c * _y)) + (_s * _x), 1, 1, _angle, c_white, 0.5);
draw_surface_ext(surf, (((0 + _zoomX) - (_extraW / 2)) + (_surfW / 2)) - (_c * _x) - (_s * _y), ((0 + _zoomY + (_surfH / 2)) - (_extraH / 2) - (_c * _y)) + (_s * _x), 1, 1, _angle, c_white, 1);
