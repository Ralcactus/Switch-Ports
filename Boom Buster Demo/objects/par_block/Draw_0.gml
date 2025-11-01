if (pal_sprite != -4)
    pal_swap(pal_sprite, pal_sub, pal_ind);

draw_sprite_ext(anim_sprite, anim_index, x, y - (8 * scale), 1 + scale, 1 + scale, 0, c_white, 1);

if (pal_sprite != -4)
    shader_reset();

if (screen_spr != -4)
    draw_sprite_ext(screen_spr, anim_index, x, y - (8 * scale), 1 + scale, 1 + scale, 0, c_white, 1);
