draw_sprite_ext(anim_sprite, anim_index, x + 74, ((y + 148) - 40) + yoff, xscale, yscale, angle, c_white, 1);
shader_set(sha_flash);
draw_sprite_ext(anim_sprite, anim_index, x + 74, ((y + 148) - 40) + yoff, xscale, yscale, angle, c_white, flash_alpha);
shader_reset();
