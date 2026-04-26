draw_sprite_ext(sprite_index, image_index, pizz_x, pizz_y, 1, 1, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (botsactive)
    draw_text(pizz_x + 158, pizz_y - 55, string(botcount));

draw_set_halign(fa_left);
draw_set_valign(fa_top);
