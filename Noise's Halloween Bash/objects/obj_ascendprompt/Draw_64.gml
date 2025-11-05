draw_set_font(global.font);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_fancy(get_game_width() / 2, get_game_height() - 124, string_shift(string_get("ascension/question"), 999), c_white, alpha);
draw_set_halign(fa_right);
draw_text_fancy((get_game_width() / 2) - 20, get_game_height() - 94, string_get("ascension/yes"), c_white, alpha);
draw_set_halign(fa_left);
draw_text_fancy((get_game_width() / 2) + 20, get_game_height() - 94, string_get("ascension/no"), c_white, alpha);
