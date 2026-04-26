pal_swap_set(paletteSprite, paletteSelect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, image_blend, image_alpha);
pal_swap_reset();
