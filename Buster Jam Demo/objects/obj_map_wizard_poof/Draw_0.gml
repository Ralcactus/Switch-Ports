testvariablenothing = false;
gpu_set_blendmode(bm_add);
draw_sprite_ext(anim_sprite, anim_index, x, y, image_xscale * flash_scale, image_yscale * flash_scale, 0, c_purple, flash_alpha);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(anim_sprite, anim_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
