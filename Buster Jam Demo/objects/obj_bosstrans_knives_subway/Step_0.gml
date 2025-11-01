testvariablenothing = false;
var _w = sprite_get_width(spr_bosstrans_knives_4_bg);
bg_x += (bg_xspd * global.delta_game_factor);

if (bg_x > _w)
    bg_x -= _w;

time += (0.04 * global.delta_game_factor);
camx_move += (2 * global.delta_game_factor);
