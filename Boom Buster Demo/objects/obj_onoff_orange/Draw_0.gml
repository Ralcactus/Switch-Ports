for (var i = 0; i < image_xscale; i++)
{
    for (var j = 0; j < image_yscale; j++)
        draw_sprite_ext(anim_sprite, anim_index, x + (i * 64) + 32, y + (j * 64) + 32, scale, scale, 0, c_white, image_alpha);
}
