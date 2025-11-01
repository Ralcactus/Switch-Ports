draw_set_alpha(bg_alpha);
draw_set_color(#FF6A00);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
