if (instance_exists(obj_soundtest) || instance_exists(obj_conceptart) || instance_exists(obj_devvideos))
    exit;

draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 0.5 * fade);
draw_set_colour(c_white);
draw_set_font(global.font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
__draw_text_colour_hook(get_game_width() / 2, 100, string_get("menu/extras"), c_white, c_white, c_white, c_white, fade);
draw_sprite_ext(spr_extras, 0, (get_game_width() / 2) - 180, get_game_height() / 2, 1, 1, 0, c_white, ((selected == 0) ? 1 : 0.5) * fade);
draw_sprite_ext(spr_extras, 1, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, ((selected == 1) ? 1 : 0.5) * fade);
draw_sprite_ext(spr_extras, 2, (get_game_width() / 2) + 180, get_game_height() / 2, 1, 1, 0, c_white, ((selected == 2) ? 1 : 0.5) * fade);
