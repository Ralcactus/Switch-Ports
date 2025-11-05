if (global.noControlType)
{
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1);
    draw_set_font(global.font);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text_fancy(get_game_width() / 2, get_game_height() / 2, string_get("menu/noinput"), c_white, 1, true, input_profile_get(), 0, true);
    draw_sprite_ext(spr_controllerdisconnected, nocontrollerind, 0, get_game_height(), 1, 1, 0, c_white, 1);
}

draw_sprite(spr_newinput, 0, detectedx, 143);
var _ind = 0;

if (wasusinggamepad)
    _ind = 1;

draw_sprite(spr_newinput_type, _ind, detectedx + 151, 145);
