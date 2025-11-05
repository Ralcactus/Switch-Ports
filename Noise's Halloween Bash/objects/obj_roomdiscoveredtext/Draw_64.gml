if (scr_hudroom())
{
    draw_set_font(global.font);
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_left);
    draw_text_fancy(30, get_game_height() - 78, text, c_white, alpha);
}
