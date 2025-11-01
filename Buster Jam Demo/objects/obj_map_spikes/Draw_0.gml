for (var i = 0; i < image_xscale; i++)
{
    for (var j = 0; j < image_yscale; j++)
        draw_sprite_ext(anim_sprite, anim_index, x + (i * 96), y + (j * 96) + z, 1, 1, 0, c_white, 1);
}
