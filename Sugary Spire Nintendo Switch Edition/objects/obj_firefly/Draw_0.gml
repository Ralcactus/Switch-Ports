pal_swap_set(spr_fireflyLight, 1 - (lightIndex / 4), false)
draw_sprite_ext(sprite_index, image_index, x, y + yoffset, image_xscale, image_yscale, 0, c_white, 1)
pal_swap_reset()
