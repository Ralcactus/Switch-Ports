bg_x += (1 * global.delta_game_factor * 0.5);
bg_y += (0.5 * global.delta_game_factor * 0.5);
var _w = sprite_get_width(spr_micro_ballbattle_bg);
var _h = sprite_get_height(spr_micro_ballbattle_bg);

if (bg_x > _w)
    bg_x -= _w;

if (!surface_exists(surf_bg))
    surf_bg = surface_create(controller.game_width, controller.game_height);

bg_x *= 0.5;
bg_y *= 0.5;
surface_set_target(surf_bg);
draw_sprite(spr_micro_ballbattle_bg, 1, bg_x, bg_y);
draw_sprite(spr_micro_ballbattle_bg, 1, bg_x, bg_y - _h);
draw_sprite(spr_micro_ballbattle_bg, 1, bg_x - _w, bg_y);
draw_sprite(spr_micro_ballbattle_bg, 1, bg_x - _w, bg_y - _h);
surface_reset_target();
bg_x *= 2;
bg_y *= 2;
shader_set(sha_heatwave);
shader_set_uniform_f(uTime, time_bg);
shader_set_uniform_f(uFreq, 75);
shader_set_uniform_f(uSize, 30);
var tex = surface_get_texture(surf_bg);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_surface_ext(surf_bg, 0, 0, 1, 1, 0, c_white, 1);
shader_reset();
var _alpha = 0.5;
draw_sprite_ext(spr_micro_ballbattle_bg, 0, bg_x, bg_y, 1, 1, 0, c_white, _alpha);
draw_sprite_ext(spr_micro_ballbattle_bg, 0, bg_x, bg_y - _h, 1, 1, 0, c_white, _alpha);
draw_sprite_ext(spr_micro_ballbattle_bg, 0, bg_x - _w, bg_y, 1, 1, 0, c_white, _alpha);
draw_sprite_ext(spr_micro_ballbattle_bg, 0, bg_x - _w, bg_y - _h, 1, 1, 0, c_white, _alpha);
var _amnt = 10;
var _x = 584 + random_range(-ball_shake * _amnt, ball_shake * _amnt);
var _y = 156 + random_range(-ball_shake * _amnt, ball_shake * _amnt);
draw_sprite(ball_sprite, ball_ind, _x, _y);
ball_shake = approach(ball_shake, 0, 0.12);
draw_self();

if (draw_dialogue)
{
    gpu_set_texfilter(false);
    draw_set_font(fnt_ballbattle);
    scr_draw_dialogue(44, 50, 1920, text, true, 0, undefined, false);
    gpu_set_texfilter(global.texfilter);
}

var _ind;

if (attack == 0)
    _ind = 0;
else
    _ind = 1;

var _xoff = dsin(time * 45 * pi * 0.8) * 6 * 0.24;
var _yoff = dcos(time * 40 * pi * 0.8) * 4 * 0.24;

if (chose == 0)
{
    _xoff = random_range(-1, 1);
    _yoff = random_range(-1, 1);
}

if (!(chose != -4 && chose != 0))
    draw_sprite(spr_micro_ballbattle_button, _ind + ((selected == 0 && chose == -4) * flash_ind), 73 + _xoff, 696 + _yoff);

_xoff = dsin(time * 50 * pi * 0.8) * -6 * 0.24;
_yoff = dcos(time * 45 * pi * 0.8) * -4 * 0.24;

if (chose == 1)
{
    _xoff = random_range(-1, 1);
    _yoff = random_range(-1, 1);
}

if (attack == 1)
    _ind = 0;
else
    _ind = 1;

if (!(chose != -4 && chose != 1))
    draw_sprite(spr_micro_ballbattle_button, _ind + ((selected == 1 && chose == -4) * flash_ind), 634 + _xoff, 696 + _yoff);

if (chose != attack && chose != -4)
    _ind = 1;
else
    _ind = 0;

draw_sprite(spr_micro_ballbattle_ui, _ind, 1269, 650);

if (chose != -4)
    exit;

if (selected == 0)
    _x = 73 + (sprite_get_width(spr_micro_ballbattle_button) / 2);
else
    _x = 634 + (sprite_get_width(spr_micro_ballbattle_button) / 2);

_y = 648;
arrow_ind += ((sprite_get_speed(spr_micro_ballbattle_arrow) / 60) * global.delta_game_factor);
draw_sprite(spr_micro_ballbattle_arrow, arrow_ind, _x, _y);
