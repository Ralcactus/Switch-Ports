testvariablenothing = false;
get_cams();
var bg_xspd = global.microgame_hspd;
var _scale = obj_macro_knives_controller.zoom_game;
var _zoom = obj_macro_knives_controller.zoom;
var _intro_yoff = -obj_macro_knives_controller.boss_intro_y * 0.31;
var _w = sprite_get_width(spr_macro_knives_bg) * _scale;
back_x += (bg_xspd * global.delta_game_factor);

if (back_x < -_w)
    back_x += _w;

var _x = 0;

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_macro_knives_bg, 0, _x + back_x, camy + (540 * (_zoom - _scale)) + _intro_yoff, _scale, _scale, 0, c_white, 1);
    _x += _w;
}

_w = sprite_get_width(spr_macro_knives_bg_train) * _scale;
train_x += (bg_xspd * 1.3 * global.delta_game_factor);

if (train_x < -_w)
    train_x += _w;

_x = 0;

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_macro_knives_bg_train, 0, _x + train_x, camy + (1080 * _scale) + _intro_yoff, _scale, _scale, 0, c_white, 1);
    _x += _w;
}

_w = sprite_get_width(spr_macro_knives_bg_ceiling) * _scale;
ceiling_x += (bg_xspd * 1.08 * global.delta_game_factor);

if (ceiling_x < -_w)
    ceiling_x += _w;

_x = 0;

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_macro_knives_bg_ceiling, 0, _x + ceiling_x, camy + (540 * (_zoom - _scale)), _scale, _scale, 0, c_white, 1);
    _x += _w;
}
