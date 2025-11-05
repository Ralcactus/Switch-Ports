if (alpha <= 0)
    exit;

draw_set_font(global.font);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_fancy(get_game_width() / 2, get_game_height() - 156, text, c_white, alpha);
