if (arrayContains(seed, "forceBlack"))
    color = 0;

if (arrayContains(seed, "drawN"))
{
    if (arrayContains(seed, "ghostDie"))
        image_alpha = ghost_die;
    
    draw_self();
}
