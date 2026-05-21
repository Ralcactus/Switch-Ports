display_set_gui_size(camw, camh);
pal_swap_set(spr_collect_palette, col, 0);
draw_sprite_ext(sprite_index, -1, drawx, drawy, drawxscale, drawyscale, 0, c_white, image_alpha);
pal_swap_reset();
display_set_gui_size(960, 540);
