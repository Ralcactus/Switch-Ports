shader_set(sha_flash);

with (obj_grodiespawn)
{
    if (visible)
        draw_sprite_ext(anim_sprite, anim_index, x + xshake + xoff, (y + yshake + yoff) - 50, xscale, yscale, 0, c_white, flash_alpha);
}

with (obj_player)
{
    if (flash_white)
        draw_sprite_ext(anim_sprite, anim_index, x, y, facing, 1, 0, c_white, flash_white_alpha);
}

shader_reset();
