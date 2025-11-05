draw_set_font(global.font);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_fancy(get_game_width() / 2, get_game_height() - 124, string_get("exitprompt/question"), c_white, alpha);
draw_set_halign(fa_right);
draw_text_fancy((get_game_width() / 2) - 20, get_game_height() - 94, string_get("exitprompt/yes"), c_white, alpha);
draw_set_halign(fa_left);
draw_text_fancy((get_game_width() / 2) + 20, get_game_height() - 94, string_get("exitprompt/no"), c_white, alpha);
