testvariablenothing = false;
var _posX = camx_move;

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
var _w = sprite_get_width(spr_bosstrans_knives_4_bg);

for (var i = 0; i < 8; i++)
    draw_sprite_ext(spr_bosstrans_knives_4_bg, 0, (-bg_x + (_w * i)) - (_w * 2), 0, 1, 1, 0, c_white, 1);

_w = sprite_get_width(spr_bosstrans_knives_4_train);
var _x = -370 - _w - 200;
var _y = 387;
draw_sprite_ext(spr_bosstrans_knives_4_train, 2, _posX + _x + ((_w - 108) * 2) + (sin(pi * time) * 3), _y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_bosstrans_knives_4_train, 1, ((_posX + _x + _w) - 108) + (sin((pi * time) + 2) * 3), _y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_bosstrans_knives_4_train, 0, _posX + _x + (sin(pi * time) * 3), _y, 1, 1, 0, c_white, 1);
_w = sprite_get_width(spr_bosstrans_knives_4_ground);
var _h = sprite_get_height(spr_bosstrans_knives_4_ground);

for (var i = 0; i < 8; i++)
    draw_sprite_ext(spr_bosstrans_knives_4_ground, 0, (-bg_x + (_w * i)) - (_w * 2), (1080 - _h) + 284, 1, 1, 0, c_white, 1);

surface_reset_target();
draw_surface(surf, 0, 0);
scr_draw_transition_gui();
