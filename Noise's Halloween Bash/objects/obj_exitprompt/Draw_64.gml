draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 0.4);
draw_set_font(global.font);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_fancy(get_game_width() / 2, (get_game_height() / 2) - 20, string_get("menu/title/exitquestion"), c_white, 1);
draw_set_halign(fa_right);
draw_text_fancy((get_game_width() / 2) - 20, (get_game_height() / 2) + 20, string_get("menu/title/exityes"), c_white, 1);
draw_set_halign(fa_left);
draw_text_fancy((get_game_width() / 2) + 20, (get_game_height() / 2) + 20, string_get("menu/title/exitno"), c_white, 1);
