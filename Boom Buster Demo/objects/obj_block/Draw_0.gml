for (var i = 0; i < image_xscale; i++)
{
    for (var j = 0; j < image_yscale; j++)
        draw_sprite(sprite_index, image_index, x + (i * 64), y + (j * 64));
}
