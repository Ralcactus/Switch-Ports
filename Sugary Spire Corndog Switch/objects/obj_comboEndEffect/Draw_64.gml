draw_sprite(spr_comboEnd, 0, x, y);
draw_sprite(spr_comboTitles, title, x, y);
draw_set_font(global.smallfont);
draw_set_halign(fa_center);
draw_text(x, y + 70, comboScoreMax);
draw_text(x, y + 90, comboScore);
