testvariablenothing = false;
draw_sprite_ext(spr_bosstrans_knives_1_bg, 0, 0, 0, 1, 1, 0, c_white, 1);
var _spd = 10;
var _xoff = 0;

if (snake_side == -1)
    _xoff = 1920;

draw_sprite_ext(snake_spr, snake_ind, _xoff, 0 + snake_yoff, snake_side, 1, 0, c_white, 1);

if (!surface_exists(surf_body_back))
    surf_body_back = surface_create(1920, 1080);

surface_set_target(surf_body_back);
draw_clear_alpha(c_white, 0);
var _w = sprite_get_width(spr_bosstrans_knives_1_body_back);
body_back_x += (_spd * 0.55 * global.delta_game_factor);

if (body_back_x > _w)
    body_back_x -= body_back_x;

_xoff = -_w;

for (var i = 0; i < 3; i++)
    draw_sprite_ext(spr_bosstrans_knives_1_body_back, 0, body_back_x + (_w * i) + _xoff, 70, 1, 1, 0, c_white, 1);

surface_reset_target();
shader_set(sha_panorama);
var _val = 72;
shader_set_uniform_f(shader_get_uniform(shader_current(), "zoom"), _val);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zDir"), -1);
draw_surface_ext(surf_body_back, 0, 0, 1, 1, 0, c_white, 1);
shader_reset();
draw_sprite_ext(buster_spr, buster_ind, 960, 0, buster_facing, 1, 0, c_white, 1);

if (!surface_exists(surf_body_front))
    surf_body_front = surface_create(1920, 600);

surface_set_target(surf_body_front);
draw_clear_alpha(c_white, 0);
_w = sprite_get_width(spr_bosstrans_knives_1_body_front);
body_front_x += (_spd * global.delta_game_factor);

if (body_front_x > _w)
    body_front_x -= body_front_x;

_xoff = -_w;

for (var i = 0; i < 3; i++)
    draw_sprite_ext(spr_bosstrans_knives_1_body_front, 0, -body_front_x + (_w * i) + _xoff, -480, 1, 1, 0, c_white, 1);

surface_reset_target();
shader_set(sha_panorama);
_val = 352;
shader_set_uniform_f(shader_get_uniform(shader_current(), "zoom"), _val);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zDir"), 1);
draw_surface_ext(surf_body_front, 0, 600, 1, 1, 0, c_white, 1);
shader_reset();
