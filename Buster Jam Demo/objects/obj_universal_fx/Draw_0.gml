if (bm != 0)
    gpu_set_blendmode(bm);

draw_sprite_ext(anim_sprite, anim_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (bm != 0)
    gpu_set_blendmode(bm_normal);
