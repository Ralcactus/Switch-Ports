draw_sprite(sprite_index, 0, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
draw_set_font(global.lapfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x + irandom_range(-2, 2) + 40, y + irandom_range(-2, 2), string(global.lapcount + 1));
