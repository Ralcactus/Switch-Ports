testvariablenothing = false;

if (!ready || instance_exists(obj_leaderboard))
    exit;

draw_set_font(global.font_dialogue_outline);
var _x = 960 - (text_linemaxW / 2);
_x = 500;
var _y = 470;

if (array_length(text_center_info) == 1)
    _y += 96;
else if (array_length(text_center_info) == 2)
    _y += 48;

type_index = string_length(splash_text);

if (splash_draw)
{
    scr_draw_dialogue(_x, _y + wizard_yoff, undefined, splash_text, true, undefined, 96);
    draw_sprite_ext(spr_frenzy_gameover_wizard, 0, 255, 608 + wizard_yoff, 1, 1, 0, c_white, 1);
}

type_index = string_length(splash_text);
time += (0.1 * global.delta_game_factor);
