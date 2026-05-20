if (arrayContains(seed, "ghostDie") && !arrayContains(seed, "drawN"))
{
    image_alpha = ghost_die;
    draw_self();
}

if (arrayContains(seed, "draw"))
    ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha, bright);
